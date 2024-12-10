/**
 * 
 */

function player_get_movement_info(inputs)
{
  var key_up = game_action_check(inputs, INPUT_FLAGS.KEY_UP)
    , key_down = game_action_check(inputs, INPUT_FLAGS.KEY_DOWN)
    , key_left = game_action_check(inputs, INPUT_FLAGS.KEY_LEFT)
    , key_right = game_action_check(inputs, INPUT_FLAGS.KEY_RIGHT)
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
 * 
 * @param direction 
 * @param magnitude 
 * @param entity 
 * @returns 
 */

function player_collide(direction, magnitude, entity)
{
  var xspd = lengthdir_x(magnitude, direction);
  var yspd = lengthdir_y(magnitude, direction);
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

function player_can_interact(key)
{
	return true;
}







