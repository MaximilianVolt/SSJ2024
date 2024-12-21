if (!instance_exists(o_player))
	exit;

draw_advanced_circular_bar(ui_bar);
circular_bar_deactivate(bar_border);

var val = global.hp / global.mhp;

var fire_index = min(ceil(val * 3) * (val > 0), image_number - 1);
draw_sprite_ext(s_fire, fire_index, bar_x + 10, bar_y - 0, 2, 2, image_angle, image_blend, image_alpha);

var scale = 4;
var spacing = 75;
var _x = xx - spacing * 1.5;
var _y_offset = 50;

draw_set_halign(fa_right);

for (var i = 0; i < ITEM_TYPES.COUNT; ++i)
{
  var _y = _y_offset + spacing * (i) - scale * 2;
  var item = global.items[i], c = (item == 0) ? merge_color(#dc143c, #a00000, wave(0, 1, 1.5)) : merge_color(#d0d0ff, #b0b0ff, wave(0, 1, 1.5));
    draw_text_transformed_color(
    _x,
    _y + scale,
    $"{global.items[i]} x ",
    scale,
    scale,
    image_angle,
    c_black,
    c_black,
    c_black,
    c_black,
    .5
  );
  draw_text_transformed_color(
    _x,
    _y,
    $"{global.items[i]} x ",
    scale,
    scale,
    image_angle,
    c,
    c,
    c,
    c,
    1
  );
  draw_sprite_ext(
    item_sprites[i],
    0,
    _x,
    _y - scale * 3,
    scale,
    scale,
    image_angle,
    image_blend,
    image_alpha
  );
}

draw_set_halign(fa_left);


if (room != rm_forest)
  exit;

var house_distance_ratio = point_distance(
  o_player.x, o_player.y, global.house_coords.x, global.house_coords.y
) / 50;

var arrow_distance = 5;
scale = math_dual_proportion(house_distance_ratio, 50, 0, 4, 1);
var arrow_angle = point_direction(o_player.x, o_player.y, global.house_coords.x, global.house_coords.y);

if (o_player.state_current != o_player.state_interact)
  draw_sprite_ext(
    s_radio_arrow,
    0,
    xx / 2 + lengthdir_x(arrow_distance, arrow_angle) * house_distance_ratio,
    yy / 2 + lengthdir_y(arrow_distance, arrow_angle) * house_distance_ratio,
    scale,
    scale,
    arrow_angle,
    image_blend,
    image_alpha
  );
