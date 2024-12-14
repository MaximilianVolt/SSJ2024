if (!instance_exists(o_player))
	exit;

bar.value = clamp(smoothen(bar.value, global.hp / global.mhp), 0, 1);