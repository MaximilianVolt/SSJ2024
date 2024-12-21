if (global.is_night && global.time < global.time_max)
{
  var c = c_black;
  draw_set_alpha(image_alpha * .75);

  with (o_camera)
    draw_rectangle_color(x - w, y - h, x + w, y + h, c, c, c, c, false);

  if (room == rm_house)
  {
    with (o_fire)
      draw_sprite_ext(
        s_fire_glow,
        stage_index,
        x,
        y - 16,
        wave(1, 1.25, 5),
        wave(1, 1.25, 5),
        image_angle,
        image_blend,
        image_alpha
      );
  }

  draw_set_alpha(1);
}
