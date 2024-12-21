if (!instance_exists(o_player))
	exit;

var value = global.hp / global.mhp;

bar.value = clamp(smoothen(bar.value, value), 0, 1);

if (value < 1 / 3 || global.fire_under_attack)
{
	circular_bar_flash(bg_bar, [c_black, c_red], 1, [.25, .5], 1);
	circular_bar_flash(bar_border, [c_black, c_red], 1);
}

if (global.time >= global.time_max)
{
  var col = #20ff7e;
  bar.color = col;
  circular_bar_flash(bg_bar, [c_black, col], 1, [.25, .5], 1);
  circular_bar_flash(bar_border, [c_black, col], 1);
}