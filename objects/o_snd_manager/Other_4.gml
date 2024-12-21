var sound = noone;

switch (room)
{
  case rm_forest:
    sound = bgs_forest;
  break;
  
  case rm_house: 
  case rm_woodshed:
    sound = (global.fire_under_attack) ? bgs_snowstorm : bgs_wind_indoor;
  break;
}

audio_swap_sound(sound, 120, 120, true);