with (o_player)
{
  if (
    position_meeting(x, y, other)
    && game_action(inputs, INPUT_FLAGS.KEY_INTERACT)
    && typeof(other.handler) == "method"
  ) {
    other.handler();
  }
}