local register_node = core.register_node


register_node('default:granite', {
    description = 'Granite',
    _extra_desc = 'It is *very* heavy',
    tiles = { {name = 'default_granite.png', align_style="world", scale=2} },
    groups = { oddly_breakable_by_hand = 3 },
    is_ground_content = true
})

register_node('default:grass', {
    description = 'Grass',
    _extra_desc = 'A patch of turf.',
    tiles = { {name = 'default_grass.png', align_style="world", scale=2} },
    groups = { oddly_breakable_by_hand = 3 },
    is_ground_content = true
})

register_node('default:dirt', {
    description = 'Dirt',
    _extra_desc = 'It\'s dirty.',
    tiles = { {name = 'default_dirt.png', align_style="world", scale=2} },
    groups = { oddly_breakable_by_hand = 3 },
    is_ground_content = true
})


core.register_node("default:water", {
	description = 'Water Source',
	drawtype = "liquid",
	waving = 3,
	tiles = {
		{
			name = "default_water_source_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "default_water_source_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_viscosity = 3,
	post_effect_color = {a = 200, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, cools_lava = 1},
	--sounds = default.node_sound_water_defaults(),
})
