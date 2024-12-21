stage_count = 3;
frames_per_animation = 4;

var val = global.hp / global.mhp;
stage_index = min(ceil(val * stage_count) * (val > 0), stage_count) * frames_per_animation;