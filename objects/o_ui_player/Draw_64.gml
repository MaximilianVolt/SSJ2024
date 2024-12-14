if (!instance_exists(o_player))
	exit;

draw_advanced_circular_bar(ui_bar);
circular_bar_deactivate(bar_border);

var fire_index = ceil(bar.value * 3) * (bar.value > 0);
draw_sprite_ext(s_fire, fire_index, bar_x + 10, bar_y - 0, 2, 2, image_angle, image_blend, image_alpha);
