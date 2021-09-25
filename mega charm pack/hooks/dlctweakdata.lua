if not _G.MWC then
	dofile(ModPath .. 'scripts/setup.lua')
end

Hooks:PostHook(
	DLCTweakData,
	'init',
	'MWC_DLCTD_init',
	function(self, tweak_data)
		for k, _ in pairs(MWC.dlc) do
			self[k] = {
                free = 'true',
				content = {
					['loot_global_value'] = k,
					['loot_drops'] = {}
				}
			}
		end
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
