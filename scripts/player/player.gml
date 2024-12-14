#macro PLAYER_INTERACTION_RANGE 16

global.time = 0;
global.mhp = 3600 * 4;
global.hp = global.mhp + 1000;
global.time_max = 3600 * 10;

global.time_timesource = time_source_create(
	time_source_global,
	1,
	time_source_units_seconds,
	function() {
		time_source_start(global.time_timesource);
		global.time++;
	}
);



/**
 * 
 */

function player_get_motion(inputs)
{
  var key_up = game_action(inputs, INPUT_FLAGS.KEY_UP)
    , key_down = game_action(inputs, INPUT_FLAGS.KEY_DOWN)
    , key_left = game_action(inputs, INPUT_FLAGS.KEY_LEFT)
    , key_right = game_action(inputs, INPUT_FLAGS.KEY_RIGHT)
  ;

  var dir_x = key_right - key_left
    , dir_y = key_down - key_up
  ;

  return {
    direction: point_direction(0, 0, dir_x, dir_y),
    magnitude: abs(dir_x) || abs(dir_y)
  };
}



/**
 * @param {Constant.GMObject} entity 
 * @param {Bool} [any]
 * @returns 
 */

function player_collide(entity, xspd, yspd, any = true)
{
	var coll_h = move_and_collide(xspd, 0, entity, round(abs(xspd)));
	var coll_v = move_and_collide(0, yspd, entity, round(abs(yspd)));

	return (any)
    ? array_length(coll_h) || array_length(coll_v)
    : [coll_h, coll_v]
  ;
}



/**
 * 
 */

function player_can_interact(item, distance = PLAYER_INTERACTION_RANGE, range = 45)
{
  if (!item)
    return false;

  var dir = point_direction(x, y, item.x, item.y)
	  , dist = distance_to_point(item.x, item.y)
	;

	return in_range_difference(motion.direction, dir, range)
    && dist <= distance
	;
}
