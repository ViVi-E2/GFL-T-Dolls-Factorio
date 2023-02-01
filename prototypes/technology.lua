data:extend({
  {
    type = "technology",
    name = "type-64",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/automation-1.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "spidertron-remote"
      },
      {
      type = "unlock-recipe",
      recipe = "type-64"
      },
      {
      type = "unlock-recipe",
      recipe = "m4-sopmodmod"
      },
      {
        type = "unlock-recipe",
        recipe = "T-Doll Stun Grenade"
      },
      {
        type = "unlock-recipe",
        recipe = "T-Doll Grenade"
      },
      {
        type = "unlock-recipe",
        recipe = "T-Doll debuff"
      },
    },
    prerequisites = {"military-2"},
    unit =
    {
      count = 100*1,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    },
    ignore_tech_cost_multiplier = true,
    order = "a-b-a"
  },
})