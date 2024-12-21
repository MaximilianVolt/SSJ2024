handler = function()
{
  if (
    global.drenneth == 3
    && o_controller.inputs & o_controller.input_mask
    && global.items[ITEM_TYPES.TILE]
  ) {
    audio_play_sound(sfx_tile_break, 100, false, 1, 0, random_range(.8, 1.2));
    global.items[ITEM_TYPES.TILE]--;
    global.drenneth = 0;
    o_enemy.data.tile_thrown = true;
    global.tile_thrown = true;
  }
}