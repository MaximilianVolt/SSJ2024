var images = {
  rm_forest: (global.time > global.time_night) ? s_snow_overlay : noone,
  rm_house: s_house_overlay,
  rm_woodshed: s_house_overlay,
};

var image = images[$ room_get_name(room)];

sprite_swap_asset(image, 75, 75);