draw_sprite_ext(
	s_radio,
	image_index,
	x,
	y,
	scale,
	scale,
	image_angle,
	image_blend,
	image_alpha
);

draw_sprite_ext(
	s_radio_wheel,
	image_index,
	x,
	y,
	wheel_scale,
	wheel_scale,
	wheel_rotation,
	wheel_blend,
	image_alpha
);

var c = wheel_blend;
var text_scale = 4;

draw_set_halign(fa_center);

var rem_time = time_source_get_time_remaining(animation_in_timesource);
var anim_time = time_source_get_period(animation_in_timesource);
var progress = (anim_time - rem_time) / anim_time;

draw_text_transformed_color(xx / 2, 60, $"[LMB], [SHIFT] and\narrow keys to tune.", text_scale, text_scale, image_angle, c, c, c, c, 4 * (1 - progress));	
draw_text_transformed_color(x, y - 200, $"{round(global.radio_frequency)}MHz", text_scale, text_scale, image_angle, c, c, c, c, 1);

draw_set_halign(fa_left);

depth = -12000;

draw_sprite_ext(
  s_radio_arrow,
  image_index,
  mx,
  my,
  arrow_scale,
  arrow_scale,
  arrow_rotation,
  image_blend,
  image_alpha
);
depth = -8000;
