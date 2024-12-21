draw_sprite_ext(
	s_clock_chain,
	image_index,
	x - sprite_get_width(s_clock_face) * scale / 2,
	y,
	scale,
	scale,
	rotation - 30,
	image_blend,
	image_alpha
);

draw_sprite_ext(
	s_clock_face,
	image_index,
	x,
	y,
	scale,
	scale,
	rotation,
	image_blend,
	image_alpha
);

draw_sprite_ext(
	s_clock_indicator_hrs,
	image_index,
	x,
	y,
	scale,
	scale,
	rotation_hours,
	image_blend,
	image_alpha
);

draw_sprite_ext(
	s_clock_indicator_min,
	image_index,
	x,
	y,
	scale,
	scale,
	rotation_minutes,
	image_blend,
	image_alpha
);

var c = c_white;
var text_scale = 4;

draw_set_halign(fa_center);

if (true)
{
	var rem_time = time_source_get_time_remaining(animation_in_timesource);
	var anim_time = time_source_get_period(animation_in_timesource);
	var progress = (anim_time - rem_time) / anim_time;

	draw_text_transformed_color(xx / 2, yy - 60, $"[C] to toggle watch.", text_scale, text_scale, image_angle, c, c, c, c, 4 * (1 - progress));	
}

draw_set_halign(fa_left);