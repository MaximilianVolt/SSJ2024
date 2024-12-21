if (!img_asset)
  exit;

if (global.is_night && global.time < global.time_max)
{
  if (room == rm_forest)
  {
    var d1 = wave(current_time / 10, 2, 30);
    var d2 = wave(current_time / 10, 2, 30, .3);
    var d3 = wave(current_time / 10, 2, 30, .5);
    
    draw_set_alpha(.5);
    draw_sprite_tiled(s_snow_parallax_1, 0, d1, d1);
    draw_set_alpha(.2);
    draw_sprite_tiled(s_snow_parallax_2, 0, d2, -d2);
    draw_set_alpha(.1);
    draw_sprite_tiled(s_snow_parallax_3, 0, -d3, d3);
  }
  draw_set_alpha(1);
}

draw_sprite_ext(
  img_asset,
  image_index,
  xx / 2,
  yy / 2,
  image_xscale,
  image_yscale,
  image_angle,
  image_blend,
  image_alpha
);