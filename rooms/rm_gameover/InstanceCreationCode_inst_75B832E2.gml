

event_handler = function()
{
  if (o_controller.inputs & o_controller.input_mask)
    transition_begin(rm_intro_2, sq_fadeout, sq_fadein,,, 3, 3, .1, .25);
}