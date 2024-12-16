offset = 75;

var yy = view_get_hport(view_camera);

x = view_get_wport(view_camera) / 2;
y = (yy - offset) / 2;

scale = yy / (sprite_get_height(s_newspaper) + offset);