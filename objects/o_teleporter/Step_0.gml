if (instance_exists(o_player) && place_meeting(x, y, o_player))
{
	global.teleport = {
		x: teleport_x,
		y: teleport_y
	};

    if (!audio_is_playing(sfx_creaking))
        audio_play_sound(sfx_creaking, 100, false, .4);
    
	transition_begin(teleport_room, sq_fadeout, sq_fadein,,, 4, 4);
	o_player.state = o_player.state_interact;
}
