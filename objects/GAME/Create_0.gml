randomize();

// Game database

data = {
	entities: {
		player: {
			spd_run: 12.5,
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

enum INPUT_FLAGS {
	KEY_UP,
	KEY_DOWN,
	KEY_LEFT,
	KEY_RIGHT,
	KEY_INTERACT,
	KEY_RUN,
	KEY_CLOCK,
	COUNT
}

enum INPUT_MODE_FLAGS {
	IN_GAME,
	UI,
	COUNT
};

controls = {
	key_up: {
		flag: INPUT_FLAGS.KEY_UP,
		inputs: [vk_up, ord("W")],
		chk_fn: keyboard_check
	},
	key_down: {
		flag: INPUT_FLAGS.KEY_DOWN,
		inputs: [vk_down, ord("S")],
		chk_fn: keyboard_check
	},
	key_left: {
		flag: INPUT_FLAGS.KEY_LEFT,
		inputs: [vk_left, ord("A")],
		chk_fn: keyboard_check
	},
	key_right: {
		flag: INPUT_FLAGS.KEY_RIGHT,
		inputs: [vk_right, ord("D")],
		chk_fn: keyboard_check
	},
	key_interact: {
		flag: INPUT_FLAGS.KEY_INTERACT,
		inputs: [vk_space, ord("Z"), ord("E")],
		chk_fn: keyboard_check_pressed
	},
	key_run: {
		flag: INPUT_FLAGS.KEY_RUN,
		inputs: [vk_shift],
		chk_fn: keyboard_check
	},
	key_clock: {
		flag: INPUT_FLAGS.KEY_CLOCK,
		inputs: [ord("C")],
		chk_fn: keyboard_check_pressed
	}
};

instance_create_layer(x, y, "Managers", o_controller);
input_mode = INPUT_MODE_FLAGS.UI;

draw_set_font(data.assets.ui.font);
