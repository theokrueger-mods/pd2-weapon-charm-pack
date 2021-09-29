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
	--[[
		append our custom charms to weapon charms
		it is better to do it here than where this is called because it saves performance and complexity
		both require func_old anyways
	--]]
	for k, v in pairs(MWC.charms) do
		weapon_charms['wpn_fps_upg_charm_' .. k] = {
			-- models and texutures
			type = 'charm',
			unit = 'units/pd2_dlc_mods/weapons/wpn_fps_upg_charms/' .. k .. '/wpn_fps_upg_charm_' .. k,
			third_unit = 'units/pd2_dlc_tawp/weapons/wpn_fps_upg_charms/wpn_third_upg_charm_bag',
			a_obj = 'a_charm',
			texture_bundle_folder = 'mods',
			-- custom dlc
			dlc = v.dlc or nil,
			is_a_unlockable = true,
			-- text/loc
			name_id = 'bm_wp_upg_charm_' .. k,
			desc_id = 'bm_wp_upg_charm_' .. k .. '_desc',
			has_description = true,
			-- weaponfactorytweakdata stuff
			pcs = {},
			stats = {
				-- TODO: make it cost free?
				value = 1
			}
		}
	end

	-- old function takes the new weapon_charms table
	return _add_charms_to_all_weapons_old(
		self,
		tweak_data,
		weapon_charms,
		weapon_overrides,
		part_overrides,
		weapon_exclude_list
	)
end
