if not _G.MWC then
	dofile(ModPath .. 'scripts/setup.lua')
end

-- add our custom charms to our custom dlcs
Hooks:PostHook(
	DLCTweakData,
	'init',
	'MWC_DLCTD_init',
	function(self, tweak_data)
		-- add our created dlcs to dlctweakdata
		for k, _ in pairs(MWC.dlc) do
			self[k] = {
				-- make free here to not require hooking dlcmanager
				free = 'true',
				content = {
					-- global_value is define in hooks/lootdroptweakdata
					['loot_global_value'] = k,
					['loot_drops'] = {}
				}
			}
		end
		-- add our charms to respective dlctweakdata
		for k, v in pairs(MWC.charms) do
			table.insert(
				self[v.dlc].content.loot_drops,
				{
					type_items = 'weapon_mods',
					item_entry = 'wpn_fps_upg_charm_' .. k
				}
			)
		end
	end
)
