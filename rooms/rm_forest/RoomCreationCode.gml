game_load_forest_room();

audio_emitter_position(o_snd_manager.emitter, global.house_coords.x, global.house_coords.y, 0);
audio_falloff_set_model(audio_falloff_linear_distance);

var item_count = irandom_range(45, 60);
var border_offset = 350;

for (var i = 0; i < item_count; ++i)
{
  var item = instance_create_layer(
    0,
    0,
    "World",
    o_item
  );

  with (item)
  {
    do
    {
      x = irandom_range(border_offset, room_width - border_offset);
      y = irandom_range(border_offset, room_height - border_offset);
    }
    until (
      distance_to_object(instance_nearest(x, y, o_environment)) > 5
      && distance_to_object(o_player) > 300
    );
  }
}