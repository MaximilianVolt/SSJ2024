if (instance_exists(target))
{
	target_x = target.x;
	target_y = target.y;
}

x = smoothen(x, target_x);
y = smoothen(y, target_y);

var _x = clamp(x - w / 2, 0, room_width - w);
var _y = clamp(y - h / 2, 0, room_height - h);

camera_set_view_pos(view_camera[0], _x, _y);

instance_deactivate_object(o_environment);
instance_activate_region(_x, _y, w * 3, h * 3, true);
