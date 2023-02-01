names = require("shared")
local handler = require("event_handler")

handler.add_lib(require("script/killcam"))


require("utils.softErrorReporting")

local dollRenderers = require("core.dollRenderers")
local dollRendering = require("core.dollRendering")

-- constants

local colorSwitchFrequency = 75 --Ticks between function calls

-- Track whether state is linked, in order to be able to avoid remote callbacks
-- before proper initialization (when a dependent mod is initialised later in a game)

local initialized = false

local createData = function ()
    global.dollRendererData = dollRenderers.initialState
    global.dollRenderingData = dollRendering.initialState
end

local linkData = function ()
    dollRenderers.init(global.dollRendererData)
    --dollRendering.init(global.dollRenderingData)
    initialized = true
end

local removeOldData = function ()
    global.scalarState = nil
    global.dollsByForce = nil
    global.dollAnimations = nil
end

local init = function()
    createData()
    linkData()
    dollRenderers.reloaddolls()
end

script.on_init(
    function ()
        init()
    end
)

script.on_load(
    function ()
        linkData()
    end
)

script.on_configuration_changed(
    function ()
        removeOldData()
        dollRendering.configurationChanged()
        init()
    end
)

script.on_event(
    {
        defines.events.on_built_entity,
        defines.events.on_robot_built_entity
    },
    function (event)
        dollRenderers.adddoll(event.created_entity)
    end
)

script.on_event(
    {
        defines.events.script_raised_built,
        defines.events.script_raised_revive
    },
    function (event)
        dollRenderers.adddoll(event.entity)
    end
)

script.on_event(
    {
        defines.events.on_entity_died,
        defines.events.on_player_mined_entity,
        defines.events.on_robot_mined_entity,
        defines.events.script_raised_destroy
    },
    function (event)
        dollRenderers.removedoll(event.entity)
    end
)

script.on_event(
    {defines.events.on_forces_merged},
    function (event)
        dollRenderers.reloaddolls()
    end
)
--[[
script.on_nth_tick(
    colorSwitchFrequency,
    function (event)

    end
)]]

script.on_event(
    {defines.events.on_tick},
    function (event)
        dollRendering.updateRenderers(event, dollRenderers, researchColor)
    end
)