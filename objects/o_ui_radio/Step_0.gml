if (
	(
		game_action(o_controller.inputs, INPUT_FLAGS.KEY_CLOCK)
		|| game_action(o_controller.inputs, INPUT_FLAGS.KEY_INTERACT)
	)
	&& time_source_get_state(animation_out_timesource) != time_source_state_active
  || global.hp <= 0
  || global.time >= global.time_max
) {
	// Reset animation values

	target_y = yy + sprite_height;
	target_image_alpha = 0;
	target_scale = 2;

	// Play "out" animation

	timesource = animation_out_timesource;
	time_source_start(timesource);
	
	// Reset player status

	o_player.state = o_player.state_idle;
  audio_stop_sound(radio_transmission);
}

// Play animations

animation(timesource);

if (timesource == animation_out_timesource)
  exit;

// Mouse movement

mx = display_mouse_get_x();
my = display_mouse_get_y();
var dx = window_mouse_get_delta_x();
var dy = window_mouse_get_delta_y();

var mouse_held = mouse_check_button(mb_left);
var mouse_clicked = mouse_check_button_pressed(mb_left);

mouse_distance = point_distance(x, y, mx, my);
var distance_difference = min(point_distance(0, 0, dx, dy), mouse_max_difference);
var mouse_distance_ratio = mouse_distance / mouse_max_distance;

var rotation_target = point_direction(x, y, mx, my);
var rotation_difference = smoothen(angle_difference(rotation_target, arrow_rotation), 0);
var rotation_anchor = clamp(
	angle_difference(wheel_rotation_center, arrow_rotation),
	-wheel_range_amplitude / 2,
	wheel_range_amplitude / 2
);

arrow_rotation += rotation_difference * arrow_rotation_speed;
arrow_scale = smoothen(
	arrow_scale + distance_difference * arrow_scale_mouse_corrector,
	arrow_scale_normalized,
	15
);

// Wheel behavior

if (mouse_distance_ratio < 1)
{
  if (mouse_clicked)
    audio_play_sound(sfx_watch_grab, 20, false, .03, .35);

	if (mouse_held)
	{
		mouse_last_angle = wheel_rotation_center - rotation_anchor;
		arrow_scale = smoothen(arrow_scale, mouse_distance_ratio * scale);
		wheel_rotation_target = mouse_last_angle;
	}

	wheel_blend = smoothen(
		wheel_blend,
		merge_color(
			wheel_blend_normal,
			wheel_blend_flash,
			wave(0, 1, wheel_flash_time)
		),
		25
	);
}
else
{
	wheel_blend = smoothen(wheel_blend, wheel_blend_normal, 50);
}

var key_left = game_action(o_controller.inputs, INPUT_FLAGS.KEY_LEFT);
var key_right = game_action(o_controller.inputs, INPUT_FLAGS.KEY_RIGHT);

if (key_left | key_right)
{
	var key_run = game_action(o_controller.inputs, INPUT_FLAGS.KEY_RUN);
	var key_up = game_action(o_controller.inputs, INPUT_FLAGS.KEY_UP);
	var key_down = game_action(o_controller.inputs, INPUT_FLAGS.KEY_DOWN);
	var rotation_increment = (key_left - key_right) * wheel_rotation_speed << key_run >> (key_up | key_down);

	wheel_rotation_target = clamp(wheel_rotation + rotation_increment,
		wheel_rotation_center - wheel_range_amplitude / 2,
		wheel_rotation_center + wheel_range_amplitude / 2
	);
}

wheel_scale = smoothen(
  wheel_scale,
  wheel_scale_hover + mouse_clicked * (mouse_distance_ratio < 1) * wheel_scale_onclick_corrector
);
wheel_rotation = smoothen(wheel_rotation, wheel_rotation_target);
arrow_scale = smoothen(
	arrow_scale,
	arrow_scale + mouse_clicked * arrow_scale_onclick_corrector
);

if (wheel_rotation == wheel_rotation_target)
	wheel_scale = smoothen(
		wheel_scale,
		wave(
			wheel_scale_normalized,
			wheel_scale_normalized + wheel_scale_pulse,
			wheel_scale_pulse_time
		)
	);

global.radio_frequency = game_wheel_angle_to_frequency(wheel_rotation, wheel_rotation_center, -wheel_range_amplitude)



// Sounds and transmissions

if (!global.is_night)
  exit;

radio_music_volume = approach(radio_music_volume, 0, 1 / 75000);
audio_sound_gain(bgm_radio_loop_static, radio_music_volume * audio_sound_get_gain(bgm_radio_loop_static), 0);

if (audio_is_playing(bgm_radio_loop_static) && radio_music_volume == 0)
  audio_stop_sound(bgm_radio_loop_static);

var transmission_part_count = array_length(radio_tracks[radio_transmission_index]);



if (!audio_is_playing(radio_transmission))
{
  if (
    global.radio_has_to_play
  ) {
    radio_transmission = radio_tracks[radio_transmission_index][radio_transmission_part_index];

    audio_play_sound(radio_transmission, 100, false, .65);
  
    if (++radio_transmission_part_index == transmission_part_count)
    {
      radio_transmission_part_index = 0;
      global.radio_has_to_play = false;
    }
  }
  else if (
    time_source_get_state(global.timesource_radio_silence) != time_source_state_active
  ) {
    time_source_reconfigure(global.timesource_radio_silence, irandom_range(6, 12), time_source_units_seconds, radio_reset);
    time_source_start(global.timesource_radio_silence);
    radio_transmission_index = irandom(6);
  }
}
