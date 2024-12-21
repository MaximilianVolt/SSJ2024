// Depth sorting

event_inherited();

audio_listener_position(x, y, 0);
audio_listener_orientation(global.house_coords.x, global.house_coords.y, 0, 0, 0, 1);

// State machine

state = state();


global.hp -= global.fire_damage;

if (global.hp < 0)
{
	instance_destroy(o_interactable);
	game_over();
}

if (global.time >= global.time_max)
{
  ++global.hp;
  state = state_interact;
  var ww = view_get_wport(view_camera);
  var hh = view_get_hport(view_camera);
  
  if (!instance_exists(o_text_menu))
  {
    instance_create_layer(ww / 2, hh / 2 - 25, "Instances", o_text_menu, {
      text: "You won,\n8allman!",
      image_xscale: 8,
      image_yscale: 8,
      text_speed: .2,
      depth: -10005
    });
    
    global.transitioning = false;
    instance_destroy(o_teleporter);
  }

  transition_begin(rm_credits, sq_fadeout, sq_fadein,,, 3, 3, .1, .8);
}
