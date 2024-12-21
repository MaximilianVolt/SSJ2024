if (distance_to_object(o_player) < PLAYER_INTERACTION_RANGE / 2)
{
  global.items[type]++;
  audio_play_sound(type_sounds[type], 100, false, 1, 0, random_range(.8, 1.2));
  instance_destroy();
}
