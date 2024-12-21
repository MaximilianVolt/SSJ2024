if (img_asset != img_target_asset)
{
  image_alpha = approach(image_alpha, 0, 1 / img_fadeout_time);

  if (image_alpha == 0)
    img_asset = img_target_asset;
}
else if (global.is_night)
{
  image_alpha = approach(image_alpha, 1, 1 / img_target_fadein_time);
}

if (!img_asset)
  exit;

var x_scale = xx / sprite_get_width(img_asset);
var y_scale = yy / sprite_get_height(img_asset);

if (img_allow_animation)
{
  image_xscale = wave(x_scale, x_scale * 1.1, 5);
  image_yscale = wave(y_scale, y_scale * 1.1, 5);  
}
else
{
  image_xscale = x_scale * x_scale_multiplier;
  image_yscale = y_scale * y_scale_multiplier;
}