data.drenneth_x = 0;
data.drenneth_y = 0;
data.drenneth_target_x = 0;
data.drenneth_target_y = 0;

draw = function()
{
  var sprite = s_drenneth_blow;
  image_speed = 1 / sprite_get_info(sprite).frame_speed / 4;
  
  if (global.drenneth == 1)
  {
    // Will I be able to do it?
    var _x = data.drenneth_x, _y = data.drenneth_y;
    var _tx = data.drenneth_target_x, _ty = data.drenneth_target_y;
    data.drenneth_x = approach(_x, _tx, irandom_range(8, 10));
    data.drenneth_y = approach(_y, _ty, irandom_range(8, 10));
    
    if (_x == _tx && _y == _ty)
    {
      data.drenneth_target_x = irandom(room_width);
      data.drenneth_target_y = irandom(room_height);
    }

    var dir = (_ty > _y) ? 3 : 1; 
    sprite = asset_get_index($"s_drenneth_walk_{dir}");
    image_speed = 1 / sprite_get_info(sprite).frame_speed / 10;
    draw_sprite(sprite, image_index, _x, _y);
    return;
  }
  
  sprite = s_drenneth_tiles;
  image_speed = 1 / sprite_get_info(sprite).frame_speed / 4;

  if (global.drenneth == 2)
  {
    y = global.house_coords.y + 1;
    var drenneth_x = global.house_coords.x + 180;
    var drenneth_y = global.house_coords.y - 200;
    draw_sprite(sprite, image_index, drenneth_x, drenneth_y);
  }
}