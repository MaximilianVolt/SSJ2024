if (instance_exists(o_player) && place_meeting(x, y, o_player))
{
	global.teleport = {
		x: teleport_x,
		y: teleport_y
	};

	transition_begin(teleport_room, sq_fadeout, sq_fadein,,, 4, 4);
	o_player.state = o_player.state_interact;
}