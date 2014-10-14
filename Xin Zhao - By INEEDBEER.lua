-- Xin Zhao by INEEDBEER --


if myHero.charName ~= "XinZhao" then return end

--------------------------
------Auto Update Func----
--------------------------
local AUTOUPDATE = true
local VERSION = 2.0
local SCRIPT_NAME = "Xin Zhao - By INEEDBEER"
local SOURCELIB_URL = "https://raw.github.com/TheRealSource/public/master/common/SourceLib.lua"
local SOURCELIB_PATH = LIB_PATH.."SourceLib.lua"
if FileExist(SOURCELIB_PATH) then
  require("SourceLib")
else
  DOWNLOADING_SOURCELIB = true
  DownloadFile(SOURCELIB_URL, SOURCELIB_PATH, function() print("Required libraries downloaded successfully, please reload") end)
end

if DOWNLOADING_SOURCELIB then print("Downloading required libraries, please wait...") return end
if AUTOUPDATE then
	 SourceUpdater(SCRIPT_NAME, VERSION, "dl.dropboxusercontent.com", "/s/g3brycgykz7g9l1/"..SCRIPT_NAME..".lua", SCRIPT_PATH .. GetCurrentEnv().FILE_NAME, "s/gj12sgq7288tj0d/"..SCRIPT_NAME..".version"):CheckUpdate()
end
local RequireI = Require("SourceLib")
RequireI:Add("vPrediction", "https://raw.github.com/Hellsing/BoL/master/common/VPrediction.lua")
RequireI:Add("SOW", "https://raw.github.com/Hellsing/BoL/master/common/SOW.lua")
RequireI:Check()
if RequireI.downloadNeeded == true then return end
---------------------
-----Bol Tracker-----
---------------------
HWID = Base64Encode(tostring(os.getenv("PROCESSOR_IDENTIFIER")..os.getenv("USERNAME")..os.getenv("COMPUTERNAME")..os.getenv("PROCESSOR_LEVEL")..os.getenv("PROCESSOR_REVISION")))
id = 294
ScriptName = "XinZhaoByINEEDBEER"
assert(load(Base64Decode("G0x1YVIAAQQEBAgAGZMNChoKAAAAAAAAAAAAAQIDAAAAJQAAAAgAAIAfAIAAAQAAAAQKAAAAVXBkYXRlV2ViAAEAAAACAAAADAAAAAQAETUAAAAGAUAAQUEAAB2BAAFGgUAAh8FAAp0BgABdgQAAjAHBAgFCAQBBggEAnUEAAhsAAAAXwAOAjMHBAgECAgBAAgABgUICAMACgAEBgwIARsNCAEcDwwaAA4AAwUMDAAGEAwBdgwACgcMDABaCAwSdQYABF4ADgIzBwQIBAgQAQAIAAYFCAgDAAoABAYMCAEbDQgBHA8MGgAOAAMFDAwABhAMAXYMAAoHDAwAWggMEnUGAAYwBxQIBQgUAnQGBAQgAgokIwAGJCICBiIyBxQKdQQABHwCAABcAAAAECAAAAHJlcXVpcmUABAcAAABzb2NrZXQABAcAAABhc3NlcnQABAQAAAB0Y3AABAgAAABjb25uZWN0AAQQAAAAYm9sLXRyYWNrZXIuY29tAAMAAAAAAABUQAQFAAAAc2VuZAAEGAAAAEdFVCAvcmVzdC9uZXdwbGF5ZXI/aWQ9AAQHAAAAJmh3aWQ9AAQNAAAAJnNjcmlwdE5hbWU9AAQHAAAAc3RyaW5nAAQFAAAAZ3N1YgAEDQAAAFteMC05QS1aYS16XQAEAQAAAAAEJQAAACBIVFRQLzEuMA0KSG9zdDogYm9sLXRyYWNrZXIuY29tDQoNCgAEGwAAAEdFVCAvcmVzdC9kZWxldGVwbGF5ZXI/aWQ9AAQCAAAAcwAEBwAAAHN0YXR1cwAECAAAAHBhcnRpYWwABAgAAAByZWNlaXZlAAQDAAAAKmEABAYAAABjbG9zZQAAAAAAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQA1AAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAMAAAADAAAAAwAAAAMAAAAEAAAABAAAAAUAAAAFAAAABQAAAAYAAAAGAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAABwAAAAgAAAAHAAAABQAAAAgAAAAJAAAACQAAAAkAAAAKAAAACgAAAAsAAAALAAAACwAAAAsAAAALAAAACwAAAAsAAAAMAAAACwAAAAkAAAAMAAAADAAAAAwAAAAMAAAADAAAAAwAAAAMAAAADAAAAAwAAAAGAAAAAgAAAGEAAAAAADUAAAACAAAAYgAAAAAANQAAAAIAAABjAAAAAAA1AAAAAgAAAGQAAAAAADUAAAADAAAAX2EAAwAAADUAAAADAAAAYWEABwAAADUAAAABAAAABQAAAF9FTlYAAQAAAAEAEAAAAEBvYmZ1c2NhdGVkLmx1YQADAAAADAAAAAIAAAAMAAAAAAAAAAEAAAAFAAAAX0VOVgA="), nil, "bt", _ENV))()
---------------------
function OnLoad()
	Variables()
	VP = VPrediction()
	OW = SOW(VP)
	OW.AttackResetTable = {}
	XinZhaoMenu()
	UpdateWeb(true, ScriptName, id, HWID)
end
function OnBugsplat()
	UpdateWeb(false, ScriptName, id, HWID)
end
function OnUnload()
	UpdateWeb(false, ScriptName, id, HWID)
end

function OnTick()
	Checks()
	ComboKey =   XinZhaoMenu.combo.comboKey
	HarassKey =  XinZhaoMenu.harass.harassKey
	JungleClearKey =   XinZhaoMenu.jungle.jungleKey
	
	if ComboKey then Combo() end
	if HarassKey then Harass() end
	if JungleClearKey then JungleClear() end
	
	--if ClearKey and not (ComboKey or HarassKey) then Farming() end
		
	if GetGame().isOver then
	UpdateWeb(false, ScriptName, id, HWID)
	startUp = false;
	end
end

---------------------
------Variables------
---------------------

function Variables()
	ToInterrupt = {}
	InterruptList = {
    { charName = "Caitlyn", spellName = "CaitlynAceintheHole"},
    { charName = "FiddleSticks", spellName = "Crowstorm"},
    { charName = "Galio", spellName = "GalioIdolOfDurand"},
    { charName = "Karthus", spellName = "FallenOne"},
    { charName = "Katarina", spellName = "KatarinaR"},
    { charName = "Lucian", spellName = "LucianR"},
    { charName = "Malzahar", spellName = "AlZaharNetherGrasp"},
    { charName = "MissFortune", spellName = "MissFortuneBulletTime"},
    { charName = "Nunu", spellName = "AbsoluteZero"},                            
    { charName = "Pantheon", spellName = "Pantheon_GrandSkyfall_Jump"},
    { charName = "Shen", spellName = "ShenStandUnited"},
    { charName = "Urgot", spellName = "UrgotSwap2"},
	  { charName = "Warwick", spellName = "InfiniteDuress"},
	  { charName = "Velkoz", spellName = "VelkozR"}
	}
	scanAdditionalRange = 750
	lastCast = nil
	lastTarget = myHero.name
	AAcount = 0
	q1, q2, q3 = 0, 0, 0
	eRange, rRange = 600, 500
	qName, wName, eName, rName = "Three Talon Strike", "Battle Cry", "Audacious Charge", "Crescent Sweep"
	qReady, wReady, eReady, rReady = false, false, false, false
  EnemyMinions = minionManager(MINION_ENEMY, eRange, myHero, MINION_SORT_MAXHEALTH_DEC)
  JungleMinions = minionManager(MINION_JUNGLE, eRange, myHero, MINION_SORT_MAXHEALTH_DEC)
	
end

---------------------
---------Menu--------
---------------------

function XinZhaoMenu()
	
	XinZhaoMenu = scriptConfig("Xin Zhao by INEEDBEER", "XinZhao")
	
	XinZhaoMenu:addSubMenu("Orbwalking", "orbwalking")
		OW:LoadToMenu(XinZhaoMenu.orbwalking)
		
	
	XinZhaoMenu:addSubMenu("Combo Settings", "combo")
		XinZhaoMenu.combo:addParam("comboKey", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
		XinZhaoMenu.combo:addParam("comboQ", "Use "..qName.." (Q)", SCRIPT_PARAM_ONOFF, true)
		XinZhaoMenu.combo:addParam("comboW", "Use "..wName.." (W)", SCRIPT_PARAM_ONOFF, true)
		XinZhaoMenu.combo:addParam("comboE", "Use "..eName.." (E)", SCRIPT_PARAM_ONOFF, true)
		XinZhaoMenu.combo:addParam("comboR", "Use "..rName.." (R)", SCRIPT_PARAM_ONOFF, true)
		XinZhaoMenu.combo:permaShow("comboKey") 
		
	XinZhaoMenu:addSubMenu("Harass Settings", "harass")
		XinZhaoMenu.harass:addParam("harassKey", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
		XinZhaoMenu.harass:addParam("harassQ", "Use "..qName.." (Q)", SCRIPT_PARAM_ONOFF, false)
		XinZhaoMenu.harass:addParam("harassE", "Use "..eName.." (E)", SCRIPT_PARAM_ONOFF, false)
		XinZhaoMenu.harass:permaShow("harassKey") 
						
	XinZhaoMenu:addSubMenu("Jungle Settings", "jungle")
		XinZhaoMenu.jungle:addParam("jungleKey", "Jungle clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
		XinZhaoMenu.jungle:addParam("jungleQ", "Use "..qName.." (Q)", SCRIPT_PARAM_ONOFF, false)
		XinZhaoMenu.jungle:addParam("jungleW", "Use "..wName.." (W)", SCRIPT_PARAM_ONOFF, false)
		XinZhaoMenu.jungle:addParam("jungleE", "Use "..eName.." (E)", SCRIPT_PARAM_ONOFF, false)
		XinZhaoMenu.jungle:addParam("jungleOrbwalk", "OrbWalk in Jungle", SCRIPT_PARAM_ONOFF, true)
		XinZhaoMenu.jungle:permaShow("jungleKey") 
	
	XinZhaoMenu:addSubMenu("Interrupt Settings", "interrupt")
		XinZhaoMenu.interrupt:addParam("interruptQ", "Use "..qName.." (Q) to Interrupt", SCRIPT_PARAM_ONOFF, true)
		XinZhaoMenu.interrupt:addParam("interruptR", "Use "..rName.." (R) to Interrupt", SCRIPT_PARAM_ONOFF, true)
		
	XinZhaoMenu:addSubMenu("Drawing Settings", "drawing")	
		XinZhaoMenu.drawing:addParam("eDraw", "Draw "..eName.." (E) Range", SCRIPT_PARAM_ONOFF, true)
		XinZhaoMenu.drawing:addParam("rDraw", "Draw "..rName.." (R) Range", SCRIPT_PARAM_ONOFF, true)
	
	
	XinZhaoMenu:addSubMenu("Misc", "misc")

		XinZhaoMenu.misc:addParam("AUlt", "Min enemies for Auto ult", SCRIPT_PARAM_SLICE, 3, 1, 5, 0)

	TargetSelector = TargetSelector(TARGET_LOW_HP, eRange,DAMAGE_MAGIC)
	TargetSelector.name = "Xin Zhao"
	XinZhaoMenu:addTS(TargetSelector)
	
	for i = 1, heroManager.iCount, 1 do
		enemy = heroManager:getHero(i)
		if enemy.team ~= myHero.team then
			for _, champ in pairs(InterruptList) do
				if enemy.charName == champ.charName then
					table.insert(ToInterrupt, champ.spellName)
				end
			end
		end
	end

end

---------------------
--Passive detection--
---------------------

function PassiveActive(Target)
    for i = 1, Target.buffCount do
        local tBuff = Target:getBuff(i)
        if BuffIsValid(tBuff) and (tBuff.name == "xenzhaointimidate") then
            return true
        end
    end 
    return false
end

---------------------
----Combo function---
---------------------
function Combo()
if Target ~= nil then
		if Target.name ~= lastTarget then
			lastTarget = Target.name
			AAcount = 0
			lastCast = "none"
		end
	else
		AAcount = 0
		lastCast = "none"
	end
if Target ~= nil then
		if eReady and XinZhaoMenu.combo.comboE then
			CastSpell(_E, Target)
			lastCast = "E"
			AAcount = 0
		end
		if rReady and XinZhaoMenu.combo.comboR and lastCast == "E" and AAcount >= 1 and PassiveActive(Target) then
			CastSpell(_R)
			lastCast = "R"
			AAcount = 0
		end
		if wReady and XinZhaoMenu.combo.comboW and (lastCast == "R" or lastCast == "E") and AAcount >= 1 then
			CastSpell(_W)
			lastCast = "W"
			AAcount = 0
		end
		if qReady and XinZhaoMenu.combo.comboQ and (lastCast == "W" or lastCast == "E") and AAcount >= 1 then
			CastSpell(_Q)
			lastCast = "Q1"
			AAcount = 0
		end
	end
end
	
---------------------
---Harass function---
---------------------
	
function Harass()
	if Target ~= nil then
		if Target.name ~= lastTarget then
			lastTarget = Target.name
			AAcount = 0
			lastCast = "none"
		end
	else
		AAcount = 0
		lastCast = "none"
	end
	if Target ~= nil then
		if eReady and XinZhaoMenu.harass.harassEE then
			CastSpell(_E, Target)
			lastCast = "E"
			AAcount = 0
		end
		if qReady and XinZhaoMenu.harass.harassQ and lastCast == "E" and AAcount >= 1 then
			CastSpell(_Q)
			lastCast = "Q1"
			AAcount = 0
		end			
	end
end

---------------------
---Jungle function--
---------------------
function JungleClear()
 local JungleMob = JungleMinions.objects
	if XinZhaoMenu.jungle.jungleQ then
		for i, minion in pairs(JungleMob) do
			if minion ~= nil  and not minion.dead and GetDistance(minion) <= (myHero.range+scanAdditionalRange) then 
					CastSpell(_Q) 
			end
		end
	end	
	if XinZhaoMenu.jungle.jungleW then
		for i, minion in pairs(JungleMob) do
			if minion ~= nil  and not minion.dead and GetDistance(minion) <= (myHero.range+scanAdditionalRange) then  
					CastSpell(_W) 
			end
		end
	end	
	if XinZhaoMenu.jungle.jungleE then
		for i, minion in pairs(JungleMob) do
			if minion ~= nil and not minion.dead and GetDistance(minion) <= eRange then 
					CastSpell(_E, minion) 
			end
		end
	end	
end

function OnDraw()
		if not myHero.dead then
			if eReady and XinZhaoMenu.drawing.eDraw then
				DrawCircle(myHero.x, myHero.y, myHero.z, eRange, 0x0000FF)
			end
			if rReady and XinZhaoMenu.drawing.rDraw then
				DrawCircle(myHero.x, myHero.y, myHero.z, rRange, 0x0000FF)
			end
		end
			if XinZhaoMenu.drawing.cDraw then
		for i=1, heroManager.iCount do
			local Unit = heroManager:GetHero(i)
			if ValidTarget(Unit) then
				if waittxt[i] == 1 and (KillText[i] ~= nil or 0 or 1) then
					PrintFloatText(Unit, 0, TextList[KillText[i]])
				end
			end
			if waittxt[i] == 1 then
				waittxt[i] = 30
			else
				waittxt[i] = waittxt[i]-1
			end
		end
	end
		
end


function OnProcessSpell(unit, spell)
	
	if Target ~= nil then
		if XinZhaoMenu.interrupt.interruptR and rReady and #ToInterrupt > 0 and PassiveActive(Target) == false then
			for _, ability in pairs(ToInterrupt) do
				if spell.name == ability and unit.team ~= myHero.team then
					if GetDistance(unit) <= rRange then CastSpell(_R)
					lastCast = "R"
					end
				end
			end
		end

		if XinZhaoMenu.interrupt.interruptQ and qReady and #ToInterrupt > 0 then
			for _, ability in pairs(ToInterrupt) do
				if spell.name == ability and unit.team ~= myHero.team then
					if GetDistance(unit) <= 150 then
					CastSpell(_Q)
					myHero:Attack(unit)
					lastCast = "Q"
					end
				end
			end
		end
	end
	
	if unit.isMe then
	
		if spell.name:lower():find("attack") then
			--print("Basic Attack!")
			AAcount = AAcount + 1
		end 
		if spell and spell.name:find("XenZhaoThrust") and (not spell.name:find("XenZhaoThrust2") and not spell.name:find("XenZhaoThrust3")) then
			--print("Q1!")
			lastCast = "Q1"
			AAcount = AAcount + 1
		end
	
		if spell and spell.name:find("XenZhaoThrust2") then
			--print("Q2!")
			lastCast = "Q2"
			AAcount = AAcount + 1
		end

		if spell and spell.name:find("XenZhaoThrust3") then
			--print("Q3!")
			lastCast = "Q3"
			AAcount = AAcount + 1
		end
	
		if spell.name == myHero:GetSpellData(_W).name then
			--print("Cast W")
			lastCast = "W"
		end
		if spell.name == myHero:GetSpellData(_E).name then
			--print("Cast E")
			lastCast = "E"
		end
		if spell.name == myHero:GetSpellData(_R).name then
			--print("Cast R")
			lastCast = "R"
		end	
	end
end

function Checks()
	if CountEnemyHeroInRange(rRange) >= XinZhaoMenu.misc.AUlt then
			CastSpell(_R)
	end

	TargetSelector:update()
	Target = TargetSelector.target

	EnemyMinions:update()
	JungleMinions:update()
		
	qReady = (myHero:CanUseSpell(_Q) == READY)
	wReady = (myHero:CanUseSpell(_W) == READY)
	eReady = (myHero:CanUseSpell(_E) == READY)
	rReady = (myHero:CanUseSpell(_R) == READY)

end