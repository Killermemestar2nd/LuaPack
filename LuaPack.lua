
local G_VM = gui.Groupbox(gui.Reference("VISUALS", "Shared"), "Extra Features", 0, 397, 200, 200)
local VOO_Ref = gui.Reference("VISUALS", "OTHER", "Options")
local VEO_Ref = gui.Reference("VISUALS", "ENEMIES", "Options")
local VTO_Ref = gui.Reference("VISUALS", "TEAMMATES", "Options")
local G_M1 = gui.Groupbox(gui.Reference("MISC", "GENERAL", "Main"), "Extra Features", 0, 206, 200, 293)
-------------- Font
local Vf30 = draw.CreateFont("Verdana", 30) 
local Vf12 = draw.CreateFont("Verdana", 12) 
local Tf = draw.CreateFont("Tahoma")
-------------- Better Grenades
local better_grenades = gui.Checkbox(VOO_Ref, "esp_other_better_grenades", "Better Grenades", false)
-------------- Hit Log 
local HitLog = gui.Checkbox(G_M1, "msc_hitlog", "Hit Log", false)
-------------- Auto Buy
local AB_Show = gui.Checkbox(G_M1, "msc_autobuy", "AutoBuy", false)
local AB_W = gui.Window("AB_W", "Auto Buy", 200, 200, 200, 328)
local AB_GB = gui.Groupbox(AB_W, "Auto Buy Settings", 15, 14, 170, 268)
local AB_E = gui.Checkbox(AB_GB, "AB_Active", "Active", false)
local PrimaryWeapons = gui.Combobox(AB_GB, "AB_Primary_Weapons", "Primary Weapons", "Off", "AK | M4", "Scout", "SG553 | AUG", "AWP", "Auto")
local SecondaryWeapons = gui.Combobox(AB_GB, "AB_Secondary_Weapons", "Secondary Weapons", "Off", "Elite", "P250", "Tec-9 | Five-Seven", "R8 | Deagle")
local Armor = gui.Combobox(AB_GB, "AB_Armor", "Armor", "Off", "Kevlar", "Kevlar + Helmet")
local Nades = gui.Checkbox(AB_GB, "AB_Nades", "Grenades", false)
local Zeus = gui.Checkbox(AB_GB, "AB_Zeus", "Zeus", false)
local Defuser = gui.Checkbox(AB_GB, "AB_Defuser", "Defuser", false)
-------------- Spec List
local SpectatorList = gui.Checkbox(G_M1, "msc_speclist", "Spectators", false)
-------------- Show Team Damage
local TeamDamageShow = gui.Checkbox(G_M1, "msc_showteamdmg", "Show Team Damage", false)
-------------- View Model Extender
local function VM_Cache() xO = client.GetConVar("viewmodel_offset_x") yO = client.GetConVar("viewmodel_offset_y") zO = client.GetConVar("viewmodel_offset_z") fO = client.GetConVar("viewmodel_fov") end VM_Cache()
local ViewModelShown = gui.Checkbox(G_M1, "msc_vme", "Viewmodel Changer", false)
local VM_W = gui.Window("VM_W", "Viewmodel Extender", 200,200,200,300)
local VMStuff = gui.Groupbox(VM_W, "Viewmodel Stuff", 15, 14, 170, 240)
local VM_e = gui.Checkbox(VMStuff, "msc_vme", "Enable", false)
local xS = gui.Slider(VMStuff, "VM_X", "X", xO, -20, 20)
local yS = gui.Slider(VMStuff, "VM_Y", "Y", yO, -100, 100)
local zS = gui.Slider(VMStuff, "VM_Z", "Z", zO, -20, 20)
local vfov = gui.Slider(VMStuff, "VM_fov", "Viewmodel FOV", fO, 0, 120)
-------------- Sniper Crosshair
local ComboCrosshair = gui.Combobox(G_VM, "vis_sniper_crosshair", "Sniper Crosshair", "Off", "Engine Crosshair", "Engine Crosshair (+scoped)", "Aimware Crosshair", "Draw Crosshair")
-------------- Scoped FOV Fix
local s_fovfix = gui.Checkbox(G_VM, "vis_fixfov", "Fix Scoped FOV", false)
local fov_value, vm_fov_value = gui.GetValue("vis_view_fov"), gui.GetValue("vis_view_model_fov")
-------------- Knife On Left Hand
local K_O_L_H = gui.Checkbox(G_M1, "msc_knifelefthand", "Knife On Left Hand", false)
-------------- Bomb Timer
local BombTimer = gui.Checkbox(VOO_Ref, "esp_other_better_c4timer", "Bomb Timer", false)
-------------- Bomb Damage
local Bomb_Damage = gui.Checkbox(VOO_Ref, "esp_other_bombdamage", "Bomb Damage", false)
-------------- Chat Spammer
local CC_Show = gui.Checkbox(G_M1, "msc_chat_spams", "Chat Spams", false)
local CC_W = gui.Window("CC_W", "Chat Spam", 200,200,200,285)
local CC_G1 = gui.Groupbox(CC_W, "Chat Spams", 15, 15, 170, 224)
local CC_Spams = gui.Combobox(CC_G1, "CC_Spam", "Spams", "Off", "Spam 1", "Spam 2", "Clear Chat")
local CC_Spam_spd = gui.Slider(CC_G1, "CC_Spam_Speed", "Spam Speed", 67.5, 10, 250)
local chatspam1txt = gui.Text(CC_G1, "Spam 1") local ChatSpam1 = gui.Editbox(CC_G1, "CC_Spam1", "Custom Chat Spam 1")
local chatspam2txt = gui.Text(CC_G1, "Spam 2") local ChatSpam2 = gui.Editbox(CC_G1, "CC_Spam2", "Custom Chat Spam 2")
-------------- Aspect Ratio Changer
local aspect_ratio_table = {}
local aspect_ratio_check = gui.Checkbox(G_M1, "msc_aspect_enable", "Aspect Ratio Changer", false) 
local aspect_ratio_reference = gui.Slider(G_M1, "msc_aspect_value", "Force aspect ratio", 100, 1, 199) -- % times your original ratio
-------------- Esp On Dead
local espdead = gui.Checkbox(gui.Reference("VISUALS", "ENEMIES", "Filter"), "esp_espondead", "ESP when dead", false)
-------------- Engine Radar
local ERadar = gui.Checkbox(G_VM, "esp_engine_radar", "Engine Radar", false)
-------------- Team & Enemy Tracers
local tracersEnemy = gui.Checkbox(VEO_Ref, "esp_enemy_tracer", "Tracers", false)
local tracersTeam = gui.Checkbox(VTO_Ref, "esp_team_tracer", "Tracers", false)
-------------- Team & Enemy & Other Distance + visible help 
local enemy_distance = gui.Checkbox(VEO_Ref, "esp_enemy_distance", "Distance", false)
local team_distance = gui.Checkbox(VTO_Ref, "esp_team_distance", "Distance", false)
local other_distance = gui.Checkbox(VOO_Ref, "esp_other_distance", "Distance", false)
-------------- Full Bright
local fBright = gui.Checkbox(G_VM, "vis_fullbright", "Full Bright", false)
-------------- Disable Post Processing
local DPP = gui.Checkbox(G_VM, "vis_disable_post", "Disable Post Processing", false)
-------------- Zeusbot
local zeusbot = gui.Checkbox(gui.Reference("LEGIT", "Extra"), "lbot_zeusbot_enable", "Zeusbot", false)
local trige, trigm, trigaf, trighc = gui.GetValue("lbot_trg_enable"), gui.GetValue("lbot_trg_mode"), gui.GetValue("lbot_trg_autofire"), gui.GetValue("lbot_trg_hitchance")
-------------- Recoil Crosshair
local RecoilCrosshair = gui.Checkbox(G_VM, "vis_recoilcrosshair", "Recoil Crosshair", false)
-------------- Disable Fake angle ghost while in air/freezetime
local fakeangleghost = gui.Combobox(gui.Reference("VISUALS", "MISC", "Yourself Extra"), "vis_disable_fakeangleghost", "Disable Fake Angle Ghost", "Off", "In Air", "On Freeze Period", "Both")
-------------- Infinite Name Spam
local infname = gui.Checkbox(gui.Reference("MISC", "ENHANCEMENT", "Appearance"), "msc_infinite_namespam_button", "Enable infinite namespam [BUTTON]", false)
-------------- Name Steal fix
local StealNameFix = gui.Checkbox(gui.Reference("MISC", "ENHANCEMENT", "Namestealer"), "msc_namestealer_fix", "Fix Name Steal", false)
-------------- Working Stattrak
local Working_Stattrak = gui.Checkbox(G_M1, "msc_stattrakcount", "Working Stattrak", false)
-------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------- 
local frame_rate, menu_opened = 0.0, true
local function get_abs_fps() frame_rate = 0.9 * frame_rate + (1.0 - 0.9) * globals.AbsoluteFrameTime() return math.floor((1.0 / frame_rate) + 0.5) end
local function lerp_pos(x1, y1, z1, x2, y2, z2, percentage) local x = (x2 - x1) * percentage + x1 local y = (y2 - y1) * percentage + y1 local z = (z2 - z1) * percentage + z1 return x, y, z end
local function distance3D(x1, y1, z1, x2, y2, z2) return math.floor(vector.Distance(x1, y1, z1, x2, y2, z2)) end
local function menus() if input.IsButtonPressed(gui.GetValue("msc_menutoggle")) then menu_opened = not menu_opened end if menu_opened then if AB_Show:GetValue() then AB_W:SetActive(1) else AB_W:SetActive(0) end if ViewModelShown:GetValue() then VM_W:SetActive(1) else VM_W:SetActive(0) end if CC_Show:GetValue() then CC_W:SetActive(1) else CC_W:SetActive(0) end else AB_W:SetActive(0) VM_W:SetActive(0) CC_W:SetActive(0) end end callbacks.Register("Draw", "shows", menus)

-------------------- Auto Updater
local scriptName = GetScriptName()
local scriptFile = "https://raw.githubusercontent.com/Killermemestar2nd/LuaPack/master/Luapack"
local versionFile = "https://raw.githubusercontent.com/Zack2kl/Lua-Pack/master/version.txt"
local currentVersion = "1.4.2.5.6"
local updateAvailable, newVersionCheck, updateDownloaded = false, true, false

function autoupdater()
if not gui.GetValue("lua_allow_http") then return end
if newVersionCheck then local newVersion = http.Get(versionFile) if currentVersion ~= newVersion then updateAvailable = true end newVersionCheck = false end 
if updateAvailable and not updateDownloaded then if not gui.GetValue("lua_allow_cfg") then draw:Color(255, 255, 255, 255) draw:Text(2, 0, string.gsub(scriptName, ".lua", "")..": Update Available, Script/Config editing is Required") else local newScript = http.Get(scriptFile) local oldScript = file.Open(scriptName, "w") oldScript:Write(newScript) oldScript:Close() updateAvailable = false updateDownloaded = true print(string.gsub(scriptName, ".lua", " updated from"), currentVersion, "to", http.Get(versionFile)) end end
if updateDownloaded then draw:Color(255, 255, 255, 255) draw:Text(2, 0, string.gsub(scriptName, ".lua", "")..": Update Downloaded, reload the script") end end
callbacks.Register("Draw", "Auto Update", autoupdater)

-------------------- Grenade Timers
local updatetick = 0 local grenades = {}
function EventHook(Event)
if not better_grenades:GetValue() then return end
if Event:GetName() == "round_prestart" then grenades = {} end
if Event:GetName() == "hegrenade_detonate" or Event:GetName() == "flashbang_detonate" or Event:GetName() == "inferno_expire" or Event:GetName() == "inferno_extinguish" then updatetick = globals.TickCount() for index,value in pairs(grenades) do if value[1] == Event:GetInt("entityid") then table.remove(grenades, index) end end end end
function ESPHook(Builder)
if not better_grenades:GetValue() then return end
if Builder:GetEntity():GetClass() == "CSmokeGrenadeProjectile" and Builder:GetEntity():GetProp("m_nSmokeEffectTickBegin") ~= 0 then delta = (globals.TickCount() - Builder:GetEntity():GetProp("m_nSmokeEffectTickBegin")) * globals.TickInterval() Builder:AddBarBottom(1 - (delta/17.5))
elseif Builder:GetEntity():GetClass() == "CBaseCSGrenadeProjectile" then local found = false for index,value in pairs(grenades) do if value[1] == Builder:GetEntity():GetIndex() then DeltaT = (globals.TickCount() - grenades[index][2]) * globals.TickInterval() Builder:AddBarBottom(1 - (DeltaT/1.65)) found = true end end
if found == false and globals.TickCount() > updatetick then local gMatrix = {Builder:GetEntity():GetIndex(), globals.TickCount()} table.insert(grenades, gMatrix) end end end
function DrawingHook()
if not better_grenades:GetValue() then return end
for indexF,valueF in pairs(entities.FindByClass("CInferno")) do local found = false for indexT,valueT in pairs(grenades) do if valueT[1] ~= valueF:GetIndex() then return end
x, y = client.WorldToScreen(valueF:GetAbsOrigin()) local mollysize = 25 if x == nil and y == nil then return end draw:Color(0, 0, 0, 255) draw.RoundedRectFill( x - mollysize, y, x + mollysize, y + 4 )
local math = (((globals.TickCount() - valueT[2]) * ((-1) - 1))/ ((valueT[2] + 7 / globals.TickInterval()) - valueT[2])) + 1 draw:Color(227, 227, 227, 255) draw.RoundedRectFill(x - mollysize, y, x + mollysize * math, y + 4) draw:Color(255, 255, 255, 255) draw.RoundedRect(x - mollysize, y, x + mollysize, y + 4) 
draw.SetFont(Tf) local w,h = draw.GetTextSize("MOLLY") draw:TextShadow(x - w/2, y - h * 1.25 , "MOLLY") found = true end if found == false and globals.TickCount() > updatetick then local gMatrix = {valueF:GetIndex(), globals.TickCount()} table.insert(grenades, gMatrix) end end end
callbacks.Register("Draw", DrawingHook) callbacks.Register("DrawESP", ESPHook) callbacks.Register("FireGameEvent", EventHook) 

-------------------- Hit Log
local hitgroup_names = {"head", "chest", "stomach", "left arm", "right arm", "left leg", "right leg"}
local draw_hitsay = {}
function ChatLogger(Event)
if not HitLog:GetValue() or Event:GetName() == nil or Event:GetName() ~= "player_hurt" then return end
local attacker, victim = client.GetPlayerIndexByUserID(Event:GetInt("attacker")), client.GetPlayerIndexByUserID(Event:GetInt("userid"))
if attacker ~= client.GetLocalPlayerIndex() or victim == client.GetLocalPlayerIndex() then return end
local victimName, dmg, health, hitGroup = client.GetPlayerNameByUserID(Event:GetInt("userid")), Event:GetString("dmg_health"), Event:GetString("health"), hitgroup_names[Event:GetInt("hitgroup")] or "body"
response = string:format("Hit %s in the %s for %s damage (%s health remaining)", victimName, hitGroup, dmg, health) table.insert(draw_hitsay, {globals.CurTime(), response}) end
local On_Screen_Time, pixels_between_each_line, ScreenX, ScreenY, lowestopacity = 15, 12, 8, 3, 63.5
function hitlog()
if not HitLog:GetValue() or entities.GetLocalPlayer() == nil then return end local things_on_screen = 0 for k, l in pairs(draw_hitsay) do local a = 1 a = (On_Screen_Time - (globals.CurTime() - l[1])) / On_Screen_Time
if 255*a < lowestopacity then table.remove(draw_hitsay, k) else draw.SetFont(Tf) draw:Color(255,255,255,255*a) draw:TextShadow(ScreenX, things_on_screen * pixels_between_each_line + ScreenY, l[2]) things_on_screen = things_on_screen + 1 end end end
callbacks.Register("Draw", hitlog) callbacks.Register("FireGameEvent", ChatLogger)  

-------------------- Auto Buy 
local SecondaryWeapon, PrimaryWeapon, buy_armor = "", "", ""
function buy(Event)
if not AB_E:GetValue() or entities.GetLocalPlayer() == nil or Event:GetName() == nil then return end
if Event:GetName() == "player_spawn" then if client.GetPlayerIndexByUserID(Event:GetInt("userid")) == client.GetLocalPlayerIndex() then buy = true end end money = entities.GetLocalPlayer():GetProp("m_iAccount")
if buy then if (SecondaryWeapons:GetValue() == 0) then SecondaryWeapon = ""
elseif (SecondaryWeapons:GetValue() == 1) then SecondaryWeapon = 'buy "elite"; '
elseif (SecondaryWeapons:GetValue() == 2) then SecondaryWeapon = 'buy "p250"; '
elseif (SecondaryWeapons:GetValue() == 3) then SecondaryWeapon = 'buy "tec9"; '
elseif (SecondaryWeapons:GetValue() == 4) then SecondaryWeapon = 'buy "deagle"; ' end
if money >= 3000 or money < 1 then PWb = true end
if PWb then if (PrimaryWeapons:GetValue() == 0) then PrimaryWeapon = ""
elseif (PrimaryWeapons:GetValue() == 1) then PrimaryWeapon = 'buy "ak47"; '
elseif (PrimaryWeapons:GetValue() == 2) then PrimaryWeapon = 'buy "ssg08"; '
elseif (PrimaryWeapons:GetValue() == 3) then PrimaryWeapon = 'buy "sg556"; '
elseif (PrimaryWeapons:GetValue() == 4) then PrimaryWeapon = 'buy "awp"; '
elseif (PrimaryWeapons:GetValue() == 5) then PrimaryWeapon = 'buy "scar20"; ' end
if Armor:GetValue() == 0 then buy_armor = ""
elseif Armor:GetValue() == 1 then buy_armor = 'buy "vest"; '
elseif Armor:GetValue() == 2 then buy_armor = 'buy "vest"; buy "vesthelm"' end
if Nades:GetValue() then client.Command('buy "hegrenade"; buy "incgrenade"; buy "molotov"; buy "smokegrenade"; buy "flashbang"', true) end
if Zeus:GetValue() then client.Command('buy "taser"', true) end
if Defuser:GetValue() then client.Command('buy "defuser"', true) end PWb = false end current_buy = (PrimaryWeapon.. SecondaryWeapon.. buy_armor) client.Command(current_buy, true) buy = false end end
callbacks.Register("FireGameEvent", buy)

-------------------- View Model Extender | Spectator list fix / made by anue | Disable Post Processing | full bright | Engine Radar | Disable Fake angle ghost while in air/freeze time | Working Stattrak
function VM_E() if VM_e:GetValue() then client.SetConVar("viewmodel_offset_x", xS:GetValue(), true) client.SetConVar("viewmodel_offset_y", yS:GetValue(), true) client.SetConVar("viewmodel_offset_z", zS:GetValue(), true) client.SetConVar("viewmodel_fov", vfov:GetValue(), true) else client.SetConVar("viewmodel_offset_x", xO, true) client.SetConVar("viewmodel_offset_y", yO, true) client.SetConVar("viewmodel_offset_z", zO, true) client.SetConVar("viewmodel_fov", fO, true) end end callbacks.Register("Draw", VM_E)
function speclistfix(E) if not gui.GetValue("msc_showspec") or E:GetName() ~= "round_start" then return end client.Command("cl_fullupdate", true) end callbacks.Register("FireGameEvent", speclistfix)
function Dis_PP() if DPP:GetValue() then client.SetConVar("mat_postprocess_enable", 0, true) else client.SetConVar("mat_postprocess_enable", 1, true) end end callbacks.Register("Draw", Dis_PP)
function full_bright() if fBright:GetValue() then client.SetConVar("mat_fullbright", 1, true) else client.SetConVar("mat_fullbright", 0, true) end end callbacks.Register("Draw", full_bright)
function engineradar() if ERadar:GetValue() then ERval = 1 else ERval = 0 return end for a, player in pairs(entities.FindByClass("CCSPlayer")) do player:SetProp("m_bSpotted", ERval) end end callbacks.Register("Draw", engineradar)
function fakeangleghostval() if fakeangleghost:GetValue() == 0 then fakeghost = "Off" elseif fakeangleghost:GetValue() == 1 then fakeghost = "in_air" elseif fakeangleghost:GetValue() == 2 then fakeghost = "in_freeze" elseif fakeangleghost:GetValue() == 3 then fakeghost = "in_freeze_and_air" end end callbacks.Register("Draw", fakeangleghostval) local FakeAAGhost2_round_end = false
function Disable_FakeAAGhost(UserCMD) if gui.GetValue("vis_fakeghost") ~= 0 then fakeghostval = gui.GetValue("vis_fakeghost") end if fakeghost == "in_freeze" or fakeghost == "Off" then return end if entities.GetLocalPlayer():GetProp("m_fFlags") == 256 then gui.SetValue("vis_fakeghost", 0) else if not FakeAAGhost2_round_end then gui.SetValue("vis_fakeghost", fakeghostval) end end end callbacks.Register("CreateMove", Disable_FakeAAGhost)
function Disable_FakeAAGhost2(event) if fakeghost == "in_air" or fakeghost == "Off" then return end if event:GetName() == "round_end" then gui.SetValue("vis_fakeghost", 0) FakeAAGhost2_round_end = true end if event:GetName() == "round_freeze_end" then gui.SetValue("vis_fakeghost", fakeghostval) FakeAAGhost2_round_end = false end end callbacks.Register("FireGameEvent", Disable_FakeAAGhost2)
function StatTrak(e) if not Working_Stattrak:GetValue() then return end if e:GetName() == "player_death" and client.GetPlayerIndexByUserID(e:GetInt("attacker")) == client.GetLocalPlayerIndex() and client.GetPlayerIndexByUserID(e:GetInt("Userid")) ~= client.GetLocalPlayerIndex() then wep = string:format("skin_%s_stattrak", e:GetString("weapon")) if tonumber(gui.GetValue(wep)) > 0 then gui.SetValue(wep, math.floor(gui.GetValue(wep)) + 1) end end if e:GetName() == "round_prestart" then client.Command("cl_fullupdate", true) end end callbacks.Register("FireGameEvent", StatTrak)

-------------------- Scoped Fov Fix
function scopefov()
if not s_fovfix:GetValue() or entities.GetLocalPlayer() == nil then return end
local view_fov = gui.GetValue("vis_view_fov") local view_model_fov = gui.GetValue("vis_view_model_fov")
if view_fov ~= 0 then fov_value = gui.GetValue("vis_view_fov") end if view_model_fov ~= 0 then vm_fov_value = gui.GetValue("vis_view_model_fov") end
if entities.GetLocalPlayer():GetProp("m_bIsScoped") == 1 or entities.GetLocalPlayer():GetProp("m_bIsScoped") == 257 then gui.SetValue("vis_view_fov", 0) gui.SetValue("vis_view_model_fov", 0) 
elseif view_fov == 0 then gui.SetValue("vis_view_fov", fov_value) gui.SetValue("vis_view_model_fov", vm_fov_value) end end
callbacks.Register("Draw", "fixes scoped fov", scopefov)

-------------------- Sniper Crosshair
function ifCrosshair()
if entities.GetLocalPlayer() == nil  then return end local Weapon = entities.GetLocalPlayer():GetPropEntity("m_hActiveWeapon") local Scoped = entities.GetLocalPlayer():GetProp("m_bIsScoped") == 1 or entities.GetLocalPlayer():GetProp("m_bIsScoped") == 257 if Weapon == nil then return end local cWep = Weapon:GetClass()
if cWep == "CWeaponAWP" or cWep == "CWeaponSSG08" or cWep == "CWeaponSCAR20" or cWep == "CWeaponG3SG1" then drawCrosshair = true else drawCrosshair = false end local screenCenterX, screenY = draw.GetScreenSize() local scX, scY = screenCenterX / 2, screenY / 2
if drawCrosshair and ComboCrosshair:GetValue() == 0 then client.SetConVar("weapon_debug_spread_show", 0, true) gui.SetValue("esp_crosshair", false)
elseif drawCrosshair and ComboCrosshair:GetValue() == 1 then gui.SetValue("esp_crosshair", false) if Scoped then client.SetConVar("weapon_debug_spread_show", 0, true) else client.SetConVar("weapon_debug_spread_show", 3, true) end
elseif drawCrosshair and ComboCrosshair:GetValue() == 2 then gui.SetValue("esp_crosshair", false) client.SetConVar("weapon_debug_spread_show", 3, true)
elseif drawCrosshair and ComboCrosshair:GetValue() == 3 then if Scoped then gui.SetValue("esp_crosshair", false) else client.SetConVar("weapon_debug_spread_show", 0, true) gui.SetValue("esp_crosshair", true) end 
elseif not drawCrosshair and ComboCrosshair:GetValue() == 3 then gui.SetValue("esp_crosshair", false)
elseif drawCrosshair and ComboCrosshair:GetValue() == 4 then client.SetConVar("weapon_debug_spread_show", 0, true) gui.SetValue("esp_crosshair", false) draw:Color(255,255,255,255) draw:Line(scX, scY - 8, scX, scY + 8) --[[ line down ]] draw:Line(scX - 8, scY, scX + 8, scY) --[[ line across ]] end end
callbacks.Register("Draw", ifCrosshair)

-------------------- Bomb Timer & defuse timer
local function mathfix() local screenX, screenY = draw.GetScreenSize() screenY3 = screenY/2 end callbacks.Register("Draw", "fixes screenY3", mathfix)
local function get_site_name(site) local a_x, a_y, a_z = entities.GetPlayerResources():GetProp("m_bombsiteCenterA") local b_x, b_y, b_z = entities.GetPlayerResources():GetProp("m_bombsiteCenterB") local site_x1, site_y1, site_z1 = site:GetMins() local site_x2, site_y2, site_z2 = site:GetMaxs() local site_x, site_y, site_z = lerp_pos(site_x1, site_y1, site_z1, site_x2, site_y2, site_z2, 0.5) local distance_a, distance_b = vector.Distance(site_x, site_y, site_z, a_x, a_y, a_z), vector.Distance(site_x, site_y, site_z, b_x, b_y, b_z) return distance_b > distance_a and "A" or "B" end
local colorchange, drawBar, drawDefuse, drawPlanting, plantedTime, plantedTime2, fill, fill2, fill3, plantingName, plantingStarted, plantingTime, plantingSite = 10, false, false, false, 0, 0, 0, screenY3, 0, "", 0, 3.125, ""
function bomb(event)
if not BombTimer:GetValue() then return end
if event:GetName() == "bomb_beginplant" then ScreenX = 20 ScreenY = 55 fill = 0 fill2 = screenY3 fill3 = 0 drawPlanting = true plantingName = client.GetPlayerNameByUserID(event:GetInt("userid")) plantingStarted = globals.CurTime() plantingSite = get_site_name(entities.GetByIndex(event:GetInt("site"))) end
if event:GetName() == "bomb_abortplant" then ScreenX = 8 ScreenY = 3 drawPlanting = false end
if event:GetName() == "bomb_planted" then ScreenX = 20 ScreenY = 55 plantedTime = globals.CurTime() drawBar = true drawPlanting = false end
if event:GetName() == "bomb_begindefuse" then ScreenX = 20 ScreenY = 79 defusingName = client.GetPlayerNameByUserID(event:GetInt("userid")) plantedTime2 = globals.CurTime() drawDefuse = true end
if event:GetName() == "bomb_abortdefuse" then ScreenX = 20 ScreenY = 55 drawDefuse = false fill2 = screenY3 fill3 = 0 end
if event:GetName() == "bomb_defused" then drawBar = false drawDefuse = false ScreenX = 8 ScreenY = 3 end
if event:GetName() == "round_officially_ended" then drawBar = false drawDefuse = false drawPlanting = false end 
if event:GetName() == "round_prestart" then ScreenX = 8 ScreenY = 3 draw_hitsay = {} end end
function drawProgress()
if not BombTimer:GetValue() then return end local screenX, screenY = draw.GetScreenSize() local Player = entities.GetLocalPlayer()
if drawBar and entities.FindByClass("CPlantedC4")[1] ~= nil then local ToExplode = entities.FindByClass("CPlantedC4")[1] c4time = math.floor(ToExplode:GetProp("m_flTimerLength")) C4time = ((plantedTime - globals.CurTime()) + c4time)
if C4time > -1  then local godownby = (screenY / c4time) / get_abs_fps() if Player:GetTeamNumber() == 3 and Player:GetProp("m_bHasDefuser") == 0 and C4time < 10.1 or Player:GetProp("m_bHasDefuser") == 1 and C4time < 5.1 then r, g, b, a = 255,13,13,255 else r, g, b, a = 124, 195, 13, 255 end
local bombsite = ToExplode:GetProp("m_nBombSite") == 0 and "A" or "B" siteinfo = string:format("%s - %.1fs", bombsite, ((plantedTime - globals.CurTime()) + c4time)) draw.SetFont(Vf30) draw:Color(r, g, b, a) draw:TextShadow(20, 0, siteinfo)
if C4time <= colorchange then draw:Color(255,13,13,255) else draw:Color(0,255,0,255) end draw.FilledRect(1, fill, 15, screenY) draw:Color(0,0,0,100) draw.FilledRect(0, 0, 16, screenY) fill = fill + godownby end end
if drawPlanting then local plant_percentage = (globals.CurTime() - plantingStarted) / plantingTime local plantinfo = string:format("%s - %.1fs", plantingName, (plantingStarted - globals.CurTime()) + plantingTime) 
if plant_percentage > 0 and 1 > plant_percentage then local remove_from_Y = screenY * (1 - plant_percentage) draw.SetFont(Vf30) draw:Color(124, 195, 13, 255) draw:TextShadow(20, 0, plantingSite.." - Planting") draw:Color(255, 255, 255, 255) draw:TextShadow(20, 25, plantinfo) draw:Color(0,255,0,255) draw.FilledRect(1, 0+remove_from_Y, 15, screenY+remove_from_Y) draw:Color(0,0,0,100) draw.FilledRect(0, 0, 16, screenY) end end
if drawDefuse and entities.FindByClass("CPlantedC4")[1] ~= nil then local ToDefuse = entities.FindByClass("CPlantedC4")[1] DefuseTime = math.floor(ToDefuse:GetProp("m_flDefuseLength")) DefuseT = string:format("%.1fs", (plantedTime2 - globals.CurTime()) + DefuseTime) draw.SetFont(Vf30) draw:Color(255, 255, 255, 255) draw:TextShadow(20, 50, defusingName.." - ".. DefuseT)
if DefuseTime == 10 then local godownby3 = (screenY / DefuseTime) / get_abs_fps() draw:Color(0,0,255,255) draw.FilledRect(1, fill3, 15, screenY) draw:Color(0,0,0,100) draw.FilledRect(0, 0, 16, screenY) fill3 = fill3 + godownby3
elseif DefuseTime == 5 then local godownby2 = ((screenY/2) / DefuseTime) / get_abs_fps() draw:Color(0,0,255,255) draw.FilledRect(1, fill2, 15, screenY) draw:Color(0,0,0,100) draw.FilledRect(0, (screenY/2), 16, screenY) fill2 = fill2 + godownby2 end end end 

-------------------- Bomb Damage
function DrawDamage()
if not Bomb_Damage:GetValue() or entities.FindByClass("CPlantedC4")[1] == nil then return end local Bomb = entities.FindByClass("CPlantedC4")[1]
if Bomb:GetProp("m_bBombTicking") and Bomb:GetProp("m_bBombDefused") == 0 and globals.CurTime() - 1 < Bomb:GetProp("m_flC4Blow") then local Player = entities.GetLocalPlayer() local HealthToTake = math.floor(DamagefromDomb(Bomb, Player))
if HealthToTake + 1 >= Player:GetHealth() then draw.SetFont(Vf30) draw:Color(255,0,0,255) draw:TextShadow(20, 25, "FATAL") 
elseif HealthToTake < Player:GetHealth() and HealthToTake > 0 then draw.SetFont(Vf30) draw:Color(255,255,255,255) draw:TextShadow(20, 25, "-"..HealthToTake+1) end end end
function DamagefromDomb(Bomb, Player)
if not Bomb_Damage:GetValue() then return end local Bxyz = {Bomb:GetAbsOrigin()} local Pxyz = {Player:GetAbsOrigin()} local ArmorValue = Player:GetProp("m_ArmorValue")
local C4Distance = math.sqrt((Bxyz[1] - Pxyz[1]) ^2 + (Bxyz[2] - Pxyz[2]) ^2 + (Bxyz[3] - Pxyz[3]) ^2) local d = ((C4Distance-75.68) / 789.2) local f1Damage = 450.7*math.exp(-d * d)
if ArmorValue > 0 then local f1New = f1Damage * 0.5 local f1Armor = (f1Damage - f1New) * 0.5 if f1Armor > ArmorValue then f1Armor = ArmorValue * 2 f1New = f1Damage - f1Armor end f1Damage = f1New end return f1Damage end 
callbacks.Register("Draw", drawProgress) callbacks.Register("Draw", DrawDamage) callbacks.Register("FireGameEvent", bomb)

-------------------- Chat Spams
local c_spammedlast = globals.RealTime() + CC_Spam_spd:GetValue()/100
function custom_chat()
if CC_Spams:GetValue() == 0 then return
elseif CC_Spams:GetValue() == 1 and globals.RealTime() >= c_spammedlast then client.ChatSay(ChatSpam1:GetValue()) c_spammedlast = globals.RealTime() + CC_Spam_spd:GetValue()/100
elseif CC_Spams:GetValue() == 2 and globals.RealTime() >= c_spammedlast then client.ChatSay(ChatSpam2:GetValue()) c_spammedlast = globals.RealTime() + CC_Spam_spd:GetValue()/100
elseif CC_Spams:GetValue() == 3 and globals.RealTime() >= c_spammedlast then client.ChatSay("﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽\n") c_spammedlast = globals.RealTime() + CC_Spam_spd:GetValue()/100 end end
callbacks.Register("Draw", custom_chat)

-------------------- Aspect Ratio Changer
local function gcd(m, n) while m ~= 0 do m, n = math.fmod(n, m), m end return n end
local function set_aspect_ratio(aspect_ratio_multiplier) local screen_width, screen_height = draw.GetScreenSize() local aspectratio_value = (screen_width*aspect_ratio_multiplier)/screen_height if aspect_ratio_multiplier == 1 or not aspect_ratio_check:GetValue() then aspectratio_value = 0 end client.SetConVar( "r_aspectratio", tonumber(aspectratio_value), true) end
local function on_aspect_ratio_changed() local screen_width, screen_height = draw.GetScreenSize() for i=1, 200 do local i2=i*0.01    i2 = 2 - i2 local divisor = gcd(screen_width*i2, screen_height) if screen_width*i2/divisor < 100 or i2 == 1 then aspect_ratio_table[i] = screen_width*i2/divisor .. ":" .. screen_height/divisor  end  end local aspect_ratio = aspect_ratio_reference:GetValue()*0.01 aspect_ratio = 2 - aspect_ratio set_aspect_ratio(aspect_ratio) end
callbacks.Register("Draw", on_aspect_ratio_changed)

-------------------- Esp on Dead
function ESP_Always_OnDead() 
if not espdead:GetValue() or entities.GetLocalPlayer() == nil then return end
if entities.GetLocalPlayer():GetHealth() <= 0 then gui.SetValue("esp_enemy_box", 3) gui.SetValue("esp_enemy_weapon", 1) gui.SetValue("esp_enemy_health", 2) gui.SetValue("esp_enemy_glow", 2) gui.SetValue("esp_enemy_skeleton", true) gui.SetValue("esp_enemy_name", true)
else gui.SetValue("esp_enemy_box", 0) gui.SetValue("esp_enemy_weapon", 0) gui.SetValue("esp_enemy_health", 0) gui.SetValue("esp_enemy_glow", 0) gui.SetValue("esp_enemy_skeleton", false) gui.SetValue("esp_enemy_name", false) end end
callbacks.Register("Draw", ESP_Always_OnDead)

-------------------- Enemy & Team Tracers
function Tracers()
if not tracersEnemy:GetValue() and not tracersTeam:GetValue() then return end
if entities.GetLocalPlayer() == nil then return end local sX, sY = draw.GetScreenSize() local lpTeamNum = entities.GetLocalPlayer():GetTeamNumber() local players = entities.FindByClass("CCSPlayer") for i = 1, #players do local player = players[i] local pX, pY, pZ = client.WorldToScreen(player:GetAbsOrigin()) playerteam = player:GetTeamNumber()
if playerteam == lpTeamNum then r,g,b,z = 0,0,255,255 else r,g,b,a = 255,0,0,255 end 
if tracersEnemy:GetValue() then if player:GetTeamNumber() ~= lpTeamNum and player:IsAlive() and pX ~= nil and pY ~= nil then draw:Color(r,g,b,a) draw:Line(sX/2, sY, pX, pY) end end
if tracersTeam:GetValue() then if player:GetTeamNumber() == lpTeamNum and player:IsAlive() and pX ~= nil and pY ~= nil and player:GetIndex() ~= client.GetLocalPlayerIndex() then draw:Color(r,g,b,a) draw:Line(sX/2, sY, pX, pY) end end end end
callbacks.Register("Draw", Tracers)

-------------------- Enemy & Team & Other Distance
function Distance(builder)
playerteam = builder:GetEntity():GetTeamNumber()
if not enemy_distance:GetValue() and not team_distance:GetValue() and not other_distance:GetValue() then return end
local ent = builder:GetEntity() local ppX, ppY, ppZ = ent:GetAbsOrigin() local lX, lY, lZ = entities.GetLocalPlayer():GetAbsOrigin() local dist = math.floor(distance3D(ppX, ppY, ppZ, lX, lY, lZ)* 0.0833)
if enemy_distance:GetValue() and ent:IsAlive() and ent:IsPlayer() and playerteam ~= entities.GetLocalPlayer():GetTeamNumber() then builder:Color(255, 255, 255, 255) builder:AddTextBottom(dist.. "ft") end
if team_distance:GetValue() and ent:IsAlive() and ent:IsPlayer() and playerteam == entities.GetLocalPlayer():GetTeamNumber() and ent:GetIndex() ~= client.GetLocalPlayerIndex() then builder:Color(255, 255, 255, 255) builder:AddTextBottom(dist.. "ft") end
if other_distance:GetValue() and not ent:IsPlayer() then builder:Color(255, 255, 255, 255) builder:AddTextBottom(dist.. "ft") end end
callbacks.Register("DrawESP", "Distance ESP", Distance)

-------------------- Knife on Left Hand
function on_knife_righthand()
if not K_O_L_H:GetValue() then return end if entities.GetLocalPlayer() == nil or entities.GetLocalPlayer():GetHealth() <= 0 then client.Command("cl_righthand 1", true) return end
local wep = entities.GetLocalPlayer():GetPropEntity("m_hActiveWeapon") if wep == nil then return end local cwep = wep:GetClass()
if cwep == "CKnife" then client.Command("cl_righthand 0", true) else client.Command("cl_righthand 1", true) end end
callbacks.Register("Draw", on_knife_righthand) 

-------------------- Zeusbot
function zeuslegit()
if not zeusbot:GetValue() or entities.GetLocalPlayer() == nil then return end local Weapon = entities.GetLocalPlayer():GetPropEntity("m_hActiveWeapon") if Weapon == nil then return end local CWeapon = Weapon:GetClass() 
local trige, trigm, trigaf, trighc = gui.GetValue("lbot_trg_enable"), gui.GetValue("lbot_trg_mode"), gui.GetValue("lbot_trg_autofire"), gui.GetValue("lbot_trg_hitchance")
if trige ~= 1 and trigm ~= 0 and trigaf ~= 1 and trighc ~= gui.GetValue("rbot_taser_hitchance") then trige2, trigm2, trigaf2, trighc2 = gui.GetValue("lbot_trg_enable"), gui.GetValue("lbot_trg_mode"), gui.GetValue("lbot_trg_autofire"), gui.GetValue("lbot_trg_hitchance") end
if CWeapon == "CWeaponTaser" then gui.SetValue("lbot_trg_enable", 1) gui.SetValue("lbot_trg_mode", 0) gui.SetValue("lbot_trg_autofire", 1) gui.SetValue("lbot_trg_hitchance", gui.GetValue("rbot_taser_hitchance"))
else gui.SetValue("lbot_trg_enable", trige2) gui.SetValue("lbot_trg_mode", trigm2) gui.SetValue("lbot_trg_autofire", trigaf2) gui.SetValue("lbot_trg_hitchance", trighc2) end end
callbacks.Register("Draw", zeuslegit)

-------------------- Spectator list
function SpecList()
if not SpectatorList:GetValue() or entities.GetLocalPlayer() == nil then return end local specX, specY = draw.GetScreenSize() local inbetween = 5 local players = entities.FindByClass("CCSPlayer") for i = 1, #players do local player = players[i] local playername = player:GetName() local playerindex = player:GetIndex() local bot = entities.GetPlayerResources():GetPropInt("m_iPing", playerindex) == 0
if player:GetHealth() <= 0 and not bot and player:GetPropEntity("m_hObserverTarget") ~= nil and playername ~= "GOTV" and playername ~= entities.GetLocalPlayer():GetName() then 
local SpecTargetIndex = player:GetPropEntity("m_hObserverTarget"):GetIndex() 
if entities.GetLocalPlayer():GetHealth() > 0 then if SpecTargetIndex == client.GetLocalPlayerIndex() then draw.SetFont(Vf12) local tW, tH = draw.GetTextSize(playername) draw:Color(255,255,255,255) draw:TextShadow( specX - 5 - tW, inbetween, playername) inbetween = inbetween + tH + 5 end
elseif entities.GetLocalPlayer():GetHealth() <= 0 then if entities.GetLocalPlayer():GetPropEntity("m_hObserverTarget") ~= nil then local imSpeccing = entities.GetLocalPlayer():GetPropEntity("m_hObserverTarget"):GetIndex() 
if SpecTargetIndex == imSpeccing then draw.SetFont(Vf12) local tW, tH = draw.GetTextSize(playername) draw:Color(255,255,255,255) draw:TextShadow(specX - 5 - tW, inbetween, playername) inbetween = inbetween + tH + 5 end end end end end end
callbacks.Register("Draw", SpecList)

-------------------- Recoil Crosshair
function RCC()
if not RecoilCrosshair:GetValue() or entities.GetLocalPlayer() == nil or entities.GetLocalPlayer():GetHealth() <= 0 then return end local screenX, screenY = draw.GetScreenSize() local x = screenX/2 local y = screenY/2
local r, g, b, a = gui.GetValue("clr_esp_crosshair_recoil") local recoil_scale = client.GetConVar("weapon_recoil_scale") local fov = gui.GetValue("vis_view_fov") if fov == 0 then fov = 90 end local weapon = entities.GetLocalPlayer():GetPropEntity("m_hActiveWeapon") if weapon == nil then return end local weapon_name = weapon:GetClass() 
if weapon_name == "CWeaponAWP" or weapon_name == "CWeaponSSG08" or weapon:GetProp("m_flRecoilIndex") == 0 or gui.GetValue("rbot_active") and gui.GetValue("rbot_antirecoil") then return end local aim_punch_angle_pitch, aim_punch_angle_yaw = entities.GetLocalPlayer():GetPropVector("localdata", "m_Local", "m_aimPunchAngle") 
if -aim_punch_angle_pitch >= 0.07 and -aim_punch_angle_pitch >= 0.07 then if gui.GetValue("vis_norecoil") then x = x - (((screenX/fov)* aim_punch_angle_yaw)*1.2)*(recoil_scale*0.5) y = y + (((screenY/fov)* aim_punch_angle_pitch)*2)*(recoil_scale*0.5) else x = x - (((screenX/fov)* aim_punch_angle_yaw)*0.6)*(recoil_scale*0.5) y = y + ((screenY/fov)* aim_punch_angle_pitch)*(recoil_scale*0.5) end 
draw:Color(r, g, b, a) draw.RoundedRect(x-3, y-3, x+3, y+3) end end
callbacks.Register("Draw", RCC)

-------------------- Name Steal fix
function infiniteNameSpam()
if gui.GetValue("msc_namestealer_enable") ~= 0 then namesteal = gui.GetValue("msc_namestealer_enable") end
if infname:GetValue() then client.SetConVar("name", "\n\xAD\xAD\xAD", false) infname:SetValue(0) end end callbacks.Register("Draw", infiniteNameSpam)
function NameStealFix(e)
if not StealNameFix:GetValue() or entities.GetLocalPlayer() == nil or entities.GetLocalPlayer():GetTeamNumber() == 1 then return end
if e:GetName() == "round_end" then gui.SetValue("msc_namestealer_enable", 0) end
if e:GetName() == "round_start" then gui.SetValue("msc_namestealer_enable", namesteal) end end callbacks.Register("FireGameEvent", NameStealFix)

-------------------- Show Team Damage
local damagedone, killed = 0, 0
function KillsAndDamage(e)
if e:GetName() == "player_hurt" then if client.GetPlayerIndexByUserID(e:GetInt("attacker")) == client.GetLocalPlayerIndex() and client.GetPlayerIndexByUserID(e:GetInt("userid")) ~= client.GetLocalPlayerIndex() and playerteam == entities.GetLocalPlayer():GetTeamNumber() then damagedone = damagedone + e:GetInt("dmg_health") end end
if e:GetName() == "player_death" then if client.GetPlayerIndexByUserID(e:GetInt("attacker")) == client.GetLocalPlayerIndex() and client.GetPlayerIndexByUserID(e:GetInt("userid")) ~= client.GetLocalPlayerIndex() and playerteam == entities.GetLocalPlayer():GetTeamNumber() then killed = killed + 1 end end
if e:GetName() == "player_connect_full" then damagedone, killed = 0, 0 end end
function DrawsTKsDMG() if not TeamDamageShow:GetValue() or entities.GetLocalPlayer() == nil then return end local X, Y = draw.GetScreenSize() draw:Color(255,255,255,255) draw.SetFont(Tf) draw:TextShadow(10, Y/2-40, "Damage Done: ".. damagedone) draw:TextShadow(10, Y/2-30, "Teammates Killed: ".. killed) end 
callbacks.Register("FireGameEvent", KillsAndDamage) callbacks.Register("Draw", DrawsTKsDMG)

client.AllowListener("round_freeze_end") client.AllowListener("round_end") client.AllowListener("round_prestart") client.AllowListener("round_start") client.AllowListener("bomb_beginplant") client.AllowListener("bomb_abortplant") client.AllowListener("bomb_planted") client.AllowListener("bomb_defused") client.AllowListener("bomb_begindefuse") client.AllowListener("bomb_abortdefuse") client.AllowListener("round_officially_ended") client.AllowListener("player_spawn") client.AllowListener("player_hurt") client.AllowListener("player_death") client.AllowListener("player_connect_full") client.AllowListener("inferno_expire") client.AllowListener("inferno_extinguish") client.AllowListener("molotov_detonate") client.AllowListener("hegrenade_detonate") client.AllowListener("flashbang_detonate") 
