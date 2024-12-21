// Inheritance

event_inherited();

// Positioning

xx = view_get_wport(view_camera);
yy = view_get_hport(view_camera);

x = xx / 2;
y = yy + sprite_height;

// Image effects

image_alpha = 0;
o_camera.sprite = s_house_overlay;
o_camera.image_alpha = image_alpha;

// Animation

var offset_y = 12.5;
target_x = xx / 2;
target_y = yy - sprite_height + offset_y;

target_image_alpha = 1;

scale = 4;
target_scale = 7;
wheel_scale_factor = 1.5;

// Behavior loop definitions

wheel_rotation_center = 90;
wheel_scale_normalized = scale / wheel_scale_factor;
wheel_scale_hover = wheel_scale_normalized + 1;
wheel_scale = wheel_scale_normalized;
wheel_scale_pulse = .5;
wheel_scale_pulse_time = 5;
wheel_range_amplitude = 270;
wheel_rotation = game_frequency_to_wheel_angle(wheel_rotation_center, -wheel_range_amplitude);
wheel_rotation_target = wheel_rotation;
wheel_rotation_speed = 10;
wheel_scale_onclick_corrector = 8;
wheel_blend_normal = c_white;
wheel_blend_flash = c_aqua;
wheel_blend = wheel_blend_normal;
wheel_flash_time = 1;

mouse_distance = 0;
mouse_max_difference = 125;
mouse_max_distance = sprite_width * scale / 3;
mouse_last_angle = wheel_rotation;
mx = display_mouse_get_x();
my = display_mouse_get_y();

arrow_scale_corrector = 3;
arrow_scale_mouse_corrector = 1 / 50;
arrow_scale_onclick_corrector = 8;
arrow_rotation = wheel_rotation_center;
arrow_rotation_speed = .25;
arrow_scale_normalized = 5;
arrow_scale = arrow_scale_normalized;

// Time sources

animation_time = 1;

animation_in_timesource = time_source_create(
	time_source_global,
	animation_time,
	time_source_units_seconds,
	function() {}
);

animation_out_timesource = time_source_create(
	time_source_global,
	animation_time / 2,
	time_source_units_seconds,
	function() {
    audio_stop_sound(bgs_static);
    audio_stop_sound(bgm_radio_loop_static);

		instance_destroy();
	}
);

// Manages both animations

animation = function(timesource)
{
	var rem_time = time_source_get_time_remaining(timesource);
	var anim_time = time_source_get_period(timesource);
	var time = (anim_time - rem_time) / anim_time;

	image_alpha += math_ease_in_out_cubic(time) * (target_image_alpha - image_alpha);
	scale += math_ease_in_out_cubic(time) * (target_scale - scale);
	x += math_ease_out_bounce(time) * (target_x - x);
	y += math_ease_out_bounce(time) * (target_y - y);
	o_camera.image_alpha = image_alpha;
}

// Play "in" animation

timesource = animation_in_timesource;
time_source_start(timesource);

// Radio tracks

radio_code = [];

for (var f = global.radio_neutralizer_frequency; f; f = f div 10)
  array_push(radio_code, asset_get_index($"sfx_code_{f mod 10}"));

radio_tracks = [
  [sfx_transmission_1],
  [sfx_transmission_2],
  array_concat(
    [sfx_transmission_3_part_1], array_reverse(radio_code), [sfx_transmission_3_part_2]
  ),
  [sfx_transmission_4],
  [sfx_transmission_5],
  [sfx_transmission_6],
  [sfx_transmission_7]
];

radio_music_volume = !global.is_night;

audio_play_sound(bgs_static, 100, true, .0025);

if (!global.is_night)
  audio_play_sound(bgm_radio_loop_static, 100, true, radio_music_volume);

radio_transmission_index = irandom(6);
radio_transmission_part_index = 0;
radio_transmission = radio_tracks[radio_transmission_index][radio_transmission_part_index];
