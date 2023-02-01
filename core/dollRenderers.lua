require "utils.softErrorReporting"

local dollRenderers = {}

local draw_animation = rendering.draw_animation
local is_valid = rendering.is_valid
local floor = math.floor
local random = math.random

-- state

dollRenderers.state = nil

dollRenderers.init = function (state)
    dollRenderers.state = state
    return state
end

dollRenderers.initialState = {
    dollsByForce = {},
    dollAnimations = {},
    dollScales = {
        ["type-64"] = 1,
        ["m4-sopmodmod"] = 1,
        ["welrod-mkii"] = 1,
    },
}

dollRenderers.setdollScale = function (name, scale)
    dollRenderers.state.dollScales[name] = scale
end

dollRenderers.createAnimation = function (entity)
    --log("Animation Created")
    local scale = dollRenderers.state.dollScales[entity.name]
    dollRenderers.state.dollAnimations.run[entity.unit_number] = draw_animation({
        animation = "Girls_Front_Line_TDolls/"..entity.name.."-run",
        surface = entity.surface,
        target = entity,
        x_scale = scale,
        y_scale = scale,
        render_layer = "object",
        animation_offset = floor(random()*300),
        visible = true,
    })
    dollRenderers.state.dollAnimations.attack[entity.unit_number] = draw_animation({
        animation = "Girls_Front_Line_TDolls/"..entity.name.."-attack",
        surface = entity.surface,
        target = entity,
        x_scale = scale,
        y_scale = scale,
        render_layer = "object",
        animation_offset = floor(random()*300),
        visible = true,
    })
    dollRenderers.state.dollAnimations.wait[entity.unit_number] = draw_animation({
        animation = "Girls_Front_Line_TDolls/"..entity.name.."-wait",
        surface = entity.surface,
        target = entity,
        x_scale = scale,
        y_scale = scale,
        render_layer = "object",
        animation_offset = floor(random()*300),
        visible = true,
    })
end

dollRenderers.isCompatibledoll = function (entity)
    if not entity.type == "spider-vehicle" then return false end
    for name, _ in pairs(dollRenderers.state.dollScales) do
        if entity.name == name then return true end
    end
    return false
end

dollRenderers.adddoll = function (entity)
    if not entity or not entity.valid then
        softErrorReporting.showModError("errors.unregistered-entity-created")
        return
    end
    if dollRenderers.isCompatibledoll(entity) then
        if not dollRenderers.state.dollsByForce[entity.force.index] then
            dollRenderers.state.dollsByForce[entity.force.index] = {}
        end
        local dollUnitNumber = entity.unit_number
        if dollRenderers.state.dollsByForce[entity.force.index][dollUnitNumber] then
            softErrorReporting.showModError("errors.doll-registered-twice")
            return
        end
        dollRenderers.state.dollsByForce[entity.force.index][dollUnitNumber] = entity
        if not dollRenderers.state.dollAnimations.run[dollUnitNumber] then
            dollRenderers.createAnimation(entity)
        end
    end
end

dollRenderers.changedollForce = function (entity, old_force)
    if dollRenderers.isCompatibledoll(entity) then
        if not entity or not entity.valid then
            softErrorReporting.showModError("errors.unregistered-entity-created")
            return
        end

        if not dollRenderers.state.dollsByForce[entity.force.index] then
            dollRenderers.state.dollsByForce[entity.force.index] = {}
        end

        local dollsForOldForce = dollRenderers.state.dollsByForce[old_force.index]
        local dollsForNewForce = dollRenderers.state.dollsByForce[entity.force.index]

        dollsForNewForce[entity.unit_number] = dollsForOldForce[entity.unit_number]
        dollsForOldForce[entity.unit_number] = nil
    end
end

dollRenderers.reloaddolls = function ()
    dollRenderers.state.dollsByForce = {}
    dollRenderers.state.dollAnimations.run = {}
    dollRenderers.state.dollAnimations.attack = {}
    dollRenderers.state.dollAnimations.wait = {}
    rendering.clear("Girls_Front_Line_TDolls")
    for index, doll in ipairs(game.surfaces[1].find_entities_filtered({type = "unit"})) do
        dollRenderers.adddoll(doll)
    end
end

dollRenderers.removedoll = function (entity)
    if dollRenderers.isCompatibledoll(entity) then
        local dollUnitNumber = entity.unit_number
        dollRenderers.state.dollAnimations.run[dollUnitNumber] = nil
        local dollsForForce = dollRenderers.state.dollsByForce[entity.force.index]
        if dollsForForce then
            if dollsForForce[dollUnitNumber] then
                dollsForForce[dollUnitNumber] = nil
            else
                softErrorReporting.showModError("errors.unregistered-doll-deleted")
            end
        else
            softErrorReporting.showModError("errors.unregistered-doll-deleted")
        end
    end
end

dollRenderers.dollsForForce = function (forceIndex)
    return dollRenderers.state.dollsByForce[forceIndex]
end

dollRenderers.getRenderObjects = function(entity, state)
    -- 1 = run, 2 = attack, 3 = idle
    local dollUnitNumber = entity.unit_number
    if not is_valid(dollRenderers.state.dollAnimations.run[dollUnitNumber]) then
        dollRenderers.createAnimation(entity)
        softErrorReporting.showModError("errors.render-object-destroyed")
    end
    if state == 1 then 
        return dollRenderers.state.dollAnimations.run[dollUnitNumber]
    elseif state == 2 then 
        return dollRenderers.state.dollAnimations.attack[dollUnitNumber]
    else
        return dollRenderers.state.dollAnimations.wait[dollUnitNumber]
    end
end

return dollRenderers