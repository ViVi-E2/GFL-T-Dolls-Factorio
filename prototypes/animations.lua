local animations = {

  type64Run =
  {
      type = "animation",
      name = "Girls_Front_Line_TDolls/type-64-run",
      layers = {
          {
              filename = "__Girls_Front_Line_TDolls__/graphics/units/type_64/type-64-run.png",
              width = 165,
              height = 180,
              frame_count = 40,
              axially_symmetrical = false,
              direction_count = 2,
              scale = 0.5,
              middle_orientation = 0.75
          },
          {
              filename = "__Girls_Front_Line_TDolls__/graphics/units/type_64/type-64-run.png",
              width = 165,
              height = 180,
              frame_count = 40,
              axially_symmetrical = false,
              direction_count = 2,
              scale = 0.5,
              draw_as_shadow = true,
              shift = { 0.25, 0 },
              -- tint = ERM_UnitTint.tint_shadow(),
          },
      },
  },

  type64Attack =
  {
    type = "animation",
    name = "Girls_Front_Line_TDolls/type-64-attack",
    layers = {
      {
          filename = "__Girls_Front_Line_TDolls__/graphics/units/type_64/type-64-attack.png",
          width = 153,
          height = 171,
          frame_count = 23,
          axially_symmetrical = false,
          direction_count = 2,
          scale = 0.5,
          --frame_sequence = { 1, 2, 3, 4, 3, 4, 3, 4 }
          middle_orientation = 0.75,
          --run_mode = "backward",
      },
      {
          filename = "__Girls_Front_Line_TDolls__/graphics/units/type_64/type-64-attack.png",
          width = 153,
          height = 171,
          frame_count = 23,
          axially_symmetrical = false,
          direction_count = 2,
          scale = 0.5,
          --frame_sequence = { 1, 2, 3, 4, 3, 4, 3, 4 },
          draw_as_shadow = true,
          shift = { 0.25, 0 },
          middle_orientation = 0.75,
      },
    },
  },

  type64Wait =
  {
    type = "animation",
    name = "Girls_Front_Line_TDolls/type-64-wait",
    layers = {
      {
          filename = "__Girls_Front_Line_TDolls__/graphics/units/type_64/type-64-idle.png",
          width = 185,
          height = 203,
          frame_count = 40,
          axially_symmetrical = false,
          direction_count = 2,
          scale = 0.5,
          middle_orientation = 0.75
      },
      {
          filename = "__Girls_Front_Line_TDolls__/graphics/units/type_64/type-64-idle.png",
          width = 185,
          height = 203,
          frame_count = 40,
          axially_symmetrical = false,
          direction_count = 2,
          scale = 0.5,
          draw_as_shadow = true,
          shift = { 0.25, 0 },
          -- tint = ERM_UnitTint.tint_shadow(),
      },
    },
  },

  type64Death =
  {
    type = "animation",
    name = "Girls_Front_Line_TDolls/type-64-die",
    layers =
    {
      {      
      filename = "__Girls_Front_Line_TDolls__/graphics/units/type_64/type-64-death.png",
      width = 256,
      height = 229,
      frame_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      scale = unit_scale,
      middle_orientation = 0.75,
      }
    },
  },

  m4_sopmodmod_Run =
  {
      type = "animation",
      name = "Girls_Front_Line_TDolls/m4-sopmodmod-run",
      layers = {
          {
              filename = "__Girls_Front_Line_TDolls__/graphics/units/m4_sopmodmod/m4-sopmodmod-run.png",
              width = 162,
              height = 192,
              frame_count = 24,
              axially_symmetrical = false,
              direction_count = 2,
              scale = 0.5,
              middle_orientation = 0.75
          },
          {
              filename = "__Girls_Front_Line_TDolls__/graphics/units/m4_sopmodmod/m4-sopmodmod-run.png",
              width = 162,
              height = 192,
              frame_count = 24,
              axially_symmetrical = false,
              direction_count = 2,
              scale = 0.5,
              draw_as_shadow = true,
              shift = { 0.25, 0 },
              -- tint = ERM_UnitTint.tint_shadow(),
          },
      },
  },

  m4_sopmodmod_Attack =
  {
    type = "animation",
    name = "Girls_Front_Line_TDolls/m4-sopmodmod-attack",
    layers = {
      {
          filename = "__Girls_Front_Line_TDolls__/graphics/units/m4_sopmodmod/m4-sopmodmod-attack.png",
          width = 158,
          height = 176,
          frame_count = 34,
          axially_symmetrical = false,
          direction_count = 2,
          scale = 0.5,
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
          scale = 0.5,
          --frame_sequence = { 1, 2, 3, 4, 3, 4, 3, 4 },
          draw_as_shadow = true,
          shift = { 0.25, 0 },
          middle_orientation = 0.75,
      },
    },
  },

  m4_sopmodmod_Wait =
  {
    type = "animation",
    name = "Girls_Front_Line_TDolls/m4-sopmodmod-wait",
    layers = {
      {
          filename = "__Girls_Front_Line_TDolls__/graphics/units/m4_sopmodmod/m4-sopmodmod-idle.png",
          width = 184,
          height = 212,
          frame_count = 40,
          axially_symmetrical = false,
          direction_count = 2,
          scale = 0.5,
          middle_orientation = 0.75
      },
      {
          filename = "__Girls_Front_Line_TDolls__/graphics/units/m4_sopmodmod/m4-sopmodmod-idle.png",
          width = 184,
          height = 212,
          frame_count = 40,
          axially_symmetrical = false,
          direction_count = 2,
          scale = 0.5,
          draw_as_shadow = true,
          shift = { 0.25, 0 },
          -- tint = ERM_UnitTint.tint_shadow(),
      },
    },
  },

  m4_sopmodmod_Death =
  {
    type = "animation",
    name = "Girls_Front_Line_TDolls/m4-sopmodmod-die",
    layers =
    {
      {
        filename = "__Girls_Front_Line_TDolls__/graphics/units/m4_sopmodmod/m4-sopmodmod-death.png",
        width = 331,
        height = 244,
        frame_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        scale = unit_scale,
        middle_orientation = 0.75,
      }
    },
  },

  welrod_mkii_Run =
  {
      type = "animation",
      name = "Girls_Front_Line_TDolls/welrod-mkii-run",
      layers = {
          {
              filename = "__Girls_Front_Line_TDolls__/graphics/units/welrod_mkii/welrod-mkii-run.png",
              width = 127,
              height = 166,
              frame_count = 22,
              axially_symmetrical = false,
              direction_count = 2,
              scale = 0.5,
              middle_orientation = 0.75
          },
          {
              filename = "__Girls_Front_Line_TDolls__/graphics/units/welrod_mkii/welrod-mkii-run.png",
              width = 127,
              height = 166,
              frame_count = 22,
              axially_symmetrical = false,
              direction_count = 2,
              scale = 0.5,
              draw_as_shadow = true,
              shift = { 0.25, 0 },
              -- tint = ERM_UnitTint.tint_shadow(),
          },
      },
  },

  welrod_mkii_Attack =
  {
    type = "animation",
    name = "Girls_Front_Line_TDolls/welrod-mkii-attack",
    layers = {
      {
          filename = "__Girls_Front_Line_TDolls__/graphics/units/welrod_mkii/welrod-mkii-attack.png",
          width = 136,
          height = 163,
          frame_count = 23,
          axially_symmetrical = false,
          direction_count = 2,
          scale = 0.5,
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
          scale = 0.5,
          --frame_sequence = { 1, 2, 3, 4, 3, 4, 3, 4 },
          draw_as_shadow = true,
          shift = { 0.25, 0 },
          middle_orientation = 0.75,
      },
    },
  },

  welrod_mkii_Wait =
  {
    type = "animation",
    name = "Girls_Front_Line_TDolls/welrod-mkii-wait",
    layers = {
      {
          filename = "__Girls_Front_Line_TDolls__/graphics/units/welrod_mkii/welrod-mkii-idle.png",
          width = 147,
          height = 190,
          frame_count = 54,
          axially_symmetrical = false,
          direction_count = 2,
          scale = 0.5,
          middle_orientation = 0.75
      },
      {
          filename = "__Girls_Front_Line_TDolls__/graphics/units/welrod_mkii/welrod-mkii-idle.png",
          width = 147,
          height = 190,
          frame_count = 54,
          axially_symmetrical = false,
          direction_count = 2,
          scale = 0.5,
          draw_as_shadow = true,
          shift = { 0.25, 0 },
          -- tint = ERM_UnitTint.tint_shadow(),
      },
    },
  },

  welrod_mkii_Death =
  {
    type = "animation",
    name = "Girls_Front_Line_TDolls/welrod-mkii-die",
    layers = {
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
    },
  },
  
}

data:extend({
  animations.type64Attack,
  animations.type64Run,
  animations.type64Wait,
  animations.type64Death,
  animations.m4_sopmodmod_Attack,
  animations.m4_sopmodmod_Run,
  animations.m4_sopmodmod_Wait,
  animations.m4_sopmodmod_Death,
  animations.welrod_mkii_Attack,
  animations.welrod_mkii_Run,
  animations.welrod_mkii_Wait,
  animations.welrod_mkii_Death,
})

function doll_animations(doll_scale)
return
  {
  base_animation =
  {
    layers =
    {
      {
        filename = "__Girls_Front_Line_TDolls__/utils/empty-sprite.png",
        width = 1,
        height = 1,
        line_length = 1,
        direction_count = 1,
        scale = 1,
      },
    }
  },

  light =
  {
    {
      minimum_darkness = 0.3,
      intensity = 0.4,
      size = 25 * doll_scale,
      color = {r=1.0, g=1.0, b=1.0}
    },
  },

  eye_light = {intensity = 1, size = 1, color = {r=1.0, g=1.0, b=1.0}},-- {r=1.0, g=0.0, b=0.0}},

  render_layer = "wires-above",
  base_render_layer = "higher-object-above",

  autopilot_destination_on_map_visualisation =
  {
    filename = "__core__/graphics/spidertron-target-map-visualization.png",
    priority = "extra-high-no-scale",
    scale = 0.5,
    flags = {"icon"},
    width = 64,
    height = 64,
    line_length = 8,
    frame_count = 24,
    animation_speed = 0.5,
    run_mode = "backward",
    apply_runtime_tint = true
  },
  autopilot_destination_queue_on_map_visualisation =
  {
    filename = "__core__/graphics/spidertron-target-map-visualization.png",
    priority = "extra-high-no-scale",
    scale = 0.5,
    flags = {"icon"},
    width = 64,
    height = 64,
    line_length = 8,
    frame_count = 24,
    animation_speed = 0.5,
    run_mode = "backward",
    apply_runtime_tint = true
  },

  autopilot_path_visualisation_on_map_line_width = 2, -- in pixels
  autopilot_path_visualisation_line_width = 1 / 8, -- in tiles

  autopilot_destination_visualisation_render_layer = "object",
  autopilot_destination_visualisation =
  {
    filename = "__core__/graphics/spidertron-target-map-visualization.png",
    priority = "extra-high-no-scale",
    scale = 0.5,
    flags = {"icon"},
    width = 64,
    height = 64,
    line_length = 8,
    frame_count = 24,
    animation_speed = 0.5,
    run_mode = "backward",
    apply_runtime_tint = true
  },
  autopilot_destination_queue_visualisation =
  {
    filename = "__core__/graphics/spidertron-target-map-visualization.png",
    priority = "extra-high-no-scale",
    scale = 0.5,
    flags = {"icon"},
    width = 64,
    height = 64,
    line_length = 8,
    frame_count = 24,
    animation_speed = 0.5,
    run_mode = "backward",
    apply_runtime_tint = true
  }
}
end


