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

function game_action(inputs, flag)
{
  return inputs >> flag & 1;
}



/**
 *
 */

function math_dual_proportion(a, a1, a2, b1, b2)
{
	return (a - a1) / (a2 - a1) * (b2 - b1) + b1;
}



/**
 *
 */

function game_frequency_to_wheel_angle(center, amplitude)
{
	var f = global.radio_frequency
		, m = global.radio_frequency_middle
		, r = global.radio_frequency_range
	;

	var start_angle = center - amplitude;
	var end_angle = center + amplitude;

	return math_dual_proportion(f, m - r, m + r, start_angle, end_angle);
}



/**
 *
 */

function game_wheel_angle_to_frequency(angle, center, amplitude)
{
	var start_angle = center - amplitude
		, end_angle = center + amplitude
	;

	var m = global.radio_frequency_middle
		, r = global.radio_frequency_range
	;

	return math_dual_proportion(angle, start_angle, end_angle, m - r, m + r);
}



/**
 *
 */
 
function game_generate_forest_room()
{
	var room_data = [];
	var room_info = room_get_info(rm_forest);
	var range = 500;
	var mx = room_info.width >> 1;
	var my = room_info.height >> 1;
	var house_x = irandom_range(mx - range, mx + range);
	var house_y = irandom_range(my - range, my + range);

	global.house_coords = {
		x: house_x,
		y: house_y
	};

	global.teleport = {
		x: house_x + 63,
		y: house_y + 100
	};

	var instance_generation_count = 2000;

	repeat (instance_generation_count)
	{
		var inst_x, inst_y;

		do
		{
			inst_x = irandom(5000);
			inst_y = irandom(5000);
		}
		until (point_distance(inst_x, inst_y, house_x + 300, house_y - 150) > range);

		var size_chances = [300, 180, 90, 1];
		var sprites = [
			[s_pole, s_bush, s_rock_2, s_rock_3],
			[s_tree],
			[s_rock_4, s_log],
			[s_smartino]
		];

		var size = chance_weighted(size_chances);
		var sprite_idx = irandom(array_length(sprites[@ size]) - 1);

		var inst_data = {
			sprite_index: sprites[@ size][@ sprite_idx],
			has_snow: chance(.3),
			size
		};

		array_push(room_data, {
			x: inst_x,
			y: inst_y,
			inst_data
		});
	}

	global.forest_data_objects = room_data;
	global.world_generated = true;
}



/**
 *
 */
 
function game_load_forest_room()
{
	var layer_world = "World"
		, layer_colliders = "Colliders";

	if (!layer_exists(layer_world))
		layer_world = layer_create(-1000, layer_world);

	if (!layer_exists(layer_colliders))
		layer_colliders = layer_create(0, layer_colliders);

	var house_x = global.house_coords.x;	
	var house_y = global.house_coords.y;

	var woodshed_x = house_x + 500
		, woodshed_y = house_y - 50;

	instance_create_layer(house_x, house_y, layer_world, o_house);
	instance_create_layer(woodshed_x, woodshed_y, layer_world, o_woodshed);
	
	instance_create_layer(house_x + 50, house_y, layer_colliders, o_teleporter);
	instance_create_layer(woodshed_x + 25, woodshed_y, layer_colliders, o_teleporter, {
		image_xscale: 1
	});

	array_foreach(global.forest_data_objects, function(obj) {
		instance_create_layer(obj.x, obj.y, "World", o_environment, obj.inst_data);
	});
}



/**
 *
 */
 
 function game_over()
 {
	 global.world_generated = false;
	 o_player.state = o_player.state_interact;
	 time_source_destroy(global.time_timesource);
	 transition_begin(rm_intro_2, sq_fadeout, sq_fadein, function() {
		 game_reset_data();
		 audio_stop_all();
	 },, 4, 4, .1, .1);
 }
 
 
 
 /**
  *
	*/
	
function game_reset_data()
{
	global.time = 0;
	global.mhp = 36 * 4;
	global.hp = global.mhp + 60 * 1;
	global.time_max = 12 * 60;
	global.fire_under_attack = false;
	global.radio_frequency_middle = 75;
	global.radio_frequency_range = 50;
	global.radio_frequency = global.radio_frequency_middle;
	global.radio_neutralizer_frequency = irandom_range(
		global.radio_frequency_middle - global.radio_frequency_range,
		global.radio_frequency_middle + global.radio_frequency_range,
	);

	global.world_generated = false;
	global.teleport = {
		x: undefined,
		y: undefined
	};
	global.time_timesource = time_source_create(
		time_source_global,
		1,
		time_source_units_seconds,
		function() {
			global.time++;
		},
		[],
		-1
	);
}