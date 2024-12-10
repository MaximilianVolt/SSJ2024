if (target)
{
	target_x = target.x;
	target_y = target.y;
}

x = smoothen(x, target_x);
y = smoothen(y, target_y);

var _x = x - w / 2;
var _y = y - h / 2;

camera_set_view_pos(view_camera[0], _x, _y);
