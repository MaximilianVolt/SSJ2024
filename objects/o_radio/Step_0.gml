if (
	!instance_exists(o_player)
	|| instance_exists(o_ui_radio)
) {
	exit;
}

with (o_player)
{
	if (
		player_can_interact(other)
		&& game_action(inputs, INPUT_FLAGS.KEY_INTERACT)
	) {
		instance_create_layer(x, y, "Instances", o_ui_radio);
		state = state_interact;
	}
}