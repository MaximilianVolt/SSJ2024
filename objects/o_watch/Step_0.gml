if (
	(
		game_action(o_controller.inputs, INPUT_FLAGS.KEY_CLOCK)
		|| game_action(o_controller.inputs, INPUT_FLAGS.KEY_INTERACT)
	)
	&& time_source_get_state(animation_out_timesource) != time_source_state_active
) {
	o_player.state = o_player.state_idle;
	timesource = animation_out_timesource;
	target_x = -xx / 2;
	target_y = -yy / 3;
	target_rot = 90;
	target_image_alpha = .1;
	time_source_start(timesource);
}

animation(timesource);
