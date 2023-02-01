data:extend({
  {
    type = "solar-panel-equipment",
    name = "dummy-link-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/solar-panel-equipment.png",
      width = 32,
      height = 32,
      priority = "medium",
      hr_version =
      {
        filename = "__base__/graphics/equipment/hr-solar-panel-equipment.png",
        width = 64,
        height = 64,
        priority = "medium",
        scale = 0.5
      }
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-output"
    },
    power = "30kW",
    categories = {"armor"}
  },

  {
    type = "recipe",
    name = "dummy-link-equipment",
    localised_name = {"dummy-link-equipment"},
    enabled = true,
    ingredients =
    {
      {"light-armor", 1},
      {"submachine-gun",1},
      {"firearm-magazine",10}
    },
    energy_required = 15,
    result = "dummy-link-equipment"
  },
  {
    type = "item",
    name = "dummy-link-equipment",
    icon = "__base__/graphics/icons/solar-panel-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "dummy-link-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-a[solar-panel]",
    stack_size = 4
  },

  {
    type = "energy-shield-equipment",
    name = "small-energy-shield-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/energy-shield-equipment.png",
      width = 64,
      height = 64,
      priority = "medium",
      hr_version =
      {
        filename = "__base__/graphics/equipment/hr-energy-shield-equipment.png",
        width = 128,
        height = 128,
        priority = "medium",
        scale = 0.5
      }
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    max_shield_value = 10,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "50kJ",
      input_flow_limit = "240kW",
      usage_priority = "primary-input"
    },
    energy_per_shield = "10kJ",
    categories = {"armor"}
  },

  {
    type = "recipe",
    name = "small-energy-shield-equipment",
    localised_name = {"small-energy-shield-equipment"},
    enabled = true,
    ingredients =
    {
      {"light-armor", 1},
      {"submachine-gun",1},
      {"firearm-magazine",10}
    },
    energy_required = 15,
    result = "small-energy-shield-equipment"
  },
  {
    type = "item",
    name = "small-energy-shield-equipment",
    icon = "__base__/graphics/icons/solar-panel-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "small-energy-shield-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-a[solar-panel]",
    stack_size = 4
  },
})