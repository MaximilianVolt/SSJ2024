var _event_type = "event_type";
var _sprite_event = "sprite event";

if (event_data[? _event_type] != _sprite_event)
{
	return;
}

var _step = "step"
var _message = "message";

var sound_asset;
var _location = (room == rm_forest)
	? "indoor"
	: "indoor"
;

switch (event_data[? _message])
{
	default:
	break;

	case _step:
		sound_asset = $"sfx_{_step}_{_location}_{irandom(3)}";
}

sound = audio_play_sound(
	asset_get_index(sound_asset),
	100,
	false,
	.05,
	0,
	random_range(.7, 1.1)
);