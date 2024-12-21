target_x = x;
target_y = y;

ww = view_get_wport(view_camera);
wh = view_get_hport(view_camera);

w = ww / scale;
h = wh / scale;

camera_set_view_size(view_camera[0], w, h);