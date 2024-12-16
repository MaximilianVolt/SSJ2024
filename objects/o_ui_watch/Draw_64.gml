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