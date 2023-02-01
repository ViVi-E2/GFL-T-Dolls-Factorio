local sounds = require("__Girls_Front_Line_TDolls__/sound/sounds")

local iconSize = 512

local base = util.copy(data.raw.character.character)
local unit_scale = 0.5

-- Item Group

data:extend({
  {
    type = "item-subgroup",
    name = "tdoll",
    group = "combat",
    order = "y"
  },
})

-- Everything else

function create_gun(arguments)
  data:extend(
    {
      {
      type = "gun",
      name = arguments.name,
      icon = arguments.icon,
      icon_size = 64, icon_mipmaps = 4,
      flags = {"hidden"},
      subgroup = "gun",
      order = "a[basic-clips]-b[submachine-gun]",
      stack_size = 1,
      attack_parameters =
      {
        type = "projectile",
        ammo_category = arguments.category,
        damage_modifier = arguments.damage_mod,
        cooldown = arguments.cooldown,
        movement_slow_down_factor = 1,
        shell_particle = 
        {
          name = "shell-particle",
          direction_deviation = 0.1,
          speed = 0.1,
          speed_deviation = 0.03,
          center = {0, 0.1},
          creation_distance = -0.5,
          starting_frame_speed = 0.4,
          starting_frame_speed_deviation = 0.1,
        },
        projectile_creation_distance = 1.125,
        range = 18,
        sound = arguments.sounds,
      }
    },
  })
end

function make_doll_leg(spidertron_name, scale, leg_thickness, movement_speed, base_sprite, ending_sprite) --Cannonically good at cliff climbing
  return
  {
    type = "spider-leg",
    name = spidertron_name .. "-leg",

    localised_name = {"entity-name.spidertron-leg"},
    collision_box = {{-0.05, -0.05}, {0.05, 0.05}},
    selection_box = {{-0, -0}, {0, 0}},
    icon = "__base__/graphics/icons/spidertron.png",
    icon_size = 64, icon_mipmaps = 4,
    walking_sound_volume_modifier = 0.6,
    target_position_randomisation_distance = 0.25 * scale,
    minimal_step_size = 2,
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__Girls_Front_Line_TDolls__/sound/TDollStep1.ogg",
          volume = 0.58
        },
        {
          filename = "__Girls_Front_Line_TDolls__/sound/TDollStep2.ogg",
          volume = 0.58
        },
        {
          filename = "__Girls_Front_Line_TDolls__/sound/TDollStep3.ogg",
          volume = 0.58
        },
        {
          filename = "__Girls_Front_Line_TDolls__/sound/TDollStep4.ogg",
          volume = 0.58
        },        
      },
      audible_distance_modifier = 0.5
    },
    part_length = 2,
    initial_movement_speed = 0.06 * movement_speed,
    movement_acceleration = 0.03 * movement_speed,
    max_health = 100,
    movement_based_position_selection_distance = 2,
    selectable_in_game = false,
    graphics_set = create_spidertron_leg_graphics_set(0, 1)
  }
end

local spidertron_animations = require("__Girls_Front_Line_TDolls__/prototypes/animations")

function create_TDoll(arguments)
  local scale = arguments.scale
  local leg_scale = scale * arguments.leg_scale
  data:extend(
  {
    
    {
      type = "corpse",
      name = arguments.name.."-remnants",
      icon = "__base__/graphics/icons/spidertron.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "not-on-map"},
      subgroup = "transport-remnants",
      order = "a-l-a",
      selection_box = {{-1, -1}, {1, 1}},
      tile_width = 1,
      tile_height = 1,
      selectable_in_game = false,
      time_before_removed = 60 * 60 * 15, -- 15 minutes
      final_render_layer = "remnants",
      remove_on_tile_placement = false,
      animation = arguments.remnant

    },

    {
      type = "spider-vehicle",
      name = arguments.name,
      collision_box = {{-1.5 * scale, -1.5 * scale}, {1.5 * scale, 1.5 * scale}},
      sticker_box = {{-1.5 * scale, -1.5 * scale}, {1.5 * scale, 1.5 * scale}},
      selection_box = {{-1.5 * scale, -2 * scale}, {1.5 * scale, 2.25 * scale}},
      drawing_box = {{-3 * scale, -4 * scale}, {3 * scale, 2 * scale}},
      icon = arguments.icon,
      icon_size = arguments.iconSize,
      mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
      open_sound = { filename = "__base__/sound/spidertron/spidertron-door-open.ogg", volume= 0.35 },
      close_sound = { filename = "__base__/sound/spidertron/spidertron-door-close.ogg", volume = 0.4 },
      sound_minimum_speed = 0.1,
      sound_scaling_ratio = 0.6,
      working_sound =
      {
        sound =
        {
          variations =
          {
            {
              filename = "__Girls_Front_Line_TDolls__/sound/"..arguments.name.."/"..arguments.name.."-1.ogg",
              volume = 0.75
            },
            {
              filename = "__Girls_Front_Line_TDolls__/sound/"..arguments.name.."/"..arguments.name.."-2.ogg",
              volume = 0.75
            },
            {
              filename = "__Girls_Front_Line_TDolls__/sound/"..arguments.name.."/"..arguments.name.."-3.ogg",
              volume = 0.75
            },
            {
              filename = "__Girls_Front_Line_TDolls__/sound/"..arguments.name.."/"..arguments.name.."-4.ogg",
              volume = 0.75
            },
            {
              filename = "__Girls_Front_Line_TDolls__/sound/"..arguments.name.."/"..arguments.name.."-5.ogg",
              volume = 0.75
            },
            {
              filename = "__Girls_Front_Line_TDolls__/sound/"..arguments.name.."/"..arguments.name.."-6.ogg",
              volume = 0.75
            },
            {
              filename = "__Girls_Front_Line_TDolls__/sound/"..arguments.name.."/"..arguments.name.."-7.ogg",
              volume = 0.75
            },
          },
        },
        
        activate_sound =
        {
          filename = "__base__/sound/spidertron/spidertron-activate.ogg",
          volume = 0.5
        },
        deactivate_sound =
        {
          filename = "__base__/sound/spidertron/spidertron-deactivate.ogg",
          volume = 0.5
        },
        probability = 1 / (5 * 60), -- average pause between the sound is 12 seconds
        max_sounds_per_type = 10
      },
      icon_size = 64, icon_mipmaps = 4,
      weight = 1,
      braking_force = 1000,
      friction_force = 1000,
      flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
      collision_mask = {},
      minable = {mining_time = 1, result = arguments.name},
      max_health = 500,
      resistances =
      {
        {
          type = "fire",
          decrease = 5,
          percent = 30
        },
        {
          type = "physical",
          decrease = 5,
          percent = 20
        },
        {
          type = "impact",
          decrease = 25,
          percent = 10
        },
        {
          type = "explosion",
          decrease = 0,
          percent = 25
        },
        {
          type = "acid",
          decrease = 10,
          percent = 25
        },
        {
          type = "laser",
          decrease = 0,
          percent = 25
        },
        {
          type = "electric",
          decrease = 0,
          percent = 10
        }
      },
      minimap_representation =
      {
        filename = "__Girls_Front_Line_TDolls__/graphics/icons/map-icon.png",
        flags = {"icon"},
        size = {802, 877},
        scale = 0.045
      },
      corpse = arguments.name.."-remnants",
      dying_explosion = "spidertron-explosion",
      energy_per_hit_point = 1,
      guns = arguments.gun,
      inventory_size = 80,
      equipment_grid = "spidertron-equipment-grid",
      trash_inventory_size = 20,
      height = 1.5  * scale * leg_scale,
      torso_rotation_speed = 1,
      chunk_exploration_radius = 3,
      selection_priority = 51,
      graphics_set = doll_animations(1),
      energy_source =
      {
        type = "void"
      },
      movement_energy_consumption = "250kW",
      automatic_weapon_cycling = false,
      chain_shooting_cooldown_modifier = 1,
      spider_engine =
        {
          legs =
          {
            { -- 1
              leg = arguments.name.."-leg",
              mount_position = {0, 0},
              ground_position = {0, 1},
              blocking_legs = {1},
              leg_hit_the_ground_trigger = nil
            }
          },
          military_target = "spidertron-military-target"
        },
    },
    make_doll_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed),

    {
      type = "item",
      name = arguments.name,
      localised_name = {arguments.name},
      icon = arguments.icon,
      icon_size = iconSize,
      icon_mipmaps = base.icon_mipmaps,
      icons = {
        {
          icon = arguments.icon,
          icon_size = iconSize,
          icon_mipmaps = 4 --base.icon_mipmaps
        },
      },
      flags = {},
      subgroup = "tdoll",
      order = "b-"..arguments.name,
      stack_size = 5,
      place_result = arguments.name
    },
    
    {
      type = "recipe",
      name = arguments.name,
      localised_name = {arguments.name},
      enabled = true,
      ingredients =
      {
        {"light-armor", 1},
        {"submachine-gun",1},
        {"firearm-magazine",10}
      },
      energy_required = 15,
      result = arguments.name
    }
  })
end

-- Type 64 SMG
create_gun{ name = names.units.type_64.."-gun",
            icon = "__base__/graphics/icons/submachine-gun.png",
            damage_mod = 0.8,
            cooldown = 4,
            category = "bullet"}

create_gun{ name = names.units.type_64.."-special",
            icon = "__base__/graphics/icons/slowdown-capsule.png",
            damage_mod = 1,
            cooldown = 30,
            category = "gfl-slow"}

create_TDoll{   name = names.units.type_64,
                scale = unit_scale,
                leg_scale = 1, -- relative to scale
                leg_thickness = 1, -- relative to leg_scale
                leg_movement_speed = 1,
                icon = "__Girls_Front_Line_TDolls__/graphics/icons/type-64-icon.png",
                icon_size = iconSize,
                gun = {names.units.type_64.."-gun", names.units.type_64.."-special"},
                sounds = sounds.SMG,
                corpse = "Girls_Front_Line_TDolls/type-64-die"}

-- M4 Sopmod II Mod III AR
create_gun{ name = names.units.m4_sopmodmod.."-gun",
            icon = "__base__/graphics/icons/submachine-gun.png",
            damage_mod = 2,
            cooldown = 12,
            category = "bullet"}

create_gun{ name = names.units.m4_sopmodmod.."-special",
            icon = "__base__/graphics/icons/grenade.png",
            damage_mod = 2,
            cooldown = 30,
            category = "gfl-grenade"}

create_TDoll{   name = names.units.m4_sopmodmod,
                scale = unit_scale,
                leg_scale = 1, -- relative to scale
                leg_thickness = 1, -- relative to leg_scale
                leg_movement_speed = 1,
                icon = "__Girls_Front_Line_TDolls__/graphics/icons/m4-sopmodmod-icon.png",
                icon_size = iconSize,
                gun = {names.units.m4_sopmodmod.."-gun", names.units.m4_sopmodmod.."-special"},
                sounds = sounds.AR,
                corpse = "Girls_Front_Line_TDolls/m4-sopmodmod-die"}

-- Welrod MKII HG
create_gun{ name = names.units.welrod_mkii.."-gun",
            icon = "__base__/graphics/icons/submachine-gun.png",
            damage_mod = 4,
            cooldown =  18,
            category = "bullet"}

create_gun{ name = names.units.welrod_mkii.."-special",
            icon = "__base__/graphics/icons/submachine-gun.png",
            damage_mod = 4,
            cooldown = 30,
            category = "gfl-debuff"}

create_TDoll{   name = names.units.welrod_mkii,
                scale = unit_scale,
                leg_scale = 1, -- relative to scale
                leg_thickness = 1, -- relative to leg_scale
                leg_movement_speed = 1,
                icon = "__Girls_Front_Line_TDolls__/graphics/icons/welrod-mkii-icon.png",
                icon_size = iconSize,
                gun = {names.units.welrod_mkii.."-gun", names.units.welrod_mkii.."-special"},
                sounds = sounds.HG,
                corpse = "Girls_Front_Line_TDolls/welrod-mkii-die"}