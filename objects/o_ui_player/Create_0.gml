var offset = -30;

bar_radius = 160;
bar_width = bar_radius / 8;
bar_border_width = bar_width / 3;
bar_x = bar_radius + offset;
bar_y = bar_radius + offset;
bar_colors = [ #ff0000, #ff4000, #ff8000 ];
bar_edge = 21;

bar = circular_bar_create_from_center(
	bar_x,
	bar_y,
	bar_radius,
	bar_width,
	315,
	180,
	1,
	CIRCULAR_BAR_PRECISION_PRESETS.PLUS_ULTRA,
	bar_colors,
	1,
	bar_edge,
	bar_edge,
);

circular_bar_generate_divisors(bar, 2, 8, bar_edge);
bar_border = circular_bar_create_border_bar(bar, bar_border_width, c_black);

circular_bar_add_divisors(bar, [circular_bar_create_divisor(135, 180)]);
bar.start_angle -= 4.43;

ui_bar = advanced_circular_bar_create(bar_x, bar_y, [bar_border, bar]);
