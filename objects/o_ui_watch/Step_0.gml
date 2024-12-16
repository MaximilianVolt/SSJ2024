if (
	(
		game_action(o_controller.inputs, INPUT_FLAGS.KEY_CLOCK)
		|| game_action(o_controller.inputs, INPUT_FLAGS.KEY_INTERACT)
	)
	&& time_source_get_state(animation_out_timesource) != time_source_state_active
) {
	// "Out" animation values

	target_x = -xx / 2;
	target_y = -yy / 3;
	target_rotation = 90;
	target_scale = 5;
	target_image_alpha = .1;

	// Change animation to play

	timesource = animation_out_timesource;
	time_source_start(timesource);

	// Reset player status

	o_player.state = o_player.state_idle;

	// Stop sounds

	audio_stop_sound(sound);
}

animation(timesource);
