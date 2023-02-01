local path = util.path("data/units/m4_sopmodmod/")
local name = names.units.welrod_mkii
local character_icon_path = util.path("graphics/icons/welrod-mkii-icon.png")
local iconSize = 512
local corpseName = "tdoll-remains-welrod"

local base = util.copy(data.raw.character.character)
local unit_scale = 0.5

local attack_range = 20

local remains =

{
  type = "corpse",
  name = corpseName,
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
    filename = "__Girls_Front_Line_TDolls__/graphics/units/welrod_mkii/welrod-mkii-death.png",
    width = 201,
    height = 202,
    frame_count = 1,
    axially_symmetrical = false,
    direction_count = 1,
    scale = unit_scale,
    middle_orientation = 0.75,
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
  minable = {result = name, mining_time = 1},
  collision_box = {{-0.25, -0.25}, {0.25, 0.25}},
  collision_mask = util.ground_unit_collision_mask(),
  max_pursue_distance = 30,
  resistances =
  {
    {
      type = "physical",
      decrease = 3,
      percent = 20
    },
    {
      type = "acid",
      decrease = 10,
      percent = 45
    },
    {
      type = "explosion",
      decrease = 2,
      percent = 20
    },
    {
      type = "fire",
      decrease = 0,
      percent = 10
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
  inventory_size = 80,
  equipment_grid = "spidertron-equipment-grid",
  attack_parameters =
  {
    type = "projectile",
    ammo_category = "bullet",
    cooldown = 15,
    movement_slow_down_factor = 0.2,
    shell_particle =
    {
      name = "shell-particle",
      direction_deviation = 0.1,
      speed = 0.1,
      speed_deviation = 0.03,
      center = {0, 0.1},
      creation_distance = -0.5,
      starting_frame_speed = 0.4,
      starting_frame_speed_deviation = 0.1
    },
    projectile_creation_distance = 1.125,
    range = 15,
    ammo_type =
    {
      category = "bullet",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-hit",
              offsets = {{0, 1}},
              offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
            },
            {
              type = "damage",
              damage = { amount = 6, type = "physical"}
            }
          }
        }
      }
    },
    sound =
    {
      variations =
      {
        {
          filename = "__Girls_Front_Line_TDolls__/sound/HGShoot01.ogg",
		  volume = 0.55
        },
        {
          filename = "__Girls_Front_Line_TDolls__/sound/HGShoot02.ogg",
		  volume = 0.55
        },
      },
      aggregation =
      {
        max_count = 2,
        remove = true,
        count_already_playing = true
      }
    },
    animation = {
                layers = {
                    {
                        filename = "__Girls_Front_Line_TDolls__/graphics/units/welrod_mkii/welrod-mkii-attack-effect.png",
                        width = 136,
                        height = 163,
                        frame_count = 23,
                        axially_symmetrical = false,
                        direction_count = 2,
                        scale = unit_scale,
                        --frame_sequence = { 1, 2, 3, 4, 3, 4, 3, 4 },
                        draw_as_glow = true,
                        --shift = { 0.15, 0.15 },
                        middle_orientation = 0.75,
                    },
                    {
                        filename = "__Girls_Front_Line_TDolls__/graphics/units/welrod_mkii/welrod-mkii-attack.png",
                        width = 136,
                        height = 163,
                        frame_count = 23,
                        axially_symmetrical = false,
                        direction_count = 2,
                        scale = unit_scale,
                        --frame_sequence = { 1, 2, 3, 4, 3, 4, 3, 4 }
                        middle_orientation = 0.75,
                        --run_mode = "backward",
                    },
                    {
                        filename = "__Girls_Front_Line_TDolls__/graphics/units/welrod_mkii/welrod-mkii-attack.png",
                        width = 136,
                        height = 163,
                        frame_count = 23,
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
  corpse = corpseName,
  dying_sound =
      {
      variations =
      {
		{
          filename = "__Girls_Front_Line_TDolls__/sound/MarineDeath01.ogg",
		  volume = 0.45
        },
		{
          filename = "__Girls_Front_Line_TDolls__/sound/MarineDeath02.ogg",
		  volume = 0.45
        },
		{
          filename = "__Girls_Front_Line_TDolls__/sound/MarineDeath03.ogg",
		  volume = 0.45
        },
		{
          filename = "__Girls_Front_Line_TDolls__/sound/MarineDeath04.ogg",
		  volume = 0.45
        },
		{
          filename = "__Girls_Front_Line_TDolls__/sound/MarineDeath05.ogg",
		  volume = 0.45
        },
		{
          filename = "__Girls_Front_Line_TDolls__/sound/MarineDeath06.ogg",
		  volume = 0.45
        },
        {
          filename = "__Girls_Front_Line_TDolls__/sound/MarineDeath07.ogg",
		  volume = 0.45
        }
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
	  {
        filename = "__Girls_Front_Line_TDolls__/sound/MarineCall2.ogg",
        volume = 0.58
      },
	  {
        filename = "__Girls_Front_Line_TDolls__/sound/MarineCall3.ogg",
        volume = 0.58
      },
	  {
        filename = "__Girls_Front_Line_TDolls__/sound/MarineCall4.ogg",
        volume = 0.58
      },
	  {
        filename = "__Girls_Front_Line_TDolls__/sound/MarineCall5.ogg",
        volume = 0.58
      },
	  {
        filename = "__Girls_Front_Line_TDolls__/sound/MarineCall6.ogg",
        volume = 0.58
      },
	  {
        filename = "__Girls_Front_Line_TDolls__/sound/MarineCall7.ogg",
        volume = 0.58
      },
	  {
        filename = "__Girls_Front_Line_TDolls__/sound/MarineCall8.ogg",
        volume = 0.58
      },
	  {
        filename = "__Girls_Front_Line_TDolls__/sound/MarineCall9.ogg",
        volume = 0.58
      },
	  {
        filename = "__Girls_Front_Line_TDolls__/sound/MarineCall10.ogg",
        volume = 0.58
      },
	  {
        filename = "__Girls_Front_Line_TDolls__/sound/MarineCall11.ogg",
        volume = 0.58
      },
      
    },
    probability = 1 / (90 * 60), -- average pause between the sound is 12 seconds
    max_sounds_per_type = 10
  },
  
  run_animation = {
            layers = {
                {
                    filename = "__Girls_Front_Line_TDolls__/graphics/units/welrod_mkii/welrod-mkii-run.png",
                    width = 127,
                    height = 166,
                    frame_count = 22,
                    axially_symmetrical = false,
                    direction_count = 2,
                    scale = unit_scale,
                    middle_orientation = 0.75
                },
                {
                    filename = "__Girls_Front_Line_TDolls__/graphics/units/welrod_mkii/welrod-mkii-run.png",
                    width = 127,
                    height = 166,
                    frame_count = 22,
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
  stack_size = 5,
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