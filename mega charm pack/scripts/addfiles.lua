_G.MWC = _G.MWC or {}

local valid = {
	['texture'] = true,
	['model'] = true,
	['cooked_physics'] = true,
	['object'] = true,
	['unit'] = true,
	['material_config'] = true
}

local function parsedirectory(assetpath, workingdir)
	workingdir = workingdir or ''
	local tbl = {}
	local currpath = assetpath .. workingdir
	for _, d in ipairs(file.GetDirectories(currpath)) do
		local temp = parsedirectory(assetpath, workingdir .. '/' .. d)
		if temp and temp ~= {} then
			for _, v in ipairs(temp) do
				if type(v) == 'table' then
					table.insert(tbl, v)
				end
			end
		end
	end
	for _, f in ipairs(file.GetFiles(currpath)) do
		local fext = f:match('%..*'):gsub('%.', '')
		if valid[fext] then
			table.insert(
				tbl,
				{
					fext,
					workingdir:gsub('^/', '') .. '/' .. f:match('.*%.'):gsub('%.', ''),
					currpath .. '/' .. f
				}
			)
		end
	end
	return tbl
end

function MWC.addfiles(dir)
	local tbl = parsedirectory(dir)
	for _, v in pairs(tbl) do
		BLTAssetManager:CreateEntry(Idstring(v[2]), Idstring(v[1]), v[3])
	end
end
