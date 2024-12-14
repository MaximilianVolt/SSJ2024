//text_speed = smoothen(text_speed, .25);

if (text_index <= text_length)
{
	text_index += text_speed;
	text_to_draw = string_copy(text, 1, text_index)
}

var c = make_color_hsv(current_time / 16 % 255, 192, 192);
var h = string_height(text);

draw_set_halign(fa_center);
draw_text_transformed_color(x, y - h * image_yscale, text_to_draw, image_xscale * 2, image_yscale * 2, image_angle, c, c, c, c, .25);
draw_text_transformed_color(x, y - h + image_yscale, text_to_draw, image_xscale, image_yscale, image_angle, c, c, c, c, 1);
draw_text_transformed(x, y - h, text_to_draw, image_xscale, image_yscale, image_angle);
draw_set_halign(fa_left);