data:extend(
{
  {
    type = "ammo",
    name = "T-Doll Stun Grenade",
    icon = "__base__/graphics/icons/firearm-magazine.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "gfl-slow",
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "slowdown-capsule",
            starting_speed = 0.7
          }
        },
        {
          type = "direct",
          action_delivery =
          {
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
                  type = "create-entity",
                  entity_name = "explosion-hit",
                  offsets = {{0, 1}},
                  offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
                },
                {
                  type = "damage",
                  damage = { amount = 5 , type = "physical"}
                }
              }
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-a[firearm-magazine]",
    stack_size = 200
  },

  {
    type = "recipe",
    name = "T-Doll Stun Grenade",
    localised_name = {"T-Doll Stun Grenade"},
    enabled = false,
    ingredients =
    {
      {"steel-plate", 2},
      {"electronic-circuit", 2},
      {"coal", 5}
    },
    energy_required = 15,
    result = "T-Doll Stun Grenade"
  },

  {
    type = "ammo",
    name = "T-Doll Grenade",
    icon = "__base__/graphics/icons/grenade.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "gfl-grenade",
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "grenade",
            starting_speed = 0.3
          }
        },
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
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
                  damage = { amount = 12 , type = "physical"}
                }
              }
          }
        }
      },
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-a[firearm-magazine]",
    stack_size = 200
  },

  {
    type = "recipe",
    name = "T-Doll Grenade",
    localised_name = {"T-Doll Grenade"},
    enabled = false,
    ingredients =
    {
      {"iron-plate", 5},
      {"coal", 10}
    },
    energy_required = 15,
    result = "T-Doll Grenade"
  },

  {
    type = "ammo",
    name = "T-Doll debuff",
    icon = "__base__/graphics/icons/firearm-magazine.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "gfl-debuff",
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
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
                  type = "create-entity",
                  entity_name = "explosion-hit",
                  offsets = {{0, 1}},
                  offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
                },
                {
                  type = "damage",
                  damage = { amount = 5 , type = "physical"}
                },
                {
                  type = "create-sticker",
                  sticker = "GFL Debuff 1"
                }
              }
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-a[firearm-magazine]",
    stack_size = 200
  },

  {
    type = "recipe",
    name = "T-Doll debuff",
    localised_name = {"T-Doll debuff"},
    enabled = false,
    ingredients =
    {
      {"steel-plate", 2},
      {"electronic-circuit", 2},
      {"coal", 5}
    },
    energy_required = 15,
    result = "T-Doll debuff"
  },
})

data:extend(
{
  {
    type = "sticker",
    name = "GFL Debuff 1",
    flags = {"not-on-map"},
    duration_in_ticks = 1.5 * 60,
    damage_per_tick = {
      amount = 5,
      type = "physical"
    },
    target_movement_modifier_from = 0.1,
    target_movement_modifier_to = 1,
    vehicle_speed_modifier_from = 0.1,
    vehicle_speed_modifier_to = 1,
    vehicle_friction_modifier_from = 0.1,
    vehicle_friction_modifier_to = 1,
  }
})