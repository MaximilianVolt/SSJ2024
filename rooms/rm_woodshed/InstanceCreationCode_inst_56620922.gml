draw = function()
{
  var sprite = s_ash_idle_redeye;
  image_speed = 1 / sprite_get_info(sprite).frame_speed;

  if (global.ash == 2)
  {
    var ash_x = 500;
    var ash_y = 250;
    draw_sprite(sprite, image_index, ash_x, ash_y);
  }
}