instance_create_layer(0, 0, "Instances", o_video, {
	path: "merrychristmas.mp4"
});

timesource = time_source_create(
	time_source_global,
	15,
	time_source_units_seconds,
	function() {
		video_close();
		transition_begin(rm_intro_2, sq_fadeout, sq_fadein, 3, 3, 1, 1 / 3);
	}
);

time_source_start(timesource);
