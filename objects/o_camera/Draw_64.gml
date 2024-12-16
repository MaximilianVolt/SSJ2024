if (!sprite)
	exit;

var xx = window_get_width();
var yy = window_get_height();

draw_sprite_ext(
	sprite,
	image_index,
	xx / 2,
	yy / 2,
	xx / sprite_get_width(sprite),
	yy / sprite_get_height(sprite),
	image_angle,
	image_blend,
	image_alpha
);