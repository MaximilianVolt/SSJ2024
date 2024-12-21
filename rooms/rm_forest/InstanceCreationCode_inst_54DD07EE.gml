mask_index = s_collider_medium;

var offset = 200;

do
{
  x = irandom_range(offset, room_width - offset);
  y = irandom_range(offset, room_height - offset);
  
}
until (distance_to_object(o_player) > 500);

data.ash_x = x;
data.ash_y = y;

draw = function()
{
  var sprite = s_ash_idle;
  image_speed = 1 / sprite_get_info(sprite).frame_speed / 4;
  
  if (global.ash == 1)
  {
    draw_sprite(sprite, image_index, data.ash_x, data.ash_y);
  }
}