var _state = string_delete(state_string, 1, 6);
var _dir = (motion.magnitude ? motion.direction : dir_previous) div 90 mod 4;
var _str = $"s_player_{_state}_{_dir}";

if (state_current != state_interact)
	sprite_index = asset_get_index(_str);

draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
);

	draw_sprite(mask_index, 0, x, y);

	draw_set_halign(fa_center);
	draw_text(x, y + 3, _str);
	var c = #080808;
	draw_text_color(x, y + 20, $"x: {x}\ny: {y}", c, c, c, c, 1);
	draw_set_halign(fa_left);

if (motion.magnitude)
	dir_previous = motion.direction;
