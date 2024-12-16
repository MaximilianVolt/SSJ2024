if (!instance_exists(o_player))
	exit;

draw_advanced_circular_bar(ui_bar);
circular_bar_deactivate(bar_border);

var val = global.hp / global.mhp;

var fire_index = min(ceil(val * 3) * (val > 0), image_number - 1);
draw_sprite_ext(s_fire, fire_index, bar_x + 10, bar_y - 0, 2, 2, image_angle, image_blend, image_alpha);

if (room != rm_forest)
	exit;

var house_distance_ratio = point_distance(
	o_player.x, o_player.y, global.house_coords.x, global.house_coords.y
) / 50;

var scale = math_dual_proportion(house_distance_ratio, 50, 0, 4, 1);
var arrow_distance = 5;
var arrow_angle = point_direction(o_player.x, o_player.y, global.house_coords.x, global.house_coords.y);

	
if (o_player.state_current != o_player.state_interact)
	draw_sprite_ext(
		s_radio_arrow,
		0,
		view_get_wport(view_camera) / 2 + lengthdir_x(arrow_distance, arrow_angle) * house_distance_ratio,
		view_get_hport(view_camera) / 2 + lengthdir_y(arrow_distance, arrow_angle) * house_distance_ratio,
		scale,
		scale,
		arrow_angle,
		image_blend,
		image_alpha
	);