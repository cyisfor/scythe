local default_caps = {times={[1]=0.30,[2]=0.30,[3]=0.30}, uses=200, maxlevel=3}
-- minetest hardcodes it to be impossible to set something as undiggable, if it can be dug by hand
-- so we'll just cheat, saying it's diggable in a million years maybe
local forever = 999999
local disable = {maxlevel=0, times={[1]=forever,[2]=forever,[3]=forever},uses=0}
local negadisable = {maxlevel=0, times={[1]=-forever,[2]=-forever,[3]=-forever},uses=0}
local function do_ore(ore,o)
	 local name, caps
	 if o == nil then
			name = string.upper(ore:sub(0,1)) .. ore:sub(2)
			caps = default_caps
	 else
			if o.name == nil then
				 name = string.upper(ore:sub(0,1)) .. ore:sub(2)
			end
			if o.caps == nil then
				 caps = default_caps
			end
	 end
	 core.register_tool("scythe:sickle_" .. ore, {
												 description = name .. " Sickle",
												 inventory_image = "scythe_sickle_" .. ore .. ".png",
												 tool_capabilities = {
														full_punch_interval = 0.3,
														max_drop_level=0,
														groupcaps={
															 leaves=negadisable,
															 snappy=caps,
															 crumbly=disable,
															 cracky=disable,
															 
														},
														damage_groups={},
												 },
												 sound = {breaks = "default_tool_breaks"}
	 })
end

do_ore("steel")
-- do_ore("gold",{name = "Gilded", caps={times=0.20, uses=9001, maxlevel=4})
