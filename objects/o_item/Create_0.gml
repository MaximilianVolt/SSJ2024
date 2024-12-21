enum ITEM_TYPES {
  WOOD,
  LOCK,
  TILE,
  COUNT
}

type_chances = [50, 1, 1];
type_sprites = [s_wood, s_lock, s_tile];
type_sounds = [sfx_wood_drop, sfx_lock, sfx_watch_grab];

type = chance_weighted(type_chances);

sprite_index = type_sprites[type];