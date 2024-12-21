/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (size != SIZES.SMARTINO)
  exit;

with (o_player)
{
  if (
    player_can_interact(other, 75, 360)
    && game_action(inputs, INPUT_FLAGS.KEY_INTERACT)
  ) {
    audio_play_sound(sfx_honk, 100, false, 1, 0, random_range(.8, 1.2));

    for (var i = array_length(global.items) - 1; i + 1; --i)
      global.items[i]++;
    
    audio_play_sound(sfx_lock, 100, false, 1, 0, random_range(.8, 1.2));
    audio_play_sound(sfx_watch_grab, 100, false, 1, 0, random_range(.8, 1.2));
    audio_play_sound(sfx_wood_drop, 100, false, 1, 0, random_range(.8, 1.2));
    
    instance_destroy(other);
  }
}

