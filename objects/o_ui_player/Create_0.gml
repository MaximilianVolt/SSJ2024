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

bg_bar = circular_bar_clone(bar, c_black, .6);
bg_bar.radius = bar_radius - bar_width - bar_border_width + 3;
bg_bar.width = bg_bar.radius;
bg_bar.start_angle = 200;
bg_bar.end_angle = 430;
bg_bar.edge_type_start = 20;
bg_bar.edge_type_final = 20;
bg_bar.divisors = [];

ui_bar = advanced_circular_bar_create(bar_x, bar_y, [bg_bar, bar_border, bar]);

bar.value = 0;