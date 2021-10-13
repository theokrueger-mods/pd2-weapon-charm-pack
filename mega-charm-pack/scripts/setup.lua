_G.MWC = _G.MWC or {}

--[[
    custom charms table structure
    id is the table key
        id is used in links to files and such, it is expected that your files go in specific places:
        models go in units/mods/weapons/wpn_fps_upg_charms/<id>/wpn_third_upg_charm_<id>
        icons go in guis/dlcs/mods/textures/wpn_fps_upg_charm_<id>
    name, desc, are localisation
    dlc is which subtext name and description should be given to the charm. can use existing dlc ids
--]]
MWC.charms = {
	['error'] = {
		name = 'ERROR',
		desc = 'do you have Counter-Strike: Source installed?',
		dlc = 'error'
	},
	['luckycat'] = {
		name = 'Lucky Cat',
		desc = 'wave the misfortune away',
		dlc = 'fortunate'
	},
	['redbomb'] = {
		name = 'Red Bomb',
		desc = 'i wish this was on a mug...',
		dlc = 'familiar'
	}
}

--[[
    custom dlc table structure
    id is the table key
    name, desc, are localisation
    colour is dlc text colour
--]]
MWC.dlc = {
	['error'] = {
		name = 'error charm',
		desc = 'This is an Underwhelming item!',
		colour = Color('ff66cc')
	},
	['fortunate'] = {
		name = 'fortune',
		desc = 'This is a Fortunate item!',
		colour = Color('ff66cc')
	},
	['familiar'] = {
		name = 'familiar',
		desc = 'This is a Familiar item!',
		colour = Color('ff66cc')
	}
}

-- probably dont have to touch below here
MWC.dir = {
	path = ModPath,
	scriptpath = ModPath .. 'scripts/',
	assetpath = ModPath .. 'assets/'
}

-- addfiles
-- TODO: hardcoded table for performance reasons
dofile(MWC.dir.scriptpath .. 'addfiles.lua')
MWC.addfiles(MWC.dir.assetpath)

-- create and add localisation
local text = {}
for k, v in pairs(MWC.charms) do
	text['bm_wp_upg_charm_' .. k] = v.name
	text['bm_wp_upg_charm_' .. k .. '_desc'] = v.desc
end
for k, v in pairs(MWC.dlc) do
	text['bm_global_value_' .. k] = v.name
	text['menu_l_global_value_' .. k] = v.desc
end

Hooks:Add(
	'LocalizationManagerPostInit',
	'MWC_LocalizationManager_PostInit',
	function(loc)
		loc:add_localized_strings(text)
	end
)
