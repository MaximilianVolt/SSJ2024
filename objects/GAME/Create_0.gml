// Game database

data = {
	entities: {
		player: {
			spd_run: 3,
		},
	},
	assets: {
		game: {
		},
		ui: {
			font: font_add_sprite(s_font_siderus, 32, true, 1)
		}
	},
};



// Input config



if (!global.world_generated)
	game_generate_forest_room();

draw_set_font(data.assets.ui.font);

