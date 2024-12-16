target_x = x;
target_y = y;

ww = view_get_wport(view_camera);
wh = view_get_hport(view_camera);

w = ww / scale;
h = wh / scale;

camera_set_view_size(view_camera[0], w, h);

//camera_refresh_region = function(_x, _y, w, h)
//{
//	//instance_deactivate_region(_x, _y, _x + w, _y + h, false, true);	
//}

//timesource_update = time_source_create(
//	time_source_global,
//	1,
//	time_source_units_seconds,
//	camera_refresh_region,
//	[x - w, y - h, w * 1.5, h * 1.5],
//	-1
//);

//time_source_start(timesource_update);