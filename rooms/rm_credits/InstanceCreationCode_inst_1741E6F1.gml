var xx = view_get_wport(view_camera);
var yy = view_get_hport(view_camera);

index = 0;
sprites = [s_thank_you, s_credits];

instance_create_layer(
  xx / 2,
  yy - 75,
  "Instances",
  o_text_menu,
  {
    text: "Press [LMB] to switch credits view",
    text_speed: .6,
    image_xscale: 4,
    image_yscale: 4
  }
);

event_handler = function()
{
  audio_swap_sound(bgm_radio_loop_static, 180, 300, true);

  if (!audio_is_playing(bgm_radio_loop_static))
    audio_play_sound(bgm_radio_loop_static, 150, true, 1.5);

  index = (index + mouse_check_button_pressed(mb_left)) % 2;
	sprite_swap_asset(sprites[index], 0, 180);
  o_img_manager.x_scale_multiplier = 1 - index * .68;
  o_img_manager.y_scale_multiplier = 1 - index * .2;
};