var _state = string_delete(
	state_current == state_interact
	? nameof(state_idle)
	: state_string, 1, 6
);
var _dir = (motion.magnitude ? motion.direction : dir_previous) div 90 mod 4;
var _str = $"s_player_{_state}_{_dir}";

image_speed = 1 + game_action(inputs, INPUT_FLAGS.KEY_RUN);

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

if (motion.magnitude)
	dir_previous = motion.direction;
