var player_data = GAME.data /* ... */;

inputs = o_controller.inputs;



/// State machine

state_string = "";

/**
 *
*/

state_idle = function()
{
	state_string = nameof(state_idle);

	if (
		game_action_check(inputs, INPUT_FLAGS.KEY_INTERACT)
		&& player_can_interact()
	) {
		return state_interact();
	}

	if (player_get_movement_info(inputs).magnitude)
		return state_walk();

	return state_idle;
}



/**
 *
*/

state_walk = function()
{
	state_string = nameof(state_walk);

	var motion = player_get_movement_info(inputs);

	if (!motion.magnitude)
		return state_idle();

	player_collide(motion.direction, motion.magnitude, o_barrier);

	return state_walk;
}



/**
 *
*/

state_interact = function()
{
	state_string = nameof(state_interact);

	return state_interact;
}



state = state_idle;