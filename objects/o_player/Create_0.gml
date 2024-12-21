player_data = GAME.data.entities.player;
inputs = o_controller.inputs;
mask_index = s_collider_small;



x = global.teleport.x;
y = global.teleport.y;

motion = player_get_motion(1 << INPUT_FLAGS.KEY_DOWN);

instance_create_layer(x, y, "Managers", o_ui_player);
instance_create_layer(x, y, "Managers", o_camera, {
	target: o_player,
});

time_source_start(global.time_timesource);

dir_previous = 3;

/// State machine

state_string = "";

/**
 *
*/

state_idle = function()
{
	state_string = nameof(state_idle);
	state_current = state_idle;

	if (game_action(inputs, INPUT_FLAGS.KEY_CLOCK))
	{
		instance_create_layer(x, y, "Instances", o_ui_watch);
		return state_interact();
	}

	if (player_get_motion(inputs).magnitude)
		return state_walk();

	return state_idle;
}



/**
 *
*/

state_walk = function()
{
	state_string = nameof(state_walk);
	state_current = state_walk;

	motion = player_get_motion(inputs);

	var spd = motion.magnitude + player_data.spd_run * game_action(inputs, INPUT_FLAGS.KEY_RUN);

	var xspd = lengthdir_x(spd, motion.direction);
  var yspd = lengthdir_y(spd, motion.direction);

	if (!motion.magnitude || player_collide([o_barrier, o_depth], xspd, yspd))
		return state_idle;

	return state_walk;
}



/**
 *
*/

state_interact = function()
{
	state_string = nameof(state_interact);
	state_current = state_interact;

	return state_interact;
}



state = state_idle;
state_current = state;

sound = noone;