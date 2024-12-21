
if (snd_asset != snd_target_asset)
{
  if (audio_is_playing(snd_instance))
  {
    array_push(snd_fadeout_instances, snd_instance);
    array_push(snd_fadeout_periods, snd_fadeout_time);
    array_push(snd_fadeout_volumes, snd_target_volume);
    
    snd_instance = noone;
    snd_asset = noone;
  }
  
  if (!array_length(snd_fadeout_instances) || snd_allow_overlap)
  {
    if (audio_exists(snd_target_asset))
    {
      snd_instance = audio_play_sound(snd_target_asset, 100, true, 0);
      snd_target_volume = 0;
    }
    
    snd_asset = snd_target_asset;
    snd_allow_overlap = false;
  }
}

if (audio_is_playing(snd_instance))
{
  if (snd_target_fadein_time > 0)
    snd_target_volume = min(snd_target_volume + 1 / snd_target_fadein_time, 1);
  else
    snd_target_volume = 1;
  
  audio_sound_gain(snd_instance, snd_target_volume, 0);
}

for (var i = array_length(snd_fadeout_instances) - 1; i >= 0; --i)
{
  if (snd_fadeout_periods[i] > 0)
    snd_fadeout_volumes[i] = max(snd_fadeout_volumes[i] - 1 / snd_fadeout_periods[i], 0);
  
  audio_sound_gain(snd_fadeout_instances[i], snd_fadeout_volumes[i], 0);
  
  if (snd_fadeout_volumes[i] == 0)
  {
    if (audio_is_playing(snd_fadeout_instances[i]))
      audio_stop_sound(snd_fadeout_instances[i]);
    
    array_delete(snd_fadeout_instances, i, 1);
    array_delete(snd_fadeout_periods, i, 1);
    array_delete(snd_fadeout_volumes, i, 1);
  }
}