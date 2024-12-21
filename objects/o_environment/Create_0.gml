enum SIZES
{
  SMALL,
  MEDIUM,
  BIG,
  SMARTINO,
  COUNT
}

collision_masks = [
	s_collider_small,
	s_collider_medium,
	s_collider_big,
	s_collider_big
];

mask_index = collision_masks[@ size];
