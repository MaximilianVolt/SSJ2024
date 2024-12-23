with (o_player)
{
  if (
    global.hp >= 0
    && global.hp < global.mhp  
    && player_can_interact(other)
    && game_action(inputs, INPUT_FLAGS.KEY_INTERACT)
    && global.items[ITEM_TYPES.WOOD]
  ) {
    global.hp = min(global.hp + 60 * irandom_range(8, 12), global.mhp + 450);
    audio_play_sound(sfx_wood_drop, 100, false, 1, 0, random_range(.8, 1.2));
    global.items[ITEM_TYPES.WOOD]--;
  }
}

var val = global.hp / global.mhp;
stage_index = min(ceil(val * stage_count) * (val > 0), stage_count);