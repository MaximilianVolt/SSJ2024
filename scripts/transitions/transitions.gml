global.transition_layer = "Transitions";
global.transition_depth = -9999;
global.transition_room = noone;
global.transitioning = false;



function transition_prepare(transition, xscale, yscale, speedscale)
{
	if (layer_exists(global.transition_layer))
		layer_destroy(global.transition_layer);

	var _layer = layer_create(global.transition_depth, global.transition_layer);

	var sequence = layer_sequence_create(_layer, 0, 0, transition);
	layer_sequence_xscale(sequence, xscale);
	layer_sequence_yscale(sequence, yscale);
	layer_sequence_speedscale(sequence, speedscale);
}



function transition_begin(target_room, transition_out, transition_in, xscale = 1, yscale = 1, out_speedscale = 1, in_speedscale = 1)
{
	if (global.transitioning)
		return false;

	global.transitioning = true;
	global.transition_room = target_room;

	transition_prepare(transition_out, xscale, yscale, out_speedscale);
	layer_set_target_room(target_room);
	transition_prepare(transition_in, xscale, yscale, in_speedscale);
	layer_reset_target_room();

	return true;
}



function transition_end()
{
	layer_sequence_destroy(self.elementID);
	global.transitioning = false;
}



function transition_teleport()
{
	room_goto(global.transition_room);
}