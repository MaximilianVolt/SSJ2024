// Inheritance

event_inherited();

// Positioning

xx = view_get_wport(view_camera);
yy = view_get_hport(view_camera);

x = -xx / 2;
y = yy;

// Image effects

image_alpha = -2;
o_camera.sprite = s_house_overlay;
o_camera.image_alpha = image_alpha;



// Animation

target_image_alpha = 1;

target_x = xx / 2;
target_y = yy / 2 + 80;

scale = 7;
target_scale = 8;

rotation = 120;
target_rotation = 0;

var full_rotation = 360;
var full_rotation_count = 8;
rotation_minutes = random_range(full_rotation * 3, full_rotation * full_rotation_count);
rotation_hours = random_range(full_rotation * 3, full_rotation * full_rotation_count);
rotation_minutes = choose(-rotation_minutes, rotation_minutes);
rotation_hours = choose(-rotation_hours, rotation_hours);

// Sound

sound = audio_play_sound(
	sfx_watch_grab,
	100,
	false,
	.2
);

// Time sources

animation_time = 1.5;

animation_in_timesource = time_source_create(
	time_source_global,
	animation_time,
	time_source_units_seconds,
	function() {
		if (!time_source_exists(global.time_timesource))
			return;

		sound = audio_play_sound(
			sfx_watch_tick,
			100,
			true,
			.5,
			1 - frac(
				time_source_get_time_remaining(global.time_timesource)
			)
		);
	}
);

animation_out_timesource = time_source_create(
	time_source_global,
	animation_time,
	time_source_units_seconds,
	function() {
		instance_destroy();
	}
);

// Manages both animations in the step event

animation = function(timesource)
{
	var rem_time = time_source_get_time_remaining(timesource);
	var anim_time = time_source_get_period(timesource);
	var time = (anim_time - rem_time) / anim_time;

	rotation += math_ease_out_bounce(time) * (target_rotation - rotation);
	scale += math_ease_in_circular(time) * (target_scale - scale);
	image_alpha = smoothen(image_alpha, target_image_alpha);
	x += math_ease_out_bounce(time) * (target_x - x);
	y += math_ease_out_bounce(time) * (target_y - y);
	o_camera.image_alpha = image_alpha;

	// Changes the indicators movement type from smooth to snappy

	rotation_hours = (rem_time != 0)
		? smoothen(rotation_hours, rotation + 270 - global.time / 2)
		: rotation + 270 - (global.time) / 2
	;

	rotation_minutes = (rem_time != 0)
		? smoothen(rotation_minutes, rotation + 90 - global.time * 6)
		: rotation + 90 - (global.time) * 6
	;
}

// Play "in" animation

timesource = animation_in_timesource;
time_source_start(timesource);