local path = util.path("data/units/m4_sopmodmod/")
local name = names.units.m4_sopmodmod
local character_icon_path = util.path("graphics/icons/m4-sopmodmod-icon.png")
local iconSize = 512

local base = util.copy(data.raw.character.character)
local unit_scale = 0.5

local attack_range = 20

local remains =

{
  type = "corpse",
  name = "tdoll-remains",
  icon = "__base__/graphics/icons/iron-chest.png",
  icon_size = 64, icon_mipmaps = 4,
  flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
  subgroup = "storage-remnants",
  order = "a-b-a",
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  tile_width = 1,
  tile_height = 1,
  selectable_in_game = false,
  time_before_removed = 60 * 60 * 15, -- 15 minutes
  final_render_layer = "remnants",
  remove_on_tile_placement = false,
  animation =
  {
    filename = "__Girls_Front_Line_TDolls__/graphics/units/m4_sopmodmod/m4-sopmodmod-death.png",
    width = 331,
    height = 244,
    frame_count = 1,
    axially_symmetrical = false,
    direction_count = 1,
    scale = unit_scale,
    middle_orientation = 0.75,
    repeat_count = 1,
  }
}

local bot =
{
  type = "unit",
  name = name,
  localised_name = {name},
  icon = character_icon_path,
  icon_size = iconSize,
  icon_mipmaps = base.icon_mipmaps,
  icons = {
    {
      icon = character_icon_path,
      icon_size = iconSize,
      icon_mipmaps = 4 --base.icon_mipmaps
    },
  },
  flags = util.unit_flags(),
  map_color = {b = 0.5, g = 1},
  enemy_map_color = {r = 1},
  max_health = 200,
  radar_range = 1,
  order="i-a",
  subgroup = "iron-units",
  can_open_gates = true,
  healing_per_tick = 0.01,
  minable = {result = name, mining_time = 2},
  collision_box = {{-0.25, -0.25}, {0.25, 0.25}},
  collision_mask = util.ground_unit_collision_mask(),
  max_pursue_distance = 30,
  resistances = nil,
  old_resistances = {
    {
      type = "acid",
      decrease = 2,
      percent = 50
    },
	{
      type = "physical",
      decrease = 3,
      percent = 50
    }
  },
  min_persue_time = 60 * 15,
  selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
  sticker_box = {{-0.3, -1}, {0.2, 0.3}},
  distraction_cooldown = (15),
  move_while_shooting = false,
  can_open_gates = true,
  ai_settings =
  {
    do_separation = true
  },
  attack_parameters =
  {
    type = "projectile",
    ammo_category = "bullet",
    warmup = 5,
    cooldown = 45,
    cooldown_deviation = 0.25,
    range = attack_range,
    min_attack_distance = attack_range - 2,
    projectile_creation_distance = 0.5,
    --lead_target_for_projectile_speed = 1,
    sound =
    {
      variations =
      {
        {
          filename = "__Girls_Front_Line_TDolls__/sound/ARShoot01.ogg",
		      volume = 0.55
        },
        {
          filename = "__Girls_Front_Line_TDolls__/sound/ARShoot02.ogg",
		      volume = 0.55
        },
		    {
          filename = "__Girls_Front_Line_TDolls__/sound/ARShoot03.ogg",
		      volume = 0.55
        }
      },
      aggregation =
      {
        max_count = 2,
        remove = true,
        count_already_playing = true
      }
    },
	
	
	
    ammo_type =
    {
      category = util.ammo_category("iron-units"),
      target_type = "entity",
      action =
      {
        type = "direct",
        action_delivery =
        {
          --{
          --type = "projectile",
          --projectile = name.." Projectile",
          --starting_speed = 1,
          --starting_speed_deviation = 0.05,
          --direction_deviation = 0.1,
          --range_deviation = 0.1,
          --max_range = attack_range + 2,
          --},
          {
            type = "instant",
            source_effects =
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            },
            target_effects =
            {
              {
                type = "damage",
                damage = {amount = 10 , type = util.damage_type("physical")}
              },
              {
                type = "create-entity",
                offset_deviation = {{-0.5, -0.5},{0.5, 0.5}},
                offsets = {{0,0}},
                entity_name = "explosion-hit"
              }
            }
          }
        }
      }
    },
    animation = {
                layers = {
                    {
                        filename = "__Girls_Front_Line_TDolls__/graphics/units/m4_sopmodmod/m4-sopmodmod-attack-effect.png",
                        width = 158,
                        height = 176,
                        frame_count = 34,
                        axially_symmetrical = false,
                        direction_count = 2,
                        scale = unit_scale,
                        --frame_sequence = { 1, 2, 3, 4, 3, 4, 3, 4 },
                        draw_as_glow = true,
                        --shift = { 0.15, 0.15 },
                        middle_orientation = 0.75,
                    },
                    {
                        filename = "__Girls_Front_Line_TDolls__/graphics/units/m4_sopmodmod/m4-sopmodmod-attack.png",
                        width = 158,
                        height = 176,
                        frame_count = 34,
                        axially_symmetrical = false,
                        direction_count = 2,
                        scale = unit_scale,
                        --frame_sequence = { 1, 2, 3, 4, 3, 4, 3, 4 }
                        middle_orientation = 0.75,
                        --run_mode = "backward",
                    },
                    {
                        filename = "__Girls_Front_Line_TDolls__/graphics/units/m4_sopmodmod/m4-sopmodmod-attack.png",
                        width = 158,
                        height = 176,
                        frame_count = 34,
                        axially_symmetrical = false,
                        direction_count = 2,
                        scale = unit_scale,
                        --frame_sequence = { 1, 2, 3, 4, 3, 4, 3, 4 },
                        draw_as_shadow = true,
                        shift = { 0.25, 0 },
                        middle_orientation = 0.75,
                    },
					}
            }
  },
  vision_distance = 40,
  has_belt_immunity = false,
  affected_by_tiles = true,
  movement_speed = 0.25,
  distance_per_frame = 0.1,
  pollution_to_join_attack = 1000,
  dying_explosion = "small-spitter-die",
  corpse = "tdoll-remains",
  dying_sound =
      {
      variations =
      {
		    {
          filename = "__Girls_Front_Line_TDolls__/sound/MarineDeath01.ogg",
		      volume = 0.45
        },
      },  
	  },
	  
	  working_sound=
	  {
    sound =
    {
      {
        filename = "__Girls_Front_Line_TDolls__/sound/MarineCall1.ogg",
        volume = 0.58
      },      
    },
    probability = 1 / (90 * 60), -- average pause between the sound is 12 seconds
    max_sounds_per_type = 10
  },
  
  run_animation = {
            layers = {
                {
                    filename = "__Girls_Front_Line_TDolls__/graphics/units/m4_sopmodmod/m4-sopmodmod-run.png",
                    width = 162,
                    height = 192,
                    frame_count = 24,
                    axially_symmetrical = false,
                    direction_count = 2,
                    scale = unit_scale,
                    middle_orientation = 0.75
                },
                {
                    filename = "__Girls_Front_Line_TDolls__/graphics/units/m4_sopmodmod/m4-sopmodmod-run.png",
                    width = 162,
                    height = 192,
                    frame_count = 24,
                    axially_symmetrical = false,
                    direction_count = 2,
                    scale = unit_scale,
                    draw_as_shadow = true,
                    shift = { 0.25, 0 },
                    -- tint = ERM_UnitTint.tint_shadow(),
                }
            }
        },
}

local projectile = util.copy(data.raw.projectile["shotgun-pellet"])
projectile.name = name.." Projectile"
projectile.force_condition = "not-same"
projectile.hit_at_collision_position = true
projectile.hit_collision_mask = util.projectile_collision_mask()
projectile.action =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "damage",
        damage = {amount = 5 , type = util.damage_type(name)}
      },
      {
        type = "create-entity",
        entity_name = "explosion-hit"
      }
    }
  }
}
projectile.final_action = nil

local item = {
  type = "item",
  name = name,
  localised_name = {name},
  icon = bot.icon,
  icon_size = bot.icon_size,
  icons = bot.icons,
  flags = {},
  subgroup = "iron-units",
  order = "b-"..name,
  stack_size = 50,
  place_result = name
}

local recipe = {
  type = "recipe",
  name = name,
  localised_name = {name},
  enabled = false,
  ingredients =
  {
    {"light-armor", 1},
    {"submachine-gun",1},
    {"firearm-magazine",10}
  },
  energy_required = 15,
  result = name
}

data:extend
{
  remains,
  bot,
  item,
  recipe
}