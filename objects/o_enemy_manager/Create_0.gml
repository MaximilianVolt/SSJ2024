enum ENEMIES {
  DRENNETH,
  ASH,
  COUNT
}

depth = -9000;
image_speed = 1 / 30;

drenneth_ts = time_source_create(
  time_source_global,
  1,
  time_source_units_seconds,
  function(){}
);

ash_ts = time_source_create(
  time_source_global,
  1,
  time_source_units_seconds,
  function(){}
);

drenneth = function(){};
ash = function(){};

spawn_time =      75 * random_range(1, 1.5); // 90
drenneth_1_time = 45 * random_range(1, 1.5); // 45
drenneth_2_time = 30 * random_range(1, 1.5); // 30
ash_1_time =      45 * random_range(1, 1.5); // 45
ash_2_time =      55 * random_range(1, 1.5); // 55
max_delay = irandom_range(5, 15);

drenneth_0 = function()
{
  if (time_source_get_state(drenneth_ts) != time_source_state_active)
  {
    time_source_reconfigure(drenneth_ts, spawn_time, time_source_units_seconds, function() {
      global.radio_frequency = irandom_range(
        global.radio_frequency_middle - global.radio_frequency_range / 2,
        global.radio_frequency_middle + global.radio_frequency_range / 2
      );

      global.drenneth = 1;
      drenneth = drenneth_1;
    });
    time_source_start(drenneth_ts);
  }
  
  return drenneth_0;
}

drenneth_1 = function()
{
  // Approaching house if frequency not set
  if (time_source_get_state(drenneth_ts) != time_source_state_active)
  {
    time_source_reconfigure(drenneth_ts, irandom_range(drenneth_1_time, drenneth_1_time + max_delay), time_source_units_seconds, function() {
      if (
        round(global.radio_frequency) != global.radio_neutralizer_frequency
        || instance_exists(o_ui_radio)
      ) {
        audio_play_sound_on(o_snd_manager.emitter, sfx_tile_break, false, 100);
        drenneth = drenneth_2;
        global.drenneth = 2;
      }
    });
    time_source_start(drenneth_ts);
  }
  
  return drenneth_1;
}

drenneth_2 = function()
{
  // On house roof unless frequency is tuned
  if (
    round(global.radio_frequency) == global.radio_neutralizer_frequency
    && !instance_exists(o_ui_radio)
  )
  {
    time_source_stop(drenneth_ts);
    global.drenneth = 0;
    return;
  }

  if (global.roof_is_damaged)
  {
    global.drenneth = 3;
    return drenneth_3;
  }

  if (time_source_get_state(drenneth_ts) != time_source_state_active)
  {
    time_source_reconfigure(drenneth_ts, irandom_range(drenneth_2_time, drenneth_2_time + max_delay), time_source_units_seconds, function() {
      audio_play_sound_on(o_snd_manager.emitter, sfx_tile_break, false, 100);
      global.roof_is_damaged = true;
      global.drenneth = 3;
      drenneth = drenneth_3;
    });
    time_source_start(drenneth_ts);
  }
  
  return drenneth_2;
}

drenneth_3 = function()
{
  // Inside house
  return drenneth_3;
}



ash_0 = function()
{
  // Not in map
  if (time_source_get_state(ash_ts) != time_source_state_active)
  {
    time_source_reconfigure(ash_ts, spawn_time, time_source_units_seconds, function() {
      ash = ash_1;
      global.ash = 1;
    });
    time_source_start(ash_ts);
  }
  
  return ash_0;
}

ash_1 = function()
{
  // In map
  if (time_source_get_state(ash_ts) != time_source_state_active)
  {
    time_source_reconfigure(ash_ts, irandom_range(ash_1_time, ash_1_time + max_delay), time_source_units_seconds, function() {
      audio_play_sound_on(o_snd_manager.emitter, sfx_wood_falling, false, 100);
      ash = ash_2;
      global.ash = 2;
    });
    time_source_start(ash_ts);
  }
  
  return ash_1;
}

ash_2 = function()
{
  // In woodshed
  if (time_source_get_state(ash_ts) != time_source_state_active)
  {
    time_source_reconfigure(ash_ts, irandom_range(ash_2_time, ash_2_time + max_delay), time_source_units_seconds, function() {
      audio_play_sound_on(o_snd_manager.emitter, sfx_wood_falling, false, 100);
      ash = ash_0;
      global.ash = 0;
      
      if (!global.window_is_locked)
      {
        audio_play_sound(sfx_creaking, 100, false);
        global.window_is_open = true;
        ash = ash_3;
        global.ash = 3;
      }
      else
      {
        audio_play_sound(sfx_lock, 100, false);
      }
   
      global.window_is_locked = false;
    });
    time_source_start(ash_ts);
  }

  return ash_2;
}

ash_3 = function()
{
  // Window opened
  return ash_3;
}

drenneth_behaviors = [drenneth_0, drenneth_1, drenneth_2, drenneth_3];
ash_behaviors = [ash_0, ash_1, ash_2, ash_3];

drenneth = drenneth_behaviors[global.drenneth];
ash = ash_behaviors[global.ash];