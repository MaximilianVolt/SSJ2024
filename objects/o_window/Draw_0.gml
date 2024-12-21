if (global.ash >= 2)
{
  var _x = x + sprite_width / 2 - sprite_get_width(s_ash_window) / 2;
  var _y = y + sprite_height - sprite_get_height(s_ash_window);
  draw_sprite(s_ash_window, image_index, _x, _y);
}

draw_sprite(s_window, global.window_is_open, x, y);

if (global.window_is_locked)
{
  var _x = x + sprite_width / 2 - sprite_get_width(s_lock) / 2;
  var _y = y + sprite_height - sprite_get_height(s_lock) / 2;
  
  draw_set_halign(fa_center);
  draw_set_valign(fa_middle);
  draw_sprite(s_lock, 0, _x, _y);
  draw_set_halign(fa_left);
  draw_set_valign(fa_top);
}

