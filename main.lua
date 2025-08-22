-- name: [CS] Omega
-- description: the qualified one

-- Replace Mod Name with your Character/Pack name.
local TEXT_MOD_NAME = "Omega"

-- Stops mod from loading if Character Select isn't on, Does not need to be touched
if not _G.charSelectExists then
	djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
	return 0
end

local E_MODEL_OMEGA = smlua_model_util_get_id("omega_geo")
local TEX_OMEGA = get_texture_info("omega_icon")

local E_MODEL_OMEGAMAID = smlua_model_util_get_id("omegamaid_geo")

--local TEX_OMEGA_LIFE_ICON = get_texture_info("exclamation-icon")

local PALETTE_OMEGA = {
	[PANTS]  	= "0C0F10",
	[SHIRT] 	 = "0C0F10",
	[GLOVES] 	= "ffffff",
	[SHOES] 	 = "000000",
	[HAIR]   	= "FFFF7D",
	[SKIN]   	= "FFE9B2",
	[CAP]		= "000000",
	[EMBLEM] 	= "0C0F10"
}

local PALETTE_OMEGAMAID = {
	[PANTS]  	= "0C0F10",
	[SHIRT] 	 = "0C0F10",
	[GLOVES] 	= "ffffff",
	[SHOES] 	 = "000000",
	[HAIR]   	= "FFFF7D",
	[SKIN]   	= "FFE9B2",
	[CAP]		= "000000",
	[EMBLEM] 	= "FFFFFF"
}

-- All Located in "textures" folder
-- (Textures do not exist in template)

local HEALTH_METER_CHAR = {
	label = {
		left = get_texture_info("healthleft"),
		right = get_texture_info("healthright"),
	},
	--[[pie = {
		[1] = get_texture_info("Pie1"),
		[2] = get_texture_info("Pie2"),
		[3] = get_texture_info("Pie3"),
		[4] = get_texture_info("Pie4"),
		[5] = get_texture_info("Pie5"),
		[6] = get_texture_info("Pie6"),
		[7] = get_texture_info("Pie7"),
		[8] = get_texture_info("Pie8"),
	}]]
}


--[[
	Everything from here down where the data is applied

	Note that nothing here other than the 'character_add' function
	is required for a custom character, if you don't have the assets
	then feel free to remove the function from the functions below
]]

--[[local CSloaded = false
local function on_character_select_load()
	-- Adds the custom character to the Character Select Menu
	CT_OMEGA = _G.charSelect.character_add(
		"Omega", -- Character Name
		"the qualified one", -- Description
		"qualified_omega, SprSn64", -- Credits
		"0C0F10",		   -- Menu Color
		E_MODEL_OMEGA,	   -- Character Model
		CT_MARIO,		   -- Override Character
		TEX_OMEGA, -- Life Icon
		1,				  -- Camera Scale
		0				   -- Vertical Offset
	)
	
	_G.charSelect.character_add_palette_preset(E_MODEL_OMEGA, PALETTE_OMEGA)
	_G.charSelect.credit_add(TEXT_MOD_NAME, "qualified_omega", "Sona")
	_G.charSelect.credit_add(TEXT_MOD_NAME, "SprSn64", "Modeling")

	CSloaded = true
end]]

CT_OMEGA = _G.charSelect.character_add("Omega", {"the qualified one"}, "qualified_omega, SprSn64", {r = 12, g = 15, b = 16}, E_MODEL_OMEGA, CT_MARIO, TEX_OMEGA)
_G.charSelect.character_add_palette_preset(E_MODEL_OMEGA, PALETTE_OMEGA)
--_G.charSelect.character_add_health_meter(E_MODEL_OMEGA, HEALTH_METER_CHAR)

_G.charSelect.character_add_costume(CT_OMEGA, "Omega Maid", {"the maiden one"}, "qualified_omega, SprSn64", {r = 12, g = 15, b = 16}, E_MODEL_OMEGAMAID, CT_MARIO, TEX_OMEGA)
_G.charSelect.character_add_palette_preset(E_MODEL_OMEGAMAID, PALETTE_OMEGAMAID)

-- Character Voice hooks
-- You will likely not need to care about these
-- Will soon be overhauled

--_G.charSelect.config_character_sounds()

--hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)