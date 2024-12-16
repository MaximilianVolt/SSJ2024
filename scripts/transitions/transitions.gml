global.transition_layer = "Transitions";
global.transition_depth = -9999;
global.transition_room = noone;
global.transitioning = false;
global.transition_callback = function() {};
global.transition_callback_args = [];




function transition_prepare(transition, xscale, yscale, speedscale)
{
	if (layer_exists(global.transition_layer))
		layer_destroy(global.transition_layer);

	var layer_world = layer_create(global.transition_depth, global.transition_layer);

	var sequence = layer_sequence_create(layer_world, 0, 0, transition);
	layer_sequence_xscale(sequence, xscale);
	layer_sequence_yscale(sequence, yscale);
	layer_sequence_speedscale(sequence, speedscale);
}



function transition_begin(target_room, transition_out, transition_in, callback = function() {}, args = [], xscale = 1, yscale = 1, out_speedscale = 1, in_speedscale = 1)
{
	if (global.transitioning)
		return false;

	global.transitioning = true;
	global.transition_room = target_room;
	global.transition_callback = callback;
	global.transition_callback_args = args;

	transition_prepare(transition_out, xscale, yscale, out_speedscale);
	layer_set_target_room(target_room);
	transition_prepare(transition_in, xscale, yscale, in_speedscale);
	layer_reset_target_room();

	return true;
}



function transition_end()
{
	layer_sequence_destroy(self.elementID);

	var timesource = time_source_create(
		time_source_global,
		0,
		time_source_units_seconds,
		global.transition_callback,
		global.transition_callback_args
	);

	time_source_start(timesource);

	global.transitioning = false;
}



function transition_teleport()
{
	room_goto(global.transition_room);
}