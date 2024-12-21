

var xx = view_get_wport(view_camera);
var yy = view_get_hport(view_camera);

instance_create_layer(
  xx / 2,
  yy - 80,
  "Instances",
  o_text_menu,
  {
    text: "Try again?",
    text_speed: .1,
    image_xscale: 2,
    image_yscale: 2
  }
);

