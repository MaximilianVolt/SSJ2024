/// @description Insert description here
// You can write your code in this editor
if (!global.is_night)
  exit;

drenneth = drenneth_behaviors[global.drenneth]();
ash = ash_behaviors[global.ash]();

var drenneth_is_attacking = drenneth == drenneth_3;
var ash_is_attacking = ash == ash_3;

global.fire_under_attack = drenneth_is_attacking || ash_is_attacking;
global.fire_damage = global.fire_damage_base + global.roof_is_damaged * 2 + drenneth_is_attacking * 23 + ash_is_attacking * 8;

switch (global.transition_room)
{
  case rm_forest:
  case rm_woodshed:
  case rm_house:
  case noone:
  break;
 
  default:
    time_source_stop(drenneth_ts);
    time_source_stop(ash_ts);
}