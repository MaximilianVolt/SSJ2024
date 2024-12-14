var rot_h = rot + 270 - (global.time) / 60 * 30;
var rot_m = rot + 90 - (global.time) * 6;
var scale = 8;

draw_sprite_ext(
	s_chain,
	image_index,
	x - sprite_get_width(s_clockface) * scale / 2,
	y,
	scale,
	scale,
	rot,
	image_blend,
	image_alpha - .1
);

draw_sprite_ext(
	s_clockface,
	image_index,
	x,
	y,
	scale,
	scale,
	rot,
	image_blend,
	image_alpha - .1
);

draw_sprite_ext(
	s_clock_indicator_hrs,
	image_index,
	x,
	y,
	scale,
	scale,
	rot_h,
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
	rot_m,
	image_blend,
	image_alpha
);