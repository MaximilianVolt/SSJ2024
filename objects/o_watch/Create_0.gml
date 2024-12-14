xx = view_get_wport(view_camera);
yy = view_get_hport(view_camera);

x = -xx / 2;
y = yy;
image_alpha = -2;
target_image_alpha = 1;

target_x = xx / 2;
target_y = yy / 2 + 80;

rot = 120;
target_rot = 0;

animation_time = 2;

animation_in_timesource = time_source_create(
	time_source_global,
	animation_time,
	time_source_units_seconds,
	function(){}
);

animation_out_timesource = time_source_create(
	time_source_global,
	animation_time / 1.5,
	time_source_units_seconds,
	function(){
		instance_destroy();
	}
);

animation = function(timesource) {
	var anim_time = time_source_get_period(timesource);
	var time = (anim_time - time_source_get_time_remaining(timesource)) / anim_time;

	x += math_ease_out_bounce(time) * (target_x - x);
	y += math_ease_out_bounce(time) * (target_y - y);
	rot += math_ease_out_bounce(time) * (target_rot - rot);
	image_alpha = smoothen(image_alpha, target_image_alpha);
}

timesource = animation_in_timesource;
time_source_start(timesource);