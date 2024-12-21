handler = function()
{
  if (
    o_controller.inputs & o_controller.input_mask
    && !global.window_is_locked
  ) {
    if (global.window_is_open)
    {
      audio_play_sound(sfx_creaking, 100, false);
    }
    
    if (global.items[ITEM_TYPES.LOCK] && !global.window_is_open)
    {
      audio_play_sound(sfx_lock, 100, false, 1, 0, random_range(.8, 1.2));
      global.items[ITEM_TYPES.LOCK]--;
      global.window_is_locked = true;
    }
    
    global.window_is_open = false;
    global.ash = 0;
  }

  audio_swap_sound(
    (global.window_is_open
      ? bgs_snowstorm
      : bgs_wind_indoor)  
    ,
    2,
    1,
    true
  );
}