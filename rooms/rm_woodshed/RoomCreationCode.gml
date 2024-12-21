draw = function()
{
  image_speed = 1 / sprite_get_info(s_drenneth_blow).frame_speed;
  
  var m1 = 300;
  var m2 = room_height;

  if (global.drenneth == 3 && !data.tile_thrown)
  {
    draw_sprite(s_drenneth_blow, image_index, x, y);
  }
  else if (data.tile_thrown && data.target_y != m1)
  {
    draw_sprite(s_drenneth_damage, image_index, x, y);
    y = smoothen(y, m1, 8);
    data.target_y = m1 * (y - 1 < m1);
  }
  
  if (data.target_y == m1)
  {
    image_alpha -= image_speed / 12;
    draw_sprite(s_drenneth_damage, image_index, x, y);
    y = smoothen(y, m2, 25);
  }

  if (image_alpha == 0)
  {
    data.tile_thrown = false;
    image_alpha = 1;
    y = 375;
    data.target_y = y;
  }
}