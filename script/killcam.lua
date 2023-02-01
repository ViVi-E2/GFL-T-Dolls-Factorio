local data =
{
  killcams = {}
}

local make_killcam = function(player, cause)
  local scale = player.display_scale
  local gui = player.gui.center
  gui.clear()
  local name = cause.name
  if cause.type == "player" and cause.player then
    name = cause.player.name
  else
    name = game.entity_prototypes[name].localised_name
  end

  local outer = gui.add{type = "frame", style = "inside_deep_frame"}
  outer.style.width = player.display_resolution.width / scale
  outer.style.height = player.display_resolution.height / scale
  outer.style.horizontal_align = "center"
  outer.style.vertical_align = "center"


  local frame = outer.add{type = "frame", caption = {"", "You were killed by ", name}}
  frame.style.horizontally_stretchable = false
  frame.style.vertically_stretchable = false
  local camera = frame.add{type = "camera", position = cause.position, zoom = 1}
  camera.style.width = math.floor(player.display_resolution.width * 0.8) / scale
  camera.style.height = math.floor(player.display_resolution.height * 0.8) / scale
  local cams = data.killcams
  cams[player.index] = {gui = camera, cause = cause, frame = outer}
end

local on_player_died = function(event)
  local cause = event.cause
  if not cause then return end
  local player = game.players[event.player_index]
  make_killcam(player, cause)
end

local on_tick = function(event)
  local cams = data.killcams
  for k, cam in pairs (cams) do
    local player = game.players[k]
    if not player.ticks_to_respawn then
      cam.frame.destroy()
      cams[k] = nil
    elseif cam.cause.valid then
      cam.gui.position = cam.cause.position
    end
  end
end

local killcam = {}

killcam.events =
{
  [defines.events.on_player_died] = on_player_died,
  [defines.events.on_tick] = on_tick
}

killcam.on_init = function()
  global.killcam = data
end

killcam.on_load = function()
  data = global.killcam or data
end

return killcam
