local dollRendering = {}

local set_color = rendering.set_color
local get_visible = rendering.get_visible
local set_visible = rendering.set_visible
local set_x_scale = rendering.set_x_scale
local draw_animation = rendering.draw_animation
local get_animation = rendering.get_animation

local working = defines.entity_status.working
local low_power = defines.entity_status.low_power

local max = math.max
local random = math.random
local floor = math.floor

-- constants

local stride = 6

-- state

-- Vars
local link1, link2, link3, link4 = {}, {}, {}, {}
local previousSpeed = {}
local previousXscale = {}
local previousAmmo = {}
local switchTick = {}
local currentLink = {}
local linkBonus = {}
local combatCooldown = {}

dollRendering.state = nil

dollRendering.colorFordoll = nil

dollRendering.init = function (state)
    dollRendering.state = state
    if dollRendering.state then
        local colorFunctions = dollRendering.colorMath.colorFunctions
        dollRendering.colorFordoll = colorFunctions[dollRendering.state.lastColorFunc]
    end
    return state
end

dollRendering.initialState = {
    lastColorFunc = 1,
    direction = 1,
    meanderingTick = 0,
}

dollRendering.configurationChanged = function ()
    dollRendering.init(dollRendering.initialState)
end

dollRendering.getInfoForForce = function (force, dollRenderers, researchColor)
    local dollsForForce = dollRenderers.dollsForForce(force.index)
    if dollsForForce then
        local playerPosition = {x = 0, y = 0}
        if force.players[1] then
            playerPosition = force.players[1].position
        end
        return dollsForForce, playerPosition
    else
        return nil
    end
end

dollRendering.updateRenderer = function (doll, playerPosition, dollRenderers)
    
    --log(doll.selected_gun_index)
    

    local runAnimation = dollRenderers.getRenderObjects(doll, 1)
    if get_visible(runAnimation) then
      set_visible(runAnimation, false)
    end
    local attackAnimation = dollRenderers.getRenderObjects(doll, 2)
    if get_visible(attackAnimation) then
      set_visible(attackAnimation, false)
    end
    local idleAnimation = dollRenderers.getRenderObjects(doll, 3)
    if get_visible(idleAnimation) then
      set_visible(idleAnimation, false)
    end
    local isAmmo = {}
    isAmmo[doll] = doll.get_inventory(defines.inventory.spider_ammo)[doll.selected_gun_index].valid_for_read
    local isAmmoChanged = {}
    local ammoAllSlots = {}
    if doll.get_inventory(defines.inventory.spider_ammo)[1].valid_for_read == false or doll.get_inventory(defines.inventory.spider_ammo)[2].valid_for_read == false then
      ammoAllSlots[doll] = false
    end
    if previousAmmo[doll] == nil then
      previousAmmo[doll] = 0
    end
    if currentLink[doll] == nil then
      currentLink[doll] = 0
    end
    if previousXscale[doll] == nil then
      previousXscale[doll] = 1
    end
    if linkBonus[doll] == nil then
      linkBonus[doll] = 1
    end
    if combatCooldown[doll] == nil then
      combatCooldown[doll] = 0
    end

    if isAmmo[doll] then
      if doll.get_inventory(defines.inventory.spider_ammo)[doll.selected_gun_index].ammo < previousAmmo[doll] then
          isAmmoChanged[doll] = true
          combatCooldown[doll] = game.tick + 60 * 0.25
          --log("Combat Cooldown: "..(game.tick + 60 * 5).." Tick: "..game.tick)
      end
      --log("Slot ammo: "..doll.get_inventory(defines.inventory.spider_ammo)[doll.selected_gun_index].ammo.." Slot: "..doll.selected_gun_index)
    end
    local count = doll.grid.count("dummy-link-equipment")
    if count > 4 then 
        count = 4
    end
    local linkAmount = {}
    linkAmount[doll] = count
    local animation = runAnimation
    if isAmmoChanged[doll] or combatCooldown[doll] > game.tick then --If Attacking or in combat, Attack

        doll.stop_spider()
        if not get_visible(attackAnimation) then
            set_visible(attackAnimation, true)
        end
        animation = attackAnimation

        if switchTick[doll] == nil then
            switchTick[doll] = 0
        end
        
        if game.tick >= switchTick[doll] then
            if doll.selected_gun_index == 1 then
                if ammoAllSlots then
                    doll.selected_gun_index = 2
                end
                switchTick[doll] = game.tick + doll.prototype.guns[doll.name.."-gun"].attack_parameters.cooldown * linkBonus[doll]
            else
                if ammoAllSlots then
                    doll.selected_gun_index = 1
                end
                switchTick[doll] = game.tick + (doll.prototype.guns[doll.name.."-gun"].attack_parameters.cooldown * 15)  * linkBonus[doll]
            end
            if random() > linkBonus[doll] then
                doll.get_inventory(defines.inventory.spider_ammo)[doll.selected_gun_index].add_ammo(1)
                doll.health = doll.health + 5
                combatCooldown[doll] = game.tick + 60 * 0.25
            end
        end

    elseif doll.speed ~= 0 then --If moving, Walk

        --log(tostring(doll.torso_orientation))
        local mult = 10^(3)
        local speed = math.floor(doll.speed * mult + 0.5) / mult
        local prevSpeed = math.floor(previousSpeed[doll] * mult + 0.5) / mult
        if math.abs(prevSpeed - speed) >= 0.01 and prevSpeed >= speed then --If change in speed is low and decreasing, Stop
            doll.stop_spider()
            log("Speed: "..speed.." PrevSpeed: "..prevSpeed)
        end

        if not get_visible(runAnimation) then
            set_visible(runAnimation, true)
        end
            
    else -- If not attacking or walking, Be Idle
        if not get_visible(idleAnimation) then
            set_visible(idleAnimation, true)
        end
        animation = idleAnimation
    end

    if doll.torso_orientation == 0.5 or doll.torso_orientation == 0 then
        set_x_scale(animation, previousXscale[doll])
    elseif doll.torso_orientation < 0.625 then
        set_x_scale(animation, 1)
        previousXscale[doll] = 1
    else 
        set_x_scale(animation, -1)
        previousXscale[doll] = -1
    end

    if link1[doll] ~= nil then
        if currentLink[doll] > 0 and rendering.is_valid(link1[doll]) then
            if get_animation(link1[doll]) ~= get_animation(animation) then
                rendering.destroy(link1[doll])
                currentLink[doll] = currentLink[doll] - 1
            end
        end
    end

    if link2[doll] ~= nil then
        if currentLink[doll] > 0 and rendering.is_valid(link2[doll]) then
            if get_animation(link2[doll]) ~= get_animation(animation) then
                rendering.destroy(link2[doll])
                currentLink[doll] = currentLink[doll] - 1
            end
        end
    end

    if link3[doll] ~= nil then
        if currentLink[doll] > 0 and rendering.is_valid(link3[doll]) then
            if get_animation(link3[doll]) ~= get_animation(animation) then
                rendering.destroy(link3[doll])
                currentLink[doll] = currentLink[doll] - 1
            end
        end
    end

    if link4[doll] ~= nil then
        if currentLink[doll] > 0 and rendering.is_valid(link4[doll]) then
            if get_animation(link4[doll]) ~= get_animation(animation) then
                rendering.destroy(link4[doll])
                currentLink[doll] = currentLink[doll] - 1
            end
        end
    end

    if doll.follow_target ~= nil then
      doll.follow_offset = {1, 1}
    end

    local linkOffsetXY = {1.75, 1.75}
    local linkOffsetsHorizontal = {{-linkOffsetXY[1], -linkOffsetXY[2]}, 
                                    {-linkOffsetXY[1], linkOffsetXY[2]},
                                    {-linkOffsetXY[1] * 2, -linkOffsetXY[2] * 2},
                                    {-linkOffsetXY[1] * 2, linkOffsetXY[2] * 2}}
    
    local linkOffsetsVertical    = {{-linkOffsetXY[2], -linkOffsetXY[1]}, 
                                    {linkOffsetXY[2], -linkOffsetXY[1]},
                                    {-linkOffsetXY[2] * 2, -linkOffsetXY[1] * 2},
                                    {linkOffsetXY[2] * 2, -linkOffsetXY[1] * 2}}
    local linkOffsets = {}

    if doll.torso_orientation == 0.5 or doll.torso_orientation == 0 then
        linkOffsets = linkOffsetsVertical
    else
        linkOffsets = linkOffsetsHorizontal
    end

    if linkAmount[doll] > 0  and currentLink[doll] < 1 then
        log(linkAmount[doll])
        log("First link")
        link1[doll] = draw_animation{
            animation = get_animation(animation),
            surface = doll.surface,
            target = doll,
            x_scale = previousXscale[doll],
            y_scale = scale,
            render_layer = "object",
            animation_offset = floor(random()*300),
            visible = true,
        }
        rendering.set_target(link1[doll], doll, linkOffsets[1])
        linkBonus[doll] = 1 - (0.15625)
        currentLink[doll] = currentLink[doll] + 1
    end

    if linkAmount[doll] > 1  and currentLink[doll] < 2 then
        link2[doll] = draw_animation{
            animation = get_animation(animation),
            surface = doll.surface,
            target = doll,
            x_scale = previousXscale[doll],
            y_scale = scale,
            render_layer = "object",
            animation_offset = floor(random()*300),
            visible = true,
        }
        rendering.set_target(link2[doll], doll, linkOffsets[2])
        linkBonus[doll] = linkBonus[doll] - (0.15625)
        currentLink[doll] = currentLink[doll] + 1
    end

    if linkAmount[doll] > 2  and currentLink[doll] < 3 then
        link3[doll] = draw_animation{
            animation = get_animation(animation),
            surface = doll.surface,
            target = doll,
            x_scale = previousXscale[doll],
            y_scale = scale,
            render_layer = "object",
            animation_offset = floor(random()*300),
            visible = true,
        }
        rendering.set_target(link3[doll], doll, linkOffsets[3])
        linkBonus[doll] = linkBonus[doll] - (0.15625)
        currentLink[doll] = currentLink[doll] + 1
    end

    if linkAmount[doll] > 3  and currentLink[doll] < 4 then
        link4[doll] = draw_animation{
            animation = get_animation(animation),
            surface = doll.surface,
            target = doll,
            x_scale = previousXscale[doll],
            y_scale = scale,
            render_layer = "object",
            animation_offset = floor(random()*300),
            visible = true,
        }
        rendering.set_target(link4[doll], doll, linkOffsets[4])
        linkBonus[doll] = linkBonus[doll] - (0.15625)
        currentLink[doll] = currentLink[doll] + 1
    end


    if doll.get_inventory(defines.inventory.spider_ammo)[doll.selected_gun_index].valid_for_read then
        previousAmmo[doll] = doll.get_inventory(defines.inventory.spider_ammo)[doll.selected_gun_index].ammo
    else
        previousAmmo[doll] = 0
    end
    previousSpeed[doll] = doll.speed
end

dollRendering.updateRenderers = function (event, dollRenderers, researchColor)
    for name, force in pairs(game.forces) do
        local dollsForForce, playerPosition = dollRendering.getInfoForForce(force, dollRenderers, researchColor)
        if dollsForForce then
            for unitNumber, doll in pairs(dollsForForce) do
                if not doll.valid then
                    softErrorReporting.showModError("errors.registered-doll-deleted")
                    dollRenderers.reloaddolls()
                    return
                end
                dollRendering.updateRenderer(doll, playerPosition, dollRenderers)
            end
        end
    end
end

return dollRendering