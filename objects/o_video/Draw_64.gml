var data = video_draw();

if (data[@ 0] == 0)
	draw_surface_stretched(data[@ 1], x, y, view_get_wport(view_camera), view_get_hport(view_camera));