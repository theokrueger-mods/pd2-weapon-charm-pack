if not _G.MWC then
	dofile(ModPath .. 'scripts/setup.lua')
end

-- add our custom charms, an unfortunate oldinit
local _add_charms_to_all_weapons_old = WeaponFactoryTweakData._add_charms_to_all_weapons
function WeaponFactoryTweakData:_add_charms_to_all_weapons(
	tweak_data,
	weapon_charms,
	weapon_overrides,
	part_overrides,
	weapon_exclude_list)
	for k, v in pairs(MWC.charms) do
		weapon_charms['wpn_fps_upg_charm_' .. k] = {
			is_a_unlockable = true,
			texture_bundle_folder = 'mods',
			-- use bag model for thirdperson because fuck a thirdperson models
			third_unit = 'units/pd2_dlc_tawp/weapons/wpn_fps_upg_charms/wpn_third_upg_charm_bag',
			a_obj = 'a_charm',
			type = 'charm',
			-- if custom dlc defined (for text and such) then use it
			dlc = v.dlc or nil,
			has_description = true,
			name_id = 'bm_wp_upg_charm_' .. k,
			desc_id = 'bm_wp_upg_charm_' .. k .. '_desc',
			unit = 'units/pd2_dlc_mods/weapons/wpn_fps_upg_charms/wpn_fps_upg_charm_' .. k,
			pcs = {},
			stats = {
				value = 1
			}
		}
	end

	return _add_charms_to_all_weapons_old(
		self,
		tweak_data,
		weapon_charms,
		weapon_overrides,
		part_overrides,
		weapon_exclude_list
	)
end
