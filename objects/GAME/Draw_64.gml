// Temp code, delete asap

draw_text(x, y, o_player.state_string);


if (!audio_is_playing(bgm_radio_loop_static))
{
	audio_play_sound(bgm_radio_loop_static, 100, true);
}