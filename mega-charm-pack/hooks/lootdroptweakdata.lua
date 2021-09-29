if not _G.MWC then
	dofile(ModPath .. 'scripts/setup.lua')
end

-- add our custom dlcs
Hooks:PostHook(
	LootDropTweakData,
	'init',
	'MWC_LDTD_init',
	function(self, tweak_data)
		for k, v in pairs(MWC.dlc) do
			-- see global_value examples in the decompiled payday lua, not worth documenting here
			self.global_values[k] = {
				-- text/loc
				name_id = 'bm_global_value_' .. k,
				desc_id = 'menu_l_global_value_' .. k,
				color = v.colour or tweak_data.screen_colors.event_color,
				-- unlocking
				dlc = false,
				free = true,
				hide_unavailable = false,
				chance = 1,
				value_multiplier = 1,
				durability_multiplier = 1,
				drops = false,
				track = true,
				-- display
				sort_number = 1,
				category = 'dlc'
			}
		end
	end
)
