xx = view_get_wport(view_camera);
yy = view_get_hport(view_camera);

time = 5;
time2 = 3;

timesource2 = time_source_create(
	time_source_global,
	time2,
	time_source_units_seconds,
	function() {
		event_handler = undefined;
		instance_destroy(o_ui_newspaper);
		transition_begin(rm_forest, sq_fadeout, sq_fadein,,, 2, 2, .3, .3);
	}
);


timesource = time_source_create(
	time_source_global,
	time,
	time_source_units_seconds,
	function() {
		instance_create_layer(
			xx / 2,
			yy - 45,
			"Instances",
			o_text_menu,
			{
				text_speed: .25,
				text: "Press any key to continue.",
				image_xscale: 3,
				image_yscale: 3,
			}
		);

		event_handler = function()
		{
			if (o_controller.inputs & o_controller.input_mask)
			{
				instance_destroy(o_text_menu);
				
				if (time_source_get_state(timesource2) != time_source_state_active)
					time_source_start(timesource2);
			}

			var progress = (time2 - time_source_get_time_remaining(timesource2)) / time2;
			o_ui_newspaper.image_alpha = 1 - progress;
		};
	}
);



instance_create_layer(
	xx / 2,
	yy / 2 - 120,
	"Instances",
	o_text_menu,
	{
		text: $"GMI - Secret Santa Jam 2024\n\nA LIGHT BEFORE CHRISTMAS\n\n{ansi_char(0x7f)}",
		image_xscale: 4.5,
		image_yscale: 4.5,
		text_speed: .35,
	}
);

instance_create_layer(
	0,
	0,
	"Instances",
	o_ui_newspaper,
	{
		image_alpha: 0,
		sprite: s_newspaper,
		interacted: true
	}
);

event_handler = function()
{
	var progress = (time - time_source_get_time_remaining(timesource)) / time;

	o_ui_newspaper.image_alpha = progress;

	if (o_controller.inputs & o_controller.input_mask)
	{
    audio_swap_sound(bgs_forest, 120, 120, true);
		instance_destroy(o_text_menu);
		
		if (time_source_get_state(timesource) != time_source_state_active)
			time_source_start(timesource);
	}
};