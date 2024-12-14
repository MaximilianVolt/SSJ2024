event_handler = function()
{
	if (o_controller.inputs & o_controller.input_mask)
		room_goto(rm_intro_2);
}