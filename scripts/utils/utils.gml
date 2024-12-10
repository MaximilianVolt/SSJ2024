/**
 * Checks if a key is pressed.
 * @param {Array<Constant.VirtualKey} keys - The array of keys to check.
 * @param {Function(<Constant.VirtualKey>): Bool} [chk_fn] - The function to check the keys with.
 */

function game_keyboard_check(keys, chk_fn = keyboard_check)
{
  var arrlen = array_length(keys), check = false;

  for (var i = 0; i < arrlen && !check; ++i)
    check = chk_fn(keys[i]);

  return check;
}



/**
 * Returns the flag combination of all the detected inputs.
 * @param {Array<Struct>} [controls] - The inputs to check.
 * @returns {Real}
 */

function game_get_inputs(controls = GAME.controls)
{
  var keys = variable_struct_get_names(controls);
  var key_count = array_length(keys);
  var bitfield = 1 << GAME.input_mode + key_count;

  for (var i = 0; i < key_count; ++i)
    with (controls[$ keys[@ i]])
      bitfield |= game_keyboard_check(inputs, chk_fn) << flag;

  return bitfield;
}



/**
 * Checks if an action is performed.
 */

function game_action_check(inputs, flag)
{
  return inputs >> flag & 1;
}