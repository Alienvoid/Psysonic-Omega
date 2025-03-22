--- define lua functions 
function NoOp(self, source)
end


function kill(self) -- Kill unit self.
	ExecuteAction("NAMED_KILL", self);
end

function RadiateUncontrollableFear( self )
	ObjectBroadcastEventToEnemies( self, "BeUncontrollablyAfraid", 350 )
end

function RadiateGateDamageFear(self)
	ObjectBroadcastEventToAllies(self, "BeAfraidOfGateDamaged", 200)
end

function OnNeutralGarrisonableBuildingCreated(self)
	ObjectHideSubObjectPermanently( self, "ARMOR", true )
end

function OnGDITechCenterCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_Boost", true )
	ObjectHideSubObjectPermanently( self, "UG_Mortar", true )
	ObjectHideSubObjectPermanently( self, "B_MortarRound_1", true )
	ObjectHideSubObjectPermanently( self, "UG_Rail", true )
	ObjectHideSubObjectPermanently( self, "UG_Scan", true )
end

function OnGDIMedicalBayCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_Armor", true )
	ObjectHideSubObjectPermanently( self, "UG_StealthDetector", true )
	ObjectHideSubObjectPermanently( self, "UG_StealthDetector01", true )
	ObjectHideSubObjectPermanently( self, "UG_Injector", true )
end

function OnGDIPowerPlantCreated(self)
	ObjectHideSubObjectPermanently( self, "Turbines", true )
	ObjectHideSubObjectPermanently( self, "TurbineGlows", true )
end

function OnGDIZoneTrooperCreated(self)
	ObjectHideSubObjectPermanently( self, "UGSCANNER", true )
	ObjectHideSubObjectPermanently( self, "UGJUMP", true )
	ObjectHideSubObjectPermanently( self, "UGINJECTOR", true )
end

function OnGDIPredatorCreated(self)
	ObjectHideSubObjectPermanently( self, "UGRAIL_01", true )
end

function OnGDIMammothCreated(self)
	ObjectHideSubObjectPermanently( self, "UGRAIL_01", true )
	ObjectHideSubObjectPermanently( self, "UGRAIL_02", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_01", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_02", true )
end

function OnGDIJuggernaughtCreated(self)
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_01", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_02", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_03", true )
	
end

function OnGDIWatchTowerCreated(self)
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_01", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_02", true )
end

function OnGDIFirehawkCreated(self)
	-- bomb load by default.
	ObjectGrantUpgrade( self, "Upgrade_SelectLoad_02" )
	ObjectHideSubObjectPermanently( self, "Plane04", true )
end

function OnGDIPitbullCreated(self)
	ObjectHideSubObjectPermanently( self, "MortorTube", true )
end

function OnGDIOrcaCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_PROBE", true )
end

function OnGDISniperSquadCreated(self)
	ObjectSetObjectStatus( self, "CAN_SPOT_FOR_BOMBARD" )
end

function OnGDIOrcaClipEmpty(self)
	ObjectHideSubObjectPermanently( self, "MISSILE01", true )
end

function OnGDIOrcaClipFull(self)
	ObjectHideSubObjectPermanently( self, "MISSILE01", false )
end

function OnGDIV35Ox_SummonedForVehicleCreated(self)
	ObjectHideSubObjectPermanently( self, "LOADREF", true )
end

function OnNODShredderCreated(self)

end

function OnNODRaiderTankCreated(self)
	ObjectHideSubObjectPermanently( self, "Gun_Upgrade", true )
	ObjectHideSubObjectPermanently( self, "Turret2_Gun", true )
	ObjectHideSubObjectPermanently( self, "Turret2", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_01", true )
	ObjectHideSubObjectPermanently( self, "DOZERBLADE", true )
end

function OnNODAvatarCreated(self)
	ObjectHideSubObjectPermanently( self, "NUBEAM", true )
	ObjectHideSubObjectPermanently( self, "FLAMETANK", true )
	ObjectHideSubObjectPermanently( self, "S_DETECTOR", true )
	ObjectHideSubObjectPermanently( self, "S_GENERATOR", true )
end

function OnNODAvatarGenericEvent(self, data)

	local str = tostring( data )

	if str == "upgrades_copied" then
		ObjectRemoveUpgrade( self, "Upgrade_Veterancy_VETERAN" );
		ObjectRemoveUpgrade( self, "Upgrade_Veterancy_ELITE" );
		ObjectRemoveUpgrade( self, "Upgrade_Veterancy_HEROIC" );
	end
end

function OnNODScorpionBuggyCreated(self)
	ObjectHideSubObjectPermanently( self, "EMP", true )
end

function OnNODVenomCreated(self)
	ObjectHideSubObjectPermanently( self, "SigGen", true )
end

function OnNODTechAssembleyPlantCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_EMP", true )
	ObjectHideSubObjectPermanently( self, "UG_Lasers", true )
	ObjectHideSubObjectPermanently( self, "UG_SigGen", true )
	ObjectHideSubObjectPermanently( self, "UG_DozerBlades", true )
end

function OnNODSecretShrineCreated(self)
	ObjectHideSubObjectPermanently( self, "GLOWS", true )	
	ObjectHideSubObjectPermanently( self, "ConfUpgrd", true )
end

function OnNODSecretShrinePowerOutage(self)	
	if ObjectHasUpgrade( self, "Upgrade_NODConfessorUpgrade" ) == 1 then
		ObjectHideSubObjectPermanently( self, "GLOWS", true )	
	end
end

function OnNODSecretShrinePowerRestored(self)		 
	if ObjectHasUpgrade( self, "Upgrade_NODConfessorUpgrade" ) == 1 then
		ObjectHideSubObjectPermanently( self, "GLOWS", false )	
	end
end


function OnAlliedAntiVehicleInfantryGenericEvent(self, data)
	local str = tostring( data )

	if str == "laser_on" then
		ObjectHideSubObjectPermanently( self, "FX_LASER", false )
	elseif str == "laser_off" then
		ObjectHideSubObjectPermanently( self, "FX_LASER", true )
	end
end

function OnAlliedBarracksCreated(self)
	ObjectHideSubObjectPermanently( self, "Upgrade_02", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_03", true )
end

function OnAlliedConstructionYardCreated(self)
	ObjectHideSubObjectPermanently( self, "Upgrade_02", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_03", true )
	ExecuteAction("SET_CAMERA_CLIP_DEPTH_MULTIPLIER",10)
end

function onCreatedControlPointFunctions(self)
	ObjectHideSubObjectPermanently( self, "TB_CP_ALN", true )
	ObjectHideSubObjectPermanently( self, "TB_CP_GDI", true )
	ObjectHideSubObjectPermanently( self, "TB_CP_NOD", true )
	ObjectHideSubObjectPermanently( self, "LIGHTSF01", true )
	ObjectHideSubObjectPermanently( self, "100", false)
	ObjectHideSubObjectPermanently( self, "75", false)
	ObjectHideSubObjectPermanently( self, "50", false)
	ObjectHideSubObjectPermanently( self, "25", false )
end

function onBuildingPowerOutage(self)
	ObjectHideSubObjectPermanently( self, "LIGHTS", true )
	ObjectHideSubObjectPermanently( self, "FXLIGHTS05", true )
	ObjectHideSubObjectPermanently( self, "FXLIGHTS", true )
	ObjectHideSubObjectPermanently( self, "FXGLOWS", true )
	ObjectHideSubObjectPermanently( self, "FLASHINGLIGHTS", true )
	ObjectHideSubObjectPermanently( self, "MESH01", true )
	ObjectHideSubObjectPermanently( self, "POWERPLANTGLOWS", true )
	ObjectHideSubObjectPermanently( self, "LIGHTL", true )
	ObjectHideSubObjectPermanently( self, "LIGHTR", true )
	ObjectHideSubObjectPermanently( self, "LIGHTS1", true )
	ObjectHideSubObjectPermanently( self, "NBCHEMICALPTE1", true )
	ObjectHideSubObjectPermanently( self, "LINKS", true )
	ObjectHideSubObjectPermanently( self, "MESH28", true )
	ObjectHideSubObjectPermanently( self, "TURBINEGLOWS", true )
	ObjectHideSubObjectPermanently( self, "GLOWS", true )
end

function onBuildingPowerRestored(self)
	ObjectHideSubObjectPermanently( self, "LIGHTS", false )
	ObjectHideSubObjectPermanently( self, "FXLIGHTS05", false )
	ObjectHideSubObjectPermanently( self, "FXLIGHTS", false )
	ObjectHideSubObjectPermanently( self, "FXGLOWS", false )
	ObjectHideSubObjectPermanently( self, "FLASHINGLIGHTS", false )
	ObjectHideSubObjectPermanently( self, "MESH01", false )
	ObjectHideSubObjectPermanently( self, "POWERPLANTGLOWS", false )
	ObjectHideSubObjectPermanently( self, "LIGHTL", false )
	ObjectHideSubObjectPermanently( self, "LIGHTR", false )
	ObjectHideSubObjectPermanently( self, "LIGHTS1", false )
	ObjectHideSubObjectPermanently( self, "NBCHEMICALPTE1", false )
	ObjectHideSubObjectPermanently( self, "LINKS", false )
	ObjectHideSubObjectPermanently( self, "MESH28", false )
	ObjectHideSubObjectPermanently( self, "TURBINEGLOWS", false )
	ObjectHideSubObjectPermanently( self, "GLOWS", false )
end







function OnGenericJapanBuildingCreated(self)
	ObjectHideSubObjectPermanently( self, "Upgrade_02", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_03", true )
end

function OnNeutralGarrisonableBuildingGenericEvent(self,data)
end

function onCreatedGDIOrcaAirstrike(self)
	ObjectForbidPlayerCommands( self, true )
end

function onCreatedAlienMCVUnpacking(self)
	ObjectForbidPlayerCommands( self, true )
end

function MakeMeAlert(self)
	ObjectEnterAlertState(self)
end

function BecomeUncontrollablyAfraid(self, other)
	if not ObjectTestCanSufferFear(self) then
		return
	end

	ObjectEnterUncontrollableCowerState(self, other)
end

function RadiateTerror(self, other)
	ObjectBroadcastEventToEnemies(self, "BeTerrified", 180)
end
	
function RadiateTerrorEx(self, other, terrorRange)
	ObjectBroadcastEventToEnemies(self, "BeTerrified", terrorRange)
end
	

function BecomeTerrified(self, other)
	ObjectEnterRunAwayPanicState(self, other)
end

function BecomeAfraidOfGateDamaged(self, other)
	if not ObjectTestCanSufferFear(self) then
		return
	end

	ObjectEnterCowerState(self,other)
end


function ChantForUnit(self) -- Used by units to broadcast the chant event to their own side.
	ObjectBroadcastEventToAllies(self, "BeginChanting", 9999)
end

function StopChantForUnit(self) -- Used by units to stop the chant event to their own side.
	ObjectBroadcastEventToAllies(self, "StopChanting", 9999)
end

function SpyMoving(self, other)
	print(ObjectDescription(self).." spying movement of "..ObjectDescription(other));
end

function OnGarrisonableCreated(self)
	ObjectHideSubObjectPermanently( self, "GARRISON01", true )
	ObjectHideSubObjectPermanently( self, "GARRISON02", true )
end

function OnRubbleDropshipCreated(self)
	ObjectHideSubObjectPermanently( self, "Loadref", true )
end

function OnSovietAntiVehicleVehicleTech1Created(self)
	ObjectHideSubObjectPermanently( self, "Upgrade_Athena_Cannon", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_AutoCannon", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Big_Cannon", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Cryo_Weapon", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_FlakCannon", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_FlakMissile", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_GaussCannon", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Laser_Cannon", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_PrismCannon", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Small_Cannon", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_TeslaCoil", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_V4Rocket_A", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_V4Rocket_Missile", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Waveforce", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_FutureTank", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_GigaFortress", true )
end

function OnAlliedInfantryFightingCreated(self)
	ObjectHideSubObjectPermanently( self, "NUBEAM", true )
	ObjectHideSubObjectPermanently( self, "FLAMETANK", true )
	ObjectHideSubObjectPermanently( self, "S_DETECTOR", true )
	ObjectHideSubObjectPermanently( self, "S_GENERATOR", true )
end


function OnAlliedBaseDefenseCreated(self)
	ObjectHideSubObjectPermanently( self, "Upgrade_Blaster_Rifles", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Engineer", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Flak", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_GoldenGun", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_MachineGun", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_MissileLauncher", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Natasha_Sniper", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Ninja_Star", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Ninja_Turret", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Plasma", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Psyonic", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Psyonic_Turret", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Shotgun", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Speakers", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Tanya_Pistols", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Tesla_Turret", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Tesla", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Turret", true )
	ObjectHideSubObjectPermanently( self, "Tanya", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Cryo", true )	
	ObjectHideSubObjectPermanently( self, "Upgrade_ArcherMaiden", true )	
	ObjectHideSubObjectPermanently( self, "Upgrade_ArcherMaidenString", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Desolator", true )	
end

function OnAlliedAntiAirVehicleTech1Created(self)
	ObjectHideSubObjectPermanently( self, "Upgrade_Blaster_Rifles", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Engineer", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Flak", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_GoldenGun", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_MachineGun", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_MissileLauncher", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Natasha_Sniper", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Ninja_Star", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Ninja_Turret", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Plasma", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Psyonic", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Psyonic_Turret", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Shotgun", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Speakers", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Tanya_Pistols", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Tesla_Turret", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Tesla", true )
	ObjectHideSubObjectPermanently( self, "Tanya", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Cryo", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_ArcherMaiden", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_ArcherMaidenString", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Desolator", true )
end

function OnAlliedInfantryFightingCreated(self)
	ObjectHideSubObjectPermanently( self, "NUBEAM", true )
	ObjectHideSubObjectPermanently( self, "FLAMETANK", true )
	ObjectHideSubObjectPermanently( self, "S_DETECTOR", true )
	ObjectHideSubObjectPermanently( self, "S_GENERATOR", true )
end

function OnJapanAntiStructureShipCreated(self)
	ObjectHideSubObjectPermanently( self, "Upgrade_01", true )
end

function OnJapanAdvancedBattleShipCreated(self)
	ObjectHideSubObjectPermanently( self, "SKIN_Upgrade_01", true )
end


-- this function expects an eventType of 'onDisguiseAs' and checks for various assetIDs, hiding the appropriate subObjects
function OnJapanLightTransportVehicleGenericEvent(self, eventType, data)
	local eTpye = tostring( eventType )
	
	if not eType == "onDisguiseAs" then
		return
	end
	
	local str = tostring( data )
	
	-- this is the assetID of an AlliedAntiAirVehicleTech1
	if str == "3137747290" then
		ObjectHideSubObjectPermanently( self, "Upgrade_Blaster_Rifles", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Engineer", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Flak", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_GoldenGun", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_MachineGun", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_MissileLauncher", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Natasha_Sniper", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Ninja_Star", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Ninja_Turret", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Plasma", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Psyonic", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Psyonic_Turret", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Shotgun", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Speakers", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Tanya_Pistols", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Tesla_Turret", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Tesla", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Turret", true )
		ObjectHideSubObjectPermanently( self, "Tanya", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Cryo", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_ArcherMaiden", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_ArcherMaidenString", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Desolator", true )
	-- this is the assetID of a SovietAntiVehicleVehicleTech1
	elseif str == "2494781707" then
		ObjectHideSubObjectPermanently( self, "Upgrade_Athena_Cannon", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_AutoCannon", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Big_Cannon", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Cryo_Weapon", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_FlakCannon", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_FlakMissile", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_GaussCannon", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Laser_Cannon", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_PrismCannon", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Small_Cannon", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_TeslaCoil", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_V4Rocket_A", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_V4Rocket_Missile", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_Waveforce", true )	
		ObjectHideSubObjectPermanently( self, "Upgrade_FutureTank", true )
		ObjectHideSubObjectPermanently( self, "Upgrade_GigaFortress", true )
	end
end

function OnEnterForceFloting(self)
	ObjectGrantUpgrade( self, "Upgrade_ForceFloating" )
end

function OnOutForceFloting(self)
	ObjectRemoveUpgrade( self, "Upgrade_ForceFloating" )
end

function OnEnterDivingBombardment(self)
	ObjectGrantUpgrade( self, "Upgrade_DiveBombing" )
end

function OnOutDivingBombardment(self)
	ObjectRemoveUpgrade( self, "Upgrade_DiveBombing" )
end

function OnMARVDamaged(self)
	ExecuteAction("NAMED_KILL", self);
	-- ObjectDoSpecialPower( self, "SpecialPower_Recovery" )
end

function SkyConstructionYardCreated(self)
	ExecuteAction("SET_CAMERA_CLIP_DEPTH_MULTIPLIER",10)
end

function OnSACOMMedicFunctionsGenericEvent(self, data)
	local str = tostring( data )

	if str == "teslalight_off" then
		ObjectHideSubObjectPermanently( self, "ALLIED_ANTI_INFANTRY01", false )
		ObjectHideSubObjectPermanently( self, "SKIN_SHIELD", true )
	elseif str == "teslalight_on" then
		ObjectHideSubObjectPermanently( self, "ALLIED_ANTI_INFANTRY01", true )
		ObjectHideSubObjectPermanently( self, "SKIN_SHIELD", false )
	end
end

function OnSACOMAntiStructureVehicleGenericEvent(self, data)
	local str = tostring( data )

	if str == "laser_on" then
		ObjectHideSubObjectPermanently( self, "SKIN_LASER", false )
		ObjectHideSubObjectPermanently( self, "Skin_CruiseMissile", false )
		ObjectHideSubObjectPermanently( self, "Skin_MISSILE", true )
		
	elseif str == "laser_off" then
		ObjectHideSubObjectPermanently( self, "SKIN_LASER", true )
		ObjectHideSubObjectPermanently( self, "Skin_CruiseMissile", true )
		ObjectHideSubObjectPermanently( self, "Skin_MISSILE", false )
	end
end

function OnSACOMBasicInfantryGenericEvent(self, data)
	local str = tostring( data )

	if str == "grenade_on" then
		ObjectHideSubObjectPermanently( self, "GRENADE", false )
		ObjectHideSubObjectPermanently( self, "AK47", true )
		ObjectHideSubObjectPermanently( self, "Cylinder01", true )
	elseif str == "grenade_off" then
		ObjectHideSubObjectPermanently( self, "GRENADE", true )
		ObjectHideSubObjectPermanently( self, "AK47", false )
		ObjectHideSubObjectPermanently( self, "Cylinder01", false )
	end
end

function OnSovietBasicInfantryGenericEvent(self, data)
	local str = tostring( data )

	if str == "grenade_on" then
		ObjectHideSubObjectPermanently( self, "GRENADE", false )
		ObjectHideSubObjectPermanently( self, "AK47", true )
	elseif str == "grenade_off" then
		ObjectHideSubObjectPermanently( self, "GRENADE", true )
		ObjectHideSubObjectPermanently( self, "AK47", false )
	end
end

function OnNinjaOutLeapingEvent(self)
	ObjectDoSpecialPower( self, "SpecialPower_NinjaBack" );
end

function OnSACOMAntiAirMissileVehicleGenericEvent(self, data)
	local str = tostring( data )

	if str == "missile_mode" then
		ObjectHideSubObjectPermanently( self, "EMPMODE", true )
		ObjectHideSubObjectPermanently( self, "MISSILEMODE", false )
		
	elseif str == "emp_mode" then
		ObjectHideSubObjectPermanently( self, "EMPMODE", false )
		ObjectHideSubObjectPermanently( self, "MISSILEMODE", true )
	end
end

-- Ore LUA


AllTeamTable={
"/team",
"Player_1/teamPlayer_1","Player_2/teamPlayer_2","Player_3/teamPlayer_3","Player_4/teamPlayer_4","Player_5/teamPlayer_5","Player_6/teamPlayer_6",
"Player_7/teamPlayer_7","Player_8/teamPlayer_8",
"Player_1/defaultSkirmishTeamPlayer_1","Player_2/defaultSkirmishTeamPlayer_2","Player_3/defaultSkirmishTeamPlayer_3","Player_4/defaultSkirmishTeamPlayer_4",
"Player_5/defaultSkirmishTeamPlayer_5","Player_6/defaultSkirmishTeamPlayer_6","Player_7/defaultSkirmishTeamPlayer_7","Player_8/defaultSkirmishTeamPlayer_8",
"PlyrCivilian/teamPlyrCivilian","PlyrCreeps/teamPlyrCreeps","ReplayObserver/teamReplayObserver","SkirmishNeutral/teamSkirmishNeutral",
"SkirmishCivilian/teamSkirmishCivilian","SkirmishNull/teamSkirmishNull","TeamManager1/teamTeamManager1","TeamManager2/teamTeamManager2"}

ObjectStatusTable={
["DESTROYED"]=0,["CAN_ATTACK"]=1,["UNDER_CONSTRUCTION"]=2,["UNSELECTABLE"]=3,["NO_COLLISIONS"]=4,["NO_ATTACK"]=5,["NO_SPECIAL_ABILITY"]=6,
["AIRBORNE_TARGET"]=7,["PARACHUTING"]=8,["REPULSOR"]=9,["HIJACKED"]=10,["AFLAME"]=11,["BURNED"]=12,["CANNOT_BE_SOLD"]=13,
["IS_FIRING_WEAPON"]=14,["IS_RELOADING_WEAPON"]=15,["IS_BRAKING"]=16,["STEALTHED"]=17,["HIDDEN"]=18,["DETECTED"]=19,["CAN_STEALTH"]=20,
["SOLD"]=21,["UNDERGOING_REPAIR"]=22,["RECONSTRUCTING"]=23,["IS_ATTACKING"]=24,["NO_AUTO_ACQUIRE"]=25,["USING_ABILITY"]=26,["IS_AIMING_WEAPON"]=27,
["NO_ATTACK_FROM_AI"]=28,["IGNORING_STEALTH"]=29,["IS_MELEE_ATTACKING"]=30,["FOLLOWING_THROUGH"]=31,["LEASHED_RETURNING"]=32,["DEATH_1"]=33,["DEATH_2"]=34,
["DEATH_3"]=35,["DEATH_4"]=36,["DEATH_5"]=37,["CONTESTED"]=38,["CONTESTING_BUILDING"]=39,["HORDE_MEMBER"]=40,["TRANSPORT_MOVING_TO_CONTAIN"]=41,
["RIDER_IS_PILOT"]=42,["DAMAGED"]=43,["REALLYDAMAGED"]=44,["RUBBLE"]=45,["IRRADIATED"]=46,["NO_SHADOW"]=47,["IN_STASIS"]=48,
["OUT_OF_PHASE"]=49,["NEXT_MOVE_IS_REVERSE"]=50,["IMMOBILE"]=51,["IMMOBILE_ALLOW_ROTATE"]=52,["PAUSING"]=53,["FLEE_OFF_MAP"]=54,["NOT_IN_WORLD"]=55,
["INAUDIBLE"]=56,["CHANTING"]=57,["ENRAGED"]=58,["SINKING"]=59,["RAMPAGING"]=60,["INSIDE_GARRISON"]=61,["DEPLOYED"]=62,
["UNATTACKABLE"]=63,["ENCLOSED"]=64,["TEMPORARILY_DEFECTED"]=65,["TAGGED"]=66,["DEPLOYING"]=67,["TOPPLING"]=68,["PORTER_TAGGED"]=69,
["NO_SQUISHCOLLIDE_DELAY"]=70,["STAND_GROUND"]=71,["UNCONTROLLABLY_SCARED"]=72,["SPECIAL_ABILITY_PACKING_UNPACKING_OR_USING"]=73,["TIBERIUM_VIBRATING"]=74,["UPDATING_AI"]=75,["CLONED"]=76,
["IGNORE_AI_COMMAND"]=77,["RUNNING_DOWN_FROM_BEHIND"]=78,["DO_NOT_SCORE"]=79,["CAN_NOT_WALK_ON"]=80,["MARCH_OF_DEATH"]=81,["DO_NOT_PICK_ME"]=82,["INHERITED_FROM_ALLY_TEAM"]=83,
["SWITCHED_WEAPONS"]=84,["END_FIRE_STATE"]=85,["BOOKENDING"]=86,["GENERIC_TOGGLE_STATE"]=87,["CAN_CONTEST_GARRISON"]=88,["BUILD_BEING_CANCELED"]=89,["PENDING_CONSTRUCTION"]=90,
["PHANTOM_STRUCTURE"]=91,["IN_FORMATION_TEMPLATE"]=92,["IS_LEAVING_FACTORY"]=93,["MOVING_TO_DISMOUNT"]=94,["NO_HERO_PROPERTIES"]=95,["CAN_ENTER_ANYTHING"]=96,["ENTERING_GOAL"]=97,
["CHARGING_BASE_DEFENSES"]=98,["INVISIBLE_DETECTED_BY_FRIEND"]=99,["INVISIBLE_DETECTED"]=100,["SHRUNK"]=101,["ATTACHED"]=102,["WONT_RIDE_WITH_YOU"]=103,["COMMAND_BUTTON_TOGGLED"]=104,
["OCLMONITOR_COMPLETED_TASK"]=105,["OCLMONITOR_MONITOR_RELEASED"]=106,["USER_POWERED_DOWN"]=107,["GARRISONED"]=108,["BOOBY_TRAPPED"]=109,["IS_HIDEOUT"]=110,["EXECUTING_STORED_COMMAND"]=111,
["UNIT_WANTS_TO_REGARRISON"]=112,["IN_COVER"]=113,["DONT_CLEAR_FOR_BUILD"]=114,["MATCH_TARGETS_SPEED"]=115,["HAS_TIBERIUM_GROWTH_MOD"]=116,["HAS_TIBERIUM_UPGRADE"]=117,["STEAL_NEXT_UNIT_TRAPPED"]=118,
["DOES_CONTAIN_TIBERIUM"]=119,["IS_BEING_HARVESTED"]=120,["NO_REFUND"]=121,["SHIELDBODY_ENABLED"]=122,["HEALTH_PERCENT_0"]=123,["HEALTH_PERCENT_25"]=124,["HEALTH_PERCENT_50"]=125,
["HEALTH_PERCENT_75"]=126,["HEALTH_PERCENT_100"]=127,["WEAPON_UPGRADED_01"]=128,["WEAPON_UPGRADED_02"]=129,["WEAPON_UPGRADED_03"]=130,["COMBINED_PARENT"]=131,["COMBINED_CHILD"]=132,
["COMBINED_ATTACHED"]=133,["LOADED_FROM_MAP"]=134,["ATTACKING_GARRISONED_STRUCTURE"]=135,["EXITING_COMBINED"]=136,["DELAYED_ENTER_STRUCTURE"]=137,["DOCKING"]=138,["HARVESTING"]=139,
["BRIDGE_IMPASSABLE"]=140,["POWERED_DOWN_EMP"]=141,["FORCE_ATTACKING"]=142,["FORCE_ATTACK_MOVING"]=143,["SCARED_CIVILIAN_CAR"]=144,["USER_PARALYZED"]=145,["BOOBY_TRAP_EXPLODE"]=146,
["IS_ENGAGED"]=147,["CARRYING_FLAG"]=148,["IS_MOVING_TO_RALLY_POINT"]=149,["SPECIAL_ARMOR_ACTIVE"]=150,["AIRCRAFT_IGNORE_SAMEPLAYER_HANGAR_RULE"]=151,["NEXT_MOVE_IS_FORCE_ATTACK_MOVE"]=152,["SPECIALABILITY_ACTIVE"]=153,
["CAN_STEALTH_FROM_PRODUCER"]=154,["GARRISON_CAN_STEALTH"]=155,["CAN_ATTACK_WHILE_STEALTHED"]=156,["RESET_GOAL_POSITION"]=157,["RIFT_OCCUPIED"]=158,["WATER_LOCOMOTOR_ACTIVE"]=159,["GROUND_LOCOMOTOR_ACTIVE"]=160,
["AIR_LOCOMOTOR_ACTIVE"]=161,["UNPACKING"]=162,["OVER_WATER"]=163,["CONTAINER_OCCUPIED"]=164,["PLACED_BY_PLAYER"]=165,["DEFLECT_INCOMING_FIRE"]=166,["DEPART_FROM_BOARDING"]=167,
["WAITING_FOR_BOARDING"]=168,["HAS_SECONDARY_DAMAGE"]=169,["IS_BEING_DRAGGED"]=170,["CLEARED_FOR_LANDING"]=171,["VEHICLE_ATTACHED"]=172,["PARKED_AT_AIRFIELD"]=173,["IN_SHIELD_SPHERE"]=174,
["HIT_SHIELD_SPHERE"]=175,["NON_AUTOACQUIRABLE"]=176,["CHARGING_WEAPON"]=177,["OVERCHARGING_WEAPON"]=178,["ENABLE_TRACER_DRAW"]=179,["PREEMPT_PRE_ATTACK"]=180,["LINE_SEGMENT_DAMAGE_ACTIVE"]=181,
["ADVANCED_MISSILE_PACKS"]=182,["LEECHED_TARGET_ACTIVE"]=183,["PLAYER_POWER_1"]=184,["PLAYER_POWER_2"]=185,["PLAYER_POWER_3"]=186,["PLAYER_POWER_4"]=187,["PLAYER_POWER_5"]=188,
["GRAPPLE_UPDATE_ACTIVE"]=189,["SHROUD_REVEAL_TO_ALL"]=190,["SURFACED"]=191,["SUBMERGED"]=192,["SKIRMISH_AI_DO_NOT_ATTACK"]=193,["SKIRMISH_AI_DO_NOT_TAKE"]=194,["TRANSFORMATION_TOGGLE_STATE"]=195,
["REPAIR_ALLIES_WHEN_IDLE"]=196,["DO_NOT_AVOID_TALLBUILDING"]=197,["ABSORBED_DAMAGE"]=198,["NO_BRIBE"]=199,["IGNORING_POWER_DOWN"]=200,["EXCEEDED_PATH_NEIGHBOR_COUNT"]=201,["CANNOT_LAND_AT_AIRFIELD"]=202,
["WALL_SEGMENT"]=203,["IMMUNE_TO_BARK"]=204,["UNDER_RUSH_ATTACK"]=205,["UNDER_FROZEN"]=206,["LANDING_IN_PROGRESS"]=207,["UNDER_IRON_CURTAIN"]=208,["EXPLOSIVES_ATTACHED"]=209,
["EXPLOSIVES_DETONATING"]=210,["LIFTED_INTO_AIR"]=211,["IN_NANOHIVE"]=212,["SURFACED_IMMOBILE"]=213,["BROADCASTING_INVISIBILITY"]=214,["SCRAMBLED"]=215,["MAGNETIZED"]=216,
["RIOT_SHIELDED"]=217,["POINT_DEFENSE_DRONE_ATTACHED"]=218,["GRAPPLE_UPDATE_BEING_MOVED"]=219,["TARGETED_FOR_REPAIR"]=220,["IN_SPIDER_HOLE"]=221,["ANTI_GARRISON"]=222}

ObjectStatusTable_Test={
"DESTROYED","CAN_ATTACK","UNDER_CONSTRUCTION","UNSELECTABLE","NO_COLLISIONS","NO_ATTACK",
"NO_SPECIAL_ABILITY","AIRBORNE_TARGET","PARACHUTING","REPULSOR","HIJACKED","AFLAME",
"BURNED","CANNOT_BE_SOLD","IS_FIRING_WEAPON","IS_RELOADING_WEAPON","IS_BRAKING","STEALTHED",
"HIDDEN","DETECTED","CAN_STEALTH","SOLD","UNDERGOING_REPAIR","RECONSTRUCTING",
"IS_ATTACKING","NO_AUTO_ACQUIRE","USING_ABILITY","IS_AIMING_WEAPON","NO_ATTACK_FROM_AI","IGNORING_STEALTH",
"IS_MELEE_ATTACKING","FOLLOWING_THROUGH","LEASHED_RETURNING","DEATH_1","DEATH_2","DEATH_3",
"DEATH_4","DEATH_5","CONTESTED","CONTESTING_BUILDING","HORDE_MEMBER","TRANSPORT_MOVING_TO_CONTAIN",
"RIDER_IS_PILOT","DAMAGED","REALLYDAMAGED","RUBBLE","IRRADIATED","NO_SHADOW",
"IN_STASIS","OUT_OF_PHASE","NEXT_MOVE_IS_REVERSE","IMMOBILE","IMMOBILE_ALLOW_ROTATE","PAUSING",
"FLEE_OFF_MAP","NOT_IN_WORLD","INAUDIBLE","CHANTING","ENRAGED","SINKING",
"RAMPAGING","INSIDE_GARRISON","DEPLOYED","UNATTACKABLE","ENCLOSED","TEMPORARILY_DEFECTED",
"TAGGED","DEPLOYING","TOPPLING","PORTER_TAGGED","NO_SQUISHCOLLIDE_DELAY","STAND_GROUND",
"UNCONTROLLABLY_SCARED","SPECIAL_ABILITY_PACKING_UNPACKING_OR_USING","TIBERIUM_VIBRATING","UPDATING_AI","CLONED","IGNORE_AI_COMMAND",
"RUNNING_DOWN_FROM_BEHIND","DO_NOT_SCORE","CAN_NOT_WALK_ON","MARCH_OF_DEATH","DO_NOT_PICK_ME","INHERITED_FROM_ALLY_TEAM",
"SWITCHED_WEAPONS","END_FIRE_STATE","BOOKENDING","GENERIC_TOGGLE_STATE","CAN_CONTEST_GARRISON","BUILD_BEING_CANCELED",
"PENDING_CONSTRUCTION","PHANTOM_STRUCTURE","IN_FORMATION_TEMPLATE","IS_LEAVING_FACTORY","MOVING_TO_DISMOUNT","NO_HERO_PROPERTIES",
"CAN_ENTER_ANYTHING","ENTERING_GOAL","CHARGING_BASE_DEFENSES","INVISIBLE_DETECTED_BY_FRIEND","INVISIBLE_DETECTED","SHRUNK",
"ATTACHED","WONT_RIDE_WITH_YOU","COMMAND_BUTTON_TOGGLED","OCLMONITOR_COMPLETED_TASK","OCLMONITOR_MONITOR_RELEASED","USER_POWERED_DOWN",
"GARRISONED","BOOBY_TRAPPED","IS_HIDEOUT","EXECUTING_STORED_COMMAND","UNIT_WANTS_TO_REGARRISON","IN_COVER",
"DONT_CLEAR_FOR_BUILD","MATCH_TARGETS_SPEED","HAS_TIBERIUM_GROWTH_MOD","HAS_TIBERIUM_UPGRADE","STEAL_NEXT_UNIT_TRAPPED","DOES_CONTAIN_TIBERIUM",
"IS_BEING_HARVESTED","NO_REFUND","SHIELDBODY_ENABLED","HEALTH_PERCENT_0","HEALTH_PERCENT_25","HEALTH_PERCENT_50",
"HEALTH_PERCENT_75","HEALTH_PERCENT_100","WEAPON_UPGRADED_01","WEAPON_UPGRADED_02","WEAPON_UPGRADED_03","COMBINED_PARENT",
"COMBINED_CHILD","COMBINED_ATTACHED","LOADED_FROM_MAP","ATTACKING_GARRISONED_STRUCTURE","EXITING_COMBINED","DELAYED_ENTER_STRUCTURE",
"DOCKING","HARVESTING","BRIDGE_IMPASSABLE","POWERED_DOWN_EMP","FORCE_ATTACKING","FORCE_ATTACK_MOVING",
"SCARED_CIVILIAN_CAR","USER_PARALYZED","BOOBY_TRAP_EXPLODE","IS_ENGAGED","CARRYING_FLAG","IS_MOVING_TO_RALLY_POINT",
"SPECIAL_ARMOR_ACTIVE","AIRCRAFT_IGNORE_SAMEPLAYER_HANGAR_RULE","NEXT_MOVE_IS_FORCE_ATTACK_MOVE","SPECIALABILITY_ACTIVE","CAN_STEALTH_FROM_PRODUCER","GARRISON_CAN_STEALTH",
"CAN_ATTACK_WHILE_STEALTHED","RESET_GOAL_POSITION","RIFT_OCCUPIED","WATER_LOCOMOTOR_ACTIVE","GROUND_LOCOMOTOR_ACTIVE","AIR_LOCOMOTOR_ACTIVE",
"UNPACKING","OVER_WATER","CONTAINER_OCCUPIED","PLACED_BY_PLAYER","DEFLECT_INCOMING_FIRE","DEPART_FROM_BOARDING",
"WAITING_FOR_BOARDING","HAS_SECONDARY_DAMAGE","IS_BEING_DRAGGED","CLEARED_FOR_LANDING","VEHICLE_ATTACHED","PARKED_AT_AIRFIELD",
"IN_SHIELD_SPHERE","HIT_SHIELD_SPHERE","NON_AUTOACQUIRABLE","CHARGING_WEAPON","OVERCHARGING_WEAPON","ENABLE_TRACER_DRAW",
"PREEMPT_PRE_ATTACK","LINE_SEGMENT_DAMAGE_ACTIVE","ADVANCED_MISSILE_PACKS","LEECHED_TARGET_ACTIVE","PLAYER_POWER_1","PLAYER_POWER_2",
"PLAYER_POWER_3","PLAYER_POWER_4","PLAYER_POWER_5","GRAPPLE_UPDATE_ACTIVE","SHROUD_REVEAL_TO_ALL","SURFACED",
"SUBMERGED","SKIRMISH_AI_DO_NOT_ATTACK","SKIRMISH_AI_DO_NOT_TAKE","TRANSFORMATION_TOGGLE_STATE","REPAIR_ALLIES_WHEN_IDLE","DO_NOT_AVOID_TALLBUILDING",
"ABSORBED_DAMAGE","NO_BRIBE","IGNORING_POWER_DOWN","EXCEEDED_PATH_NEIGHBOR_COUNT","CANNOT_LAND_AT_AIRFIELD","WALL_SEGMENT",
"IMMUNE_TO_BARK","UNDER_RUSH_ATTACK","UNDER_FROZEN","LANDING_IN_PROGRESS","UNDER_IRON_CURTAIN","EXPLOSIVES_ATTACHED",
"EXPLOSIVES_DETONATING","LIFTED_INTO_AIR","IN_NANOHIVE","SURFACED_IMMOBILE","BROADCASTING_INVISIBILITY","SCRAMBLED",
"MAGNETIZED","RIOT_SHIELDED","POINT_DEFENSE_DRONE_ATTACHED","GRAPPLE_UPDATE_BEING_MOVED","TARGETED_FOR_REPAIR","IN_SPIDER_HOLE",
"ANTI_GARRISON"}

ModelStateTable={
"INVALID","TOPPLED","FRONTCRUSHED","BACKCRUSHED","DAMAGED","REALLYDAMAGED","RUBBLE",
"POST_RUBBLE","POST_COLLAPSE","DECAY","DESTROYED_WHILST_BEING_CONSTRUCTED","COLLAPSING","SOLD","STRUCTURE_UNPACKING",
"SPECIAL_DAMAGED","NIGHT","SNOW","FREEFALL","PARACHUTING","PARACHUTE_LAND","LAUNCHED",
"GARRISONED","INSIDE_GARRISON","WEAPONSET_VETERAN","WEAPONSET_ELITE","WEAPONSET_HERO","WEAPONSET_PASSENGER_TYPE_ONE","WEAPONSET_PASSENGER_TYPE_TWO",
"WEAPONSET_PLAYER_UPGRADE","WEAPONSET_TOGGLE_1","WEAPONSET_TOGGLE_2","WEAPONSET_TOGGLE_3","WEAPONSET_SPECIAL_UPGRADE","WEAPONSET_GARRISONED","WEAPONSET_CLOSE_RANGE",
"WEAPONSET_CONTESTING_BUILDING","WEAPONSET_RIDER1","WEAPONSET_RIDER2","WEAPONSET_RIDER3","WEAPONSET_RIDER4","WEAPONSET_SPECIAL_ONE","WEAPONSET_SPECIAL_TWO",
"WEAPONSET_CONTAINED","WEAPONSET_MOUNTED","SWAPPING_TO_WEAPONSET_1","SWAPPING_TO_WEAPONSET_2","SWAPPING_TO_WEAPONSET_3","WEAPONSTATE_ONE","WEAPONSTATE_TWO",
"WEAPONSTATE_THREE","WEAPONSTATE_CLOSE_RANGE","WEAPONSTATE_CONTAINED","WEAPONSLOTID_01","WEAPONSLOTID_02","WEAPONSLOTID_03","WEAPONSLOTID_04",
"WEAPONSLOTID_05","SPECIAL_WEAPON_ONE","SPECIAL_WEAPON_TWO","SPECIAL_WEAPON_THREE","SPECIAL_WEAPON_FOUR","SPECIAL_WEAPON_FIVE","SPECIAL_WEAPON_SIX",
"DESTROYED_WEAPON","WEAPON_TOGGLING","ATTACKING","ATTACKING_STRUCTURE","ATTACKING_POSITION","ENGAGED","PREATTACK_A",
"PREATTACK_B","PREATTACK_C","PREATTACK_D","PREATTACK_E","FIRING_OR_PREATTACK_A","FIRING_OR_PREATTACK_B","FIRING_OR_PREATTACK_C",
"FIRING_OR_PREATTACK_D","FIRING_OR_PREATTACK_E","FIRING_A","FIRING_B","FIRING_C","FIRING_D","FIRING_E",
"FIRING_OR_RELOADING_A","FIRING_OR_RELOADING_B","FIRING_OR_RELOADING_C","FIRING_OR_RELOADING_D","FIRING_OR_RELOADING_E","RELOADING_A","RELOADING_B",
"RELOADING_C","RELOADING_D","RELOADING_E","BETWEEN_FIRING_SHOTS_A","BETWEEN_FIRING_SHOTS_B","BETWEEN_FIRING_SHOTS_C","BETWEEN_FIRING_SHOTS_D",
"BETWEEN_FIRING_SHOTS_E","USING_WEAPON_A","USING_WEAPON_B","USING_WEAPON_C","USING_WEAPON_D","USING_WEAPON_E","DOOR_1_OPENING",
"DOOR_1_CLOSING","DOOR_1_WAITING_OPEN","DOOR_1_WAITING_TO_CLOSE","DOOR_2_OPENING","DOOR_2_CLOSING","DOOR_2_WAITING_OPEN","DOOR_2_WAITING_TO_CLOSE",
"DOOR_3_OPENING","DOOR_3_CLOSING","DOOR_3_WAITING_OPEN","DOOR_3_WAITING_TO_CLOSE","DOOR_4_OPENING","DOOR_4_CLOSING","DOOR_4_WAITING_OPEN",
"DOOR_4_WAITING_TO_CLOSE","DOOR_HELIPAD_OPENING","DOOR_HELIPAD_CLOSING","DOOR_HELIPAD_WAITING_OPEN","DOOR_HELIPAD_WAITING_TO_CLOSE","PARKINGPLACE_1_DOOR_OPENING","PARKINGPLACE_1_DOOR_OPEN",
"PARKINGPLACE_1_DOOR_CLOSING","PARKINGPLACE_1_DOOR_CLOSED","PARKINGPLACE_2_DOOR_OPENING","PARKINGPLACE_2_DOOR_OPEN","PARKINGPLACE_2_DOOR_CLOSING","PARKINGPLACE_2_DOOR_CLOSED","PARKINGPLACE_3_DOOR_OPENING",
"PARKINGPLACE_3_DOOR_OPEN","PARKINGPLACE_3_DOOR_CLOSING","PARKINGPLACE_3_DOOR_CLOSED","PARKINGPLACE_4_DOOR_OPENING","PARKINGPLACE_4_DOOR_OPEN","PARKINGPLACE_4_DOOR_CLOSING","PARKINGPLACE_4_DOOR_CLOSED",
"PARKINGPLACE_HELIPAD_DOOR_OPENING","PARKINGPLACE_HELIPAD_DOOR_OPEN","PARKINGPLACE_HELIPAD_DOOR_CLOSING","PARKINGPLACE_HELIPAD_DOOR_CLOSED","MOVING","DYING","DYING_WASMOVING",
"DYING_WASATTACKING","WANDER","WALKING","CHARGING","MOVING_OUT_OF_THE_WAY","RUNNING_OFF_MAP","COMING_OUT_OF_FACTORY",
"ATTACK_MOVING","DIVING","SWOOPING","MARCHING","BACKING_UP","CLIMBING","RAPPELLING",
"WADING","SWIMMING","SCALING_WALL","SCALING_WALL_HORDE","FLYING","TAKING_OFF","LANDING",
"AWAITING_CONSTRUCTION","PARTIALLY_CONSTRUCTED","ACTIVELY_BEING_CONSTRUCTED","UNIT_ACTIVELY_BEING_CONSTRUCTED","ACTIVELY_CONSTRUCTING","RADAR_EXTENDING","RADAR_UPGRADED",
"PANICKING","AFLAME","SMOLDERING","BURNED","BURNT_MODEL","BURNT_TEXTURE","BURNINGDEATH",
"DOCKING","DOCKING_BEGINNING","DOCKING_ACTIVE","DOCKING_RETURN","DOCKING_MOVEBACK","DOCKING_FILL","DOCKING_EXTRACT",
"DOCKING_ENDING","DOCKING_PRE_DOCK","HARVEST_PREPARATION","HARVEST_ACTION","CARRYING","PASSENGER","TRANSPORT_MOVING",
"TRANSPORT_STOPPED","SIEGE_CONTAIN","JETAFTERBURNER","JETEXHAUST","PACKING","PREPARING","UNPACKING",
"PACKING_TYPE_1","PACKING_TYPE_2","PACKING_TYPE_3","PACKING_TYPE_4","PACKING_TYPE_5","PACKING_TYPE_6","OVER_WATER",
"POWER_PLANT_UPGRADED","POWER_PLANT_UPGRADING","BUILD_PLACEMENT_CURSOR","PHANTOM_STRUCTURE","FORMATION_PREVIEW","WORLD_BUILDER","DEBUG",
"START_CAPTURE","CANCEL_CAPTURE","CAPTURING","CAPTURED","RAISING_FLAG","CONTINUOUS_FIRE_SLOW","CONTINUOUS_FIRE_MEAN",
"CONTINUOUS_FIRE_FAST","PREORDER","SPECIAL_CHEERING","IMPENDING_DOOM","EATING","STUNNED_FLAILING","STUNNED",
"STUNNED_STANDING_UP","SPLATTED","THROWN_PROJECTILE","ABOUT_TO_HIT","EXPLODED_FLAILING","EXPLODED_BOUNCING","ACCELERATE",
"DECELERATE","TURN_LEFT","TURN_RIGHT","TURN_LEFT_HIGH_SPEED","TURN_RIGHT_HIGH_SPEED","DESTROYED_FRONT","DESTROYED_RIGHT",
"DESTROYED_BACK","DESTROYED_LEFT","WEAPONLOCK_PRIMARY","WEAPONLOCK_SECONDARY","WEAPONLOCK_TERTIARY","WEAPONLOCK_QUATERNARY","WEAPONLOCK_QUINARY",
"DEATH_1","DEATH_2","DEATH_3","DEATH_4","DEATH_5","SELECTED","GUARDING",
"LEVELED","MOUNTED","RESURRECTED","ATTACHED","DRAFTED","FLOODED","LOADED",
"DEPLOYED","JUST_BUILT","BASE_BUILD","REACT_1","REACT_2","REACT_3","REACT_4",
"REACT_5","REACT_6","HIT_REACTION","HIT_LEVEL_1","HIT_LEVEL_2","HIT_LEVEL_3","AIM_HIGH",
"AIM_STRAIGHT","AIM_LOW","AIM_NEAR","AIM_FAR","USER_1","USER_2","USER_3",
"USER_4","USER_5","USER_6","USER_7","USER_8","USER_9","USER_10",
"PASSENGER_VARIATION_1","PASSENGER_VARIATION_2","PASSENGER_VARIATION_3","PASSENGER_VARIATION_4","PASSENGER_VARIATION_5","SPECIAL_POWER_1","SPECIAL_POWER_2",
"SPECIAL_POWER_3","SPECIALPOWER1_READY","SPECIALPOWER2_READY","SPECIALPOWER3_READY","SPECIALPOWER4_READY","SPECIALPOWER5_READY","SPECIALPOWER6_READY",
"SPECIALPOWER7_READY","SPECIALPOWER8_READY","SPECIALPOWER9_READY","USING_SPECIAL_ABILITY","DEFLECT_SPECIAL_POWER","RIDER1","RIDER2",
"RIDER3","RIDER4","RIDER5","RIDER6","RIDER7","RIDER8","RIDERLESS",
"HORDE_EMPTY","PRIMARY_FORMATION","ALTERNATE_FORMATION","CAPTURE_100","CAPTURE_75","CAPTURE_50","CAPTURE_25",
"CAPTURE_0","DISGUISED","HIDDEN","INVISIBLE_STEALTH","INVISIBLE_CAMOUFLAGE","PRONE","COVER",
"SUPPRESSED","TURRET_ANGLE_0","TURRET_ANGLE_90","TURRET_ANGLE_180","TURRET_ANGLE_270","TURRET_ROTATE","ARMORSET_VETERAN",
"ARMORSET_ELITE","ARMORSET_HERO","ARMORSET_WEAK_VERSUS_BASEDEFENSES","ARMORSET_ALTERNATE_FORMATION","ARMORSET_MOUNTED","ARMORSET_PLAYER_UPGRADE","ARMORSET_PLAYER_UPGRADE_2",
"ARMORSET_PLAYER_UPGRADE_3","ARMORSET_UNBESIEGEABLE","UPGRADED_ARMOR","EMOTION_TAUNTING","EMOTION_DOOM","EMOTION_POINTING","EMOTION_GUNG_HO",
"EMOTION_LOOK_TO_SKY","EMOTION_CELEBRATING","EMOTION_AMUSED","EMOTION_MORALE_HIGH","EMOTION_MORALE_LOW","EMOTION_COWER","EMOTION_DISSIDENT",
"EMOTION_UNCONTROLLABLY_AFRAID","EMOTION_BRACE_FOR_BEING_CRUSHED","EMOTION_CHEER_FOR_ABOUT_TO_CRUSH","EMOTION_ALERT","EMOTION_AFRAID","EMOTION_TERROR","EMOTION_PANIC",
"INVULNERABLE","SPECIAL_ENEMY_NEAR","UNCONTROLLABLE","LEASHED_RETURNING","SAIL_FLAPPING","SAIL_BLOWN_RIGHT","SAIL_BLOWN_LEFT",
"BUILD_VARIATION_ONE","BUILD_VARIATION_TWO","PARALYZED","AFFECTED_BY_EMP","UNDERPOWERED","TIBERIUM_CRYSTAL_TYPE1","TIBERIUM_CRYSTAL_TYPE2",
"TIBERIUM_CRYSTAL_TYPE3","TIBERIUM_CRYSTAL_TYPE4","TIBERIUM_CRYSTAL_TYPE5","TIBERIUM_GROWING","MARKED_FOR_HUNT_TACTIC","MARKED_FOR_NO_SKIRMISH_RECRUIT","LOCOMOTOR_NORMAL_UPGRADED",
"LOCOMOTOR_FREEFALL","LOCOMOTOR_WANDER","LOCOMOTOR_PANIC","LOCOMOTOR_TAXIING","LOCOMOTOR_SUPERSONIC","LOCOMOTOR_MOUNTED","LOCOMOTOR_ENRAGED",
"LOCOMOTOR_SCARED","LOCOMOTOR_CONTAINED","LOCOMOTOR_COMBO","LOCOMOTOR_COMBO2","LOCOMOTOR_COMBO3","LOCOMOTOR_WALL_SCALING","LOCOMOTOR_CHANGING_FIRINGARC",
"LOCOMOTOR_BURNINGDEATH","USING_COMBO_LOCOMOTOR","MONEY_STORED_AMOUNT_1","MONEY_STORED_AMOUNT_2","MONEY_STORED_AMOUNT_3","MONEY_STORED_AMOUNT_4","VEHICLE_CRUSH_LEFT",
"VEHICLE_CRUSH_RIGHT","VEHICLE_CRUSH_CENTER","HEALTH_PERCENT_0","HEALTH_PERCENT_25","HEALTH_PERCENT_50","HEALTH_PERCENT_75","HEALTH_PERCENT_100",
"COMBINED_PARENT","COMBINED_CHILD","REPAIRING_DISABLED","WALL_SEGMENT","SHRINK_EFFECT","HIGH_TECH_EFFECT","AIR_POWER_EFFECT",
"PLAYER_POWER_1","BEING_MAULED","FROZEN","IRONCURTAIN","CHRONORIFT","INFILTRATED_DISABLE","INFILTRATED_RADAR_FREEZE",
"INFILTRATED_STEAL_MONEY","INFILTRATED_VISION","INFILTRATED_ENERGY","INFILTRATED_RESET","INFILTRATED_VISION_UNITS","WEAPONSLOTID_06","WEAPONSLOTID_07",
"WEAPONSLOTID_08","WEAPONSLOTID_09","WEAPONSLOTID_10","BUILD_PLACEMENT_HINT","DEATH_6","DEATH_7","DEATH_8",
"DEATH_9","DEATH_10","DEATH_11","DEATH_12","DEATH_13","DEATH_14","DEATH_15",
"ALL","SUCKED_UP_HIGH"}



AIStrategicStateNamesTable={
"ScriptedHuntTactic","Hunt","AIState_A09_AlliedReactiveDefense","AI_State_J04_ReactiveDefense","AIState_A07_J01_Defense",
"BaseDefenseController","HarvesterController","BlankHarvesterController","AIState_A09_ReactiveDefense","AIState_S02_ReactiveDefense",
"AIState_A05_Japan03_WaterAttack2","SuddenTransportHarrassment","AIState_S03_Japan_Initial_Forces","AIState_S04_SovietCoCommander_V2Attack_A","AIState_A02_Soviet_ConventionDefenders",
"AIState_J05_UnPack_Barracks","SovietStealthDetector","AIState_J06_Tanya_ProtectMediaCenter01","AIState_S01_DefendFortress01","AlliedCaptureVehicleHealTech",
"AIState_J05_Allied_AircraftCarrier_Structure_EASY","AIState_J07_AlliedParatroopers_Hive_B","SpecialForces_SupportAttack","AIState_J08_JapanLandAttack","AIState_A09_Migs",
"AIState_A09_StatueBase_Apollo_Attack","LandDefense","AIState_A07_J02_ScoutInf","AIState_J07_AlliedParatroopers_Hive_A","AIState_A08_KirovAirHinds01",
"AIState_A08_CryocopterSupport01","SovietCaptureVehicleHealTech","AIState_J07_CaptureOutpost02","AIState_A08_KLFDefense04","AIState_J05_Allied_AircraftCarrier_Structure",
"AIState_A07_P2B_Attack","AIState_A04_SinkShipS01","AIState_A06_President_ProtectFireBase","FighterAircraft_MEDIUM","AIState_J05_Allied_Fighter_Escort",
"AIState_A07_J02_Land_Attack","CommandAssault_Gather_Land","AIState_S06_SovietCoCommander_AttackWesternBase","AIState_A06_President_P2CaptureAL","AIState_S05_Attack_TechLab_2_Right",
"AIState_J04_Unpack_MCV","AIState_S07_EmperorAttackEscort","AIState_A08_WaterBlockade02","AIState_A07_J06_Attack_Structure","JapanCaptureNonPriorityTech_BRUTAL",
"AIState_S03_Part2_ManCannonTeam_Idle","AIState_A06_President_P2CaptureTJ","AIState_S03_Part2_Infantry_Attack","AIState_J06_TanyaLandAttack","AIState_A08_KirovAirEscort05",
"AIState_T06_HOTSPOT_OBJ05","AIState_J04_JapanEggUnpacker","AIState_A06_President_GroundAttack01","AIState_J04_Unpack_WarFactory","AIState_S05_Attack_TechLab_1_Right_HARD",
"SovietCaptureNonPriorityTech_BRUTAL","AIState_J01_FollowPlayer_Transports","AIState_S02_EggsA","AIState_A04_MainBase_NavalAttack","AlliedExpansion_HARD",
"AIState_S02_Escape01","AIState_A06_President_GroundAttack02","AIState_J05_PowerCore_Rep_2","AIState_J06_Tanya_ProtectMediaCenter03","AIState_A05_Coop_FollowPlayerBombers",
"AIState_J06_TanyaWaterAttack","AIState_J08_SovietKrukov_Fighters","AIState_S07_CoopCaptureTech","SovietCaptureNonPriorityTech_HARD","AIState_A08_ClearExpansion",
"AIState_S05_HeavyAntiNavy_EASY","ShockSpecialist_HitAndRun_Water_MEDIUM","LandEmergencyDefense","AIState_A09_StatueBase_Riptides_Attack_Player1","AIState_S06_CoopCaptureTech",
"AIState_S07_CoopLandDefense","BalancedAttackGround_MEDIUM","AIState_A08_KirovAirHinds04","AIState_J05_Allies_Attack","AIState_J01_JapanCaptureHospital",
"AlliedCaptureTech_MEDIUM","AIState_A08_KirovAirEscort01","AIState_J09_InitialAttack","AIState_A05_Onis","AIState_S05_Attack_TechLab_1_Left",
"AIState_S05_HOTSPOT_ManCannoneers_NavyBase","AIState_J04_AI1_Phase3_BaseAttack","AIState_S02_EggsB","AIState_S02_Garrison","AlliedTransportAttack",
"AIState_A04_LandBase_AmphibiousAttack","AIState_J04_Unpack_NavalYard","SovietCaptureTech","BalancedAttackOverwhelm","JapanTransportAttack",
"AIState_S02_Hotspot02","EscortMCV","AlliedCaptureWaterHusks","AIState_A07_J02_Attack_B","AIState_J01_JapanCaptureBarracks01",
"AIState_A08_LandDefense","SovietTransportAttack","AIState_S03_Part2_FollowPlayer_NormalUnits","AIState_S03_Japan_Blockade_2","AIState_A06_President_ProtectFireBase_Air",
"AIState_J01_FollowPlayer_Water","AIState_S02_Hotspot01","AIState_J06_JapanCaptureMediaCenter01","AIState_J06_JapanCaptureMediaCenter03","WaterEmergencyDefense_EASY",
"AIState_A09_MigAttack","WaterDefense","CommandAssault_Gather_Water","AirMarshall_SiegeHarrassment","AIState_J06_JapanCaptureMediaCenter04",
"AIState_J06_JapanCaptureLAX","AlliedScout","AIState_A08_KLFAssault02","AIState_S09_StatueBase_InfantryAttacks","SovietCaptureTech_MEDIUM",
"AirMarshall_KirovRaid","AIState_A04_FollowTanya01","AIState_S05_Attack_TechLab_1_Left_HARD","AIState_S02_EggsC","AIState_A08_KLFDefense02",
"AIState_J06_TanyaLandAttack2","AIState_A06_President_P2CaptureGW","AIState_A03_Soviet02_BaseDefense","JapanExpansion_HARD","AIState_A06_ProtectThePresident",
"AIState_A07_J04_Water_Attacks","AIState_A07_J03_Transport_Attack","AIState_J03_Coop_Attack_Water","JapanExpansion_MEDIUM","AIState_A09_KirovAttack",
"AIState_A01_CoopGarrisons","SovietScout","AIState_S03_Part2_Infantry_Idle","AIState_S05_Attack_TechLab_2_Left","WaterEmergencyDefense_MEDIUM",
"AIState_J04_AI1_Phase2_BaseAttack","AIState_J05_UnPack_SuperWeapon","AIState_S03_Japan_Harvester_Assault","AttachedBurstDroneRemoval","AIState_J09_Allied_LandDefense",
"LandEmergencyDefense_EASY","ShockSpecialist_HitAndRun_Land","AIState_A08_KirovAirEscort02","AIState_A08_WaterExpansionHarass01","AIState_A08_KLFAssault04",
"AIState_A09_StatueBase_Destroyer_Attack","AIState_A08_CarrierDefense","AIState_S06_SovietCoCommander_AttackMainBase","LandDefense_Small","AIState_S03_Initial_Transports",
"AlliedAirDrop","AIState_A09_Garrison","AIState_J06_TanyaCaptureMediaCenter02","AIState_J06_TanyaCaptureMediaCenter03","AIState_S08_Coop_Ambush",
"AIState_S05_Attack_TechLab_2_Left_HARD","AIState_J01_JapanCaptureBarracks03","AIState_S05_HOTSPOT_ManCannoneers_Island03","AlliedExpansion","AIState_A09_CommandoDefense",
"AIState_A08_FighterScramble","AIState_J09_JapanCoCommander_AttackMainBase","JapanStealthDetector","AIState_A05_SovietCaptureGenerator02","AIState_A08_KLFDefense01",
"AIState_S06_SovietCoCommander_AttackKrukov","AIState_J02_JapanExpansion","AIState_A05_Japan03_WaterDefense","AIState_A07_J06_Bombard_Structure","AIState_J04_AI1_Phase4_BaseAttack",
"AIState_A09_TwinbladeAttack","AIState_A07_J02_Attack_A","AIState_J07_CaptureOutpost01","AIState_A03_Allied_APPAttackers_Escort","AIState_J01_JapanCaptureWarFactory02",
"SovietExpansion_HARD","Garrison","AIState_S03_Japan_Water_Attack","AIState_J07_CaptureOutpost03","AlliedExpansion_BRUTAL",
"AIState_LandDefense_Small","AlliedExpansion_MEDIUM","AIState_A05_SovietCaptureGenerator01","JapanCaptureTech_EASY","AIState_S03_Japan_Infantry_Guard_2",
"AIState_S03_Garrison","AIState_S04_Coop_LandDefense","AIState_S05_Shore_Attackers","AIState_A08_KLFAssault05","FleetCommand_NavyHarrassment",
"AIState_A08_KirovAirHinds03","AirMarshall_Scouts","JapanCaptureWaterHusks","AIState_J02_Escort_MCV","AIState_A02_LandDefense",
"AIState_J06_Tanya_ProtectMediaCenter04","TerrorDroneHarrassment_MEDIUM","AIState_J06_TanyaCaptureMediaCenter01","AIState_J03_MechaKing_Escort","AIState_S03_Japan_Expand_Defense",
"AIState_A04_LandBase_NavalAttack","FighterAircraftFlankAttack","AIState_A05_SovietExpandBase","AIState_A07_J02_Naval_Attack","AIState_A07_P2A_Amphibious_Attack",
"AIState_A05_Coop_FollowPlayerCarriers","JapanEggUnpacker","AIState_A07_P2B_SiegeTeam_Escort","AIState_J05_MCVHunt_MCVs","AirMarshall_KirovEscort",
"LandDefense_EASY","AIState_A05_Japan03_Defense","AIState_J09_JapanCoCommander_DefendMCV","AIState_S03_FinalObjective","AIState_A07_CommandAssault_Land",
"CommandHold_Water","AIState_S05_HOTSPOT_ManCannoneers_Island02","AIState_J02_Soviet_Statue_Guard_A","AIState_J04_AttackFighterAircraft_Phase3","ShockSpecialist_HitAndRun_Water",
"AIState_A09_FollowPlayer01","AIState_A07_J01_Attack","AIState_A08_OverwhelmAttack","AIState_J02_Soviet_Statue_Guard_B","AIState_J06_Tanya_ProtectMediaCenter02",
"AIState_S01_DefendSouth01","JapanExpansion_BRUTAL","AIState_J08_JapanGuardMechaKing","AIState_A07_J03_Attack","ScoutInfantry",
"LandDefense_Small_EASY","AIState_J04_AI1_Additional_ConYard","AIState_S04_SovietCoCommander_DefendMCV","Garrison_EASY","AIState_J05_Allied_CarrierEscort",
"JapanCaptureTech_MEDIUM","AlliedInfiltration","SovietExpansion_BRUTAL","Command_StrikeTarget_Land","AIState_S08_Allied_Attack_Amphibious",
"AIState_S03_Japan_AntiInfantryVehicle","AIState_S06_Coop_DreadnaughtDefense","AIState_J04_AI1_BomberEscort","AIState_J09_JapanCoCommander_AttackSovietBase","AIState_J05_Allied_Amphib_Attack_Simple_3",
"FleetCommand_LandAttack","AIState_S03_Japan_FinalDefense","AIState_A04_MainBase_InfantryAttack","LandDefense_MEDIUM","ExpansionEscort",
"AIState_A08_KLFDefense03","AIState_S06_SovietCoCommander_AttackEasternBase","WaterDefense_Small_EASY","AIState_A06_MainAttack","AIState_J06_JapanLandAttack",
"AIState_S03_Japan_Infantry_Guard_3","AIState_S02_FollowPlayer01","AIState_A07_J01_TatsuFleet_Escort","AIState_S05_Recap_TechLab","AIState_A07_J02_Amphib_Attack",
"AIState_J05_Allied_Amphib_Attack_Simple_1","AIState_S05_HeavyAntiNavy","AIState_A05_Japan03_AmphAttack","SovietCaptureWaterHusks","AIState_A08_AirAttack",
"AIState_J09_LandAttack","SovietExpansion_MEDIUM","JapanCaptureTech","AIState_A07_P2A_Expansion","BalancedDefense",
"VindicatorDefense","JapanEggUnpacker_AllowNearConyard","AIState_J04_Aggressive_Water_End","AIState_A08_KirovAirHinds02","AIState_S08_SovietExpansion",
"BalancedAttackOverwhelm_MEDIUM","SickleHarrassment_MEDIUM","AIState_S08_SovietVolcanoBase_BombGuard","AIState_S04_Soviet_BankCapture_A","AIState_J08_Coop_CaptureTech",
"JapanCaptureNonPriorityTech_HARD","AIState_A08_TransportAttack","AIState_J04_BaseDefenseEggs_3-5","AIState_A09_FinalObjectiveAttack","AIState_S07_FollowP1",
"CaptureLandHusks","AIState_S05_AC_Escort","AIState_J01_FollowPlayer_Land","WaterDefense_Small","AIState_J07_CaptureOutpost04",
"AlliedStealthDetector","AIState_A04_MainBase_LandAttack","Optimal_EASY","AIState_A08_KirovAirHinds05","AIState_S09_Invasion",
"AIState_J05_UnPack_NavalYard","AIState_A09_Garrison02","AIState_A08_Expansion01","AIState_A07_J01_TatsuFleet_AttackWater","AIState_S02_Commando",
"AIState_S03_Part2_FollowPlayer_SiegeUnits","AIState_S09_FB_Garrison","AIState_J06_JapanCaptureMediaCenter02","AIState_S04_SovietCoCommander_V2Attack_B","AIState_A08_WaterBlockade01",
"AIState_A09_Coop_AirDefense","AIState_S03_Japan_Blockade_1","AIState_S05_HOTSPOT_Objective_4","AIState_S05_Attack_TechLab_2_Right_HARD","AIState_A04_Soviet_Expansion",
"AIState_J07_FollowPlayer01","AIState_J04_AI1_Aircraft_Carrier_Escort","AIState_S05_WaterDefense","AIState_J08_Coop_LandDefense","CommandAssault_Land",
"LandDefense_Small_MEDIUM","AIState_S07_JapanLandDefense","LandEmergencyDefense_MEDIUM","AIState_J05_JapanEggUnpacker","AIState_J04_AttackFighterAircraft_Phase2",
"AIState_A08_KirovAirEscort04","AIState_A06_President_AirAttack02","AlliedCaptureNonPriorityTech_HARD","AIState_A02_CoopExpansion","AIState_A08_KirovAirEscort03",
"WaterDefense_EASY","AlliedCaptureNonPriorityTech_BRUTAL","AIState_J05_UnPack_Warfactory","SovietCaptureTech_EASY","AIState_J05_PowerCore_Rep_1",
"AIState_A09_FighterAttack","AIState_A08_KLFAssault01","SpecialForces_MainAttack","AIState_J01_JapanCaptureWarFactory01","SovietExpansion",
"AlliedCaptureTech","AIState_S09_FB_VehicleAttacks","AIState_A09_FortBradley_Defenders","AIState_A02_Coop_TakeConventionCenter","AIState_A03_Soviet01_BaseDefense",
"AIState_S05_CoopDefendTechLab","CommandHold_Land","AIState_A07_J06_Harbor_Blockade","AIState_A09_ApolloDefense","AIState_J09_JapanCoCommander_AttackAirBase",
"WaterDefense_Small_MEDIUM","AIState_A07_P2B_BaseDefense_StrikeTeam","AIState_A08_KLFAssault03","AIState_J01_JapanCaptureBarracks02","AIState_S06_SovietCoCommander_AttackParticleCannon",
"AIState_S04_AlliedGroundBase_DefendPort","AIState_J07_SovietManCannons","AIState_A09_WaterBlockade02","AIState_A06_Coop_Expansion","AIState_S03_Japan_Infantry_Guard_1",
"WaterEmergencyDefense","AIState_S09_FB_InfantryAttacks","AlliedCaptureTech_EASY","JapanExpansion","AIState_A09_WaterBlockade01",
"WaterDefense_MEDIUM","AIState_J04_Unpack_Barracks","AIState_S04_AlliedMainBase_TargetKrukov","AIState_A01_KillKirovs","AIState_A09_StatueBase_Riptides_Attack_Player2",
"AIState_A08_KLFDefense05","JapanCaptureVehicleHealTech","AIState_J06_TanyaCaptureMediaCenter04","AIState_S01_FollowPlayer01","AIState_J03_Coop_Attack_Krukov",
"AIState_S02_AttackPlayers","ShockSpecialist_HitAndRun_Land_MEDIUM","CratePickup","CommandAssault_Water","AIState_S05_Attack_TechLab_1_Right",
"AIState_S06_Coop_TanyaDefense","AIState_J04_BaseDefenseEggs_3-4","AIState_A07_J03_Garrison","Command_StrikeTarget_Water","AIState_S03_Initial_Infantry",
"AIState_S03_Japan_Expand_NavalYard","AIState_S06_AlliedSubBase_E_AirAttack_Smart","AIState_S04_SovietCoCommander_MainAttack","AIState_J04_AI1_WaterAttacks","AIState_A04_NavalBase_NavalAttack",
"AIState_S06_SovietCoCommander_DefaultAttack","AIState_A02_Coop_DestroySovietBase","AIState_A07_J01_TatsuFleet_Battleships","AIState_J07_SovietBigNavyPatrol","BalancedCleanup",
"AIState_S06_AlliedMainBase_SimpleAttack_Water_HARD","AIState_S07_JapanLandAttack3","AIState_A07_P2A_RepelInvaders","GrowingAttacks_Water","AIState_S04_Krukov_MainAttack",
"AIState_J04_Aggressive_Land","AIState_S04_AlliedGroundBase_SimpleAttack_Ground_HARD","AIState_J05_Allied_Water_Attack_Simple_EASY","AIState_J02_Coop_Attack","AIState_S03_Part2_ManCannon_WP_2",
"AirMarshall_Attack_Land_MEDIUM","ACVHarrassment","AlliedCapturePriorityTech_HARD","AIState_J05_Allied_Bomber_PowerCore","AIState_A07_P2A_Water_Attack",
"AIState_S06_AlliedMainBase_SimpleAttack_Water_EASY","AIState_S04_AlliedGroundBase_SimpleAttack_Water_HARD","AIState_A09_TeslaAttack01","AIState_S09_Terror","AIState_J04_AI1_WaterAttacks_Phase3",
"AIState_A09_GroundAttacks","AIState_S04_AlliedMainBase_SimpleAttack_Water_MEDIUM","AIState_S04_AlliedGroundBase_SimpleAttack_Ground_MEDIUM","AIState_J09_SovietScientist_SimpleAttackLarge","ExpansionDefense",
"AIState_J07_AlliedAmphibiousAttack_MEDIUM","AIState_J04_Defend_Harbors","AIState_J03_Coop_CaptureTech","Cleanup","AIState_A07_FighterAircraftSimpleAttack",
"AIState_A09_CommandoAttack","AIState_J05_Allied_Vindicator_Attack_PowerCores","AIState_A03_Soviet_TankRush_Late","AIState_S05_AntiNavy_EASY","AIState_J09_AlliedSubBase_SimpleAttack_Ground_HARD",
"AIState_A09_StatueBase_Carrier_Attack","AIState_S06_AlliedMainBase_AirAttack_Smart","AIState_J05_Allied_Amphib_Attack_Simple_2","AIState_J07_AlliedAmphibiousAttack_HARD","EngineerIdle",
"JapanScout","AIState_S08_AlliedFighters","AIState_J07_AlliedCaptureAttempt","AIState_J07_AlliedWaterAttack_MEDIUM","AIState_S04_AlliedMainBase_SimpleAttack_Ground_MEDIUM",
"ScoutAircraft","AIState_S06_AlliedSubBaseW_WaterAttack_MEDIUM","AIState_S04_AlliedMainBase_SimpleAttack_Ground_HARD","AIState_A03_Soviet_TankRush_Early","AIState_S06_AlliedMainBase_SimpleAttack_Ground_EASY",
"AIState_A09_TeslaAttack02","AIState_J07_SovietKirovRaid","JapanCapturePriorityTech_HARD","AIState_S01_KillWarriors01","AIState_J08_Soviet_BridgeRepair_North",
"AIState_J09_JapanCoCommander_AttackParticleCannons","AIState_J04_AI1_AssaultAircraft","AIState_A03_Soviet_EarlyInfantryAttackers","SpecialForces_WaterPatrol","AIState_J09_AlliedSubBase_SimpleAttack_Ground_EASY",
"AIState_S06_AlliedMainBase_SimpleAttack_Ground_MEDIUM","AIState_S09_CoCommander_WaterAttack","AIState_J05_Allied_Water_Attack_Simple","AIState_J03_Coop_Secure_Expansion_A","SquardonLeader_Attack_Land_MEDIUM",
"Cleanup_BRUTAL","AIState_A04_Hotspot1_Attack","AIState_S05_AntiNavy","AIState_S07_JapanLandAttack","SquardonLeader_Attack_Land",
"TenguHarrassment","AIState_S05_Anti_Navy","AIState_S09_Kirov","AIState_A04_CoopAttack_Land","AIState_J09_AlliedMainBase_SimpleAttack_Ground_EASY",
"AIState_S08_SovietVolcanoBase_Artillery","AIState_J02_Soviet_BaseDefense","AIState_A02_Soviet_EconomyAttackers","AIState_S06_AlliedMainBase_SimpleAttack_Ground_HARD","AIState_S03_Part2_Boat_Attack",
"AIState_A05_Japan03_ProtectGenerators","BalancedAttackGround_EASY","AIState_J07_AlliedAmphibiousAttack_EASY","AIState_A09_Apocs","AIState_J09_AlliedMainBase_SimpleAttack_Ground_HARD",
"SickleHarrassment","AIState_J07_JapanNavalAttack","AIState_A04_CoopAttack_Water","AIState_J03_Coop_Secure_Expansion_B","AIState_S04_AlliedMainBase_SimpleAttack_Water_HARD",
"AIStates_S06_Krukov_KirovAttack","GrowingAttacks_Water_MEDIUM","AIState_A01_GroundHunt","AirMarshall_Attack_Water","AIState_S06_Krukov_NavalAttack",
"GrowingAttacks_Land_MEDIUM","AIState_A02_Soviet_EarlyTankRush","AIState_J07_AlliedWaterAttack_HARD","AirHunt","AIState_A08_LandAttack",
"SovietCapturePriorityTech_BRUTAL","CommandoController","AIState_J09_AlliedMainBase_SimpleAttack_Ground_MEDIUM","AIState_S05_CenturyBombers","CommandAssault_BomberAircraft",
"AIState_S06_AlliedSubBase_E_AirAttack_Simple","AIState_J02_Soviet_Aircraft_Defense","AIState_J03_Coop_Attack_Land","Command_StrikeTarget_BomberAircraft","AIState_S06_AlliedMainBase_AirAttack_Simple",
"AIState_S08_SovietVolcanoBase_Vehicle","CommandAssault_FighterAircraft","AIState_J05_Allied_AircraftCarrier_PowerCore","AirMarshall_Attack_Land","KirovFlankAttack",
"AIState_J08_Soviet_BridgeRepair_South","AIState_A09_InfantryAttack01","BalancedAttackWater_MEDIUM","AIState_S03_Part2_Dreadnaught_Attack","TwinbladeHarrassment_EASY",
"JapanCapturePriorityTech_BRUTAL","AIState_J07_AlliedWaterAttack_EASY","AIState_J02_Soviet_Aircraft_Defense_Vanilla","AIState_A08_WaterAssault02","AIState_J05_Allied_AircraftCarrier_PowerCore_EASY",
"CommandHold_BomberAircraft","AIState_A05_Japan03_AirAttack","AIState_S04_AlliedMainBase_SimpleAttack_Water_EASY","AIState_J07_SovietCaptureAttempt","AIState_S06_AlliedMainBase_SimpleAttack_Water_MEDIUM",
"AIState_A02_Soviet_InfantryAttackers","AIState_S03_Japan_Infantry_Attack","AIState_A02_Soviet_Harass","AIState_A05_StartingGroup","AIState_A08_WaterHarassment01",
"AIState_J02_Soviet_BaseScouts","AIState_S06_AlliedMainBase_SimpleAttack_Water_AircraftCarrier","AIState_A09_VehicleAttack01","AIState_S08_SovietVolcanoBase_Infantry","GrowingAttacks_Land",
"BalancedAttackGround","AIState_J09_SovietScientist_SimpleAttackSmall","AIState_A08_Harassment","AIState_J07_SovietAttackNavyBases","SovietCapturePriorityTech_HARD",
"VindicatorAttack_EASY","AirMarshall_Attack_Water_MEDIUM","FighterAircraftSimpleAttack","KirovAttack","AIState_J05_Defend_Cores",
"AIState_S04_AlliedGroundBase_SimpleAttack_Ground_EASY","VindicatorAttack_MEDIUM","AIState_S04_AlliedMainBase_SimpleAttack_Ground_EASY","FleetCommand_RocketAngelSupport","GroundHunt",
"AIState_J09_AlliedSubBase_SimpleAttack_Ground_MEDIUM","AIState_A01_HOTSPOT_Coastal_Guns","AIState_A05_Japan03_WaterAttack","AIState_S04_AlliedGroundBase_SimpleAttack_Water_EASY","AIState_A07_J04_Attack_Air",
"AIState_A09_WaterAttack","AIState_S05_Vindicators","AIState_S08_Soviet_LandAttackers","AIState_J07_JapanLandAttack","AIState_S03_Part2_ManCannon_WP_3",
"AIState_S08_Allied_Attack_Water","VXHarrassment","AIState_S06_AlliedSubBaseW_WaterAttack_EASY","AIState_A02_Soviet_EarlyInfantryAttackers","AIState_J02_Soviet_Remnants",
"AIState_J03_Coop_Secure_Expansion_C","TanyaController","SquardonLeader_Attack_Water_MEDIUM","AIState_A09_Coop_LandAttack","AIState_A02_Soviet_TankRush",
"AIState_A01_Soviet_KirovAttack","AIState_A07_J04_Attack_Structure","AIState_J05_Allies_Defend_MCVs","JapanInfiltration","AIState_J08_JapanNavalAttack",
"AIState_A08_WaterAssault01","AIState_J05_MCVHunt_Units","AIState_J04_Aggressive_Water","AIState_S03_Initial_Attack_Boats","SquardonLeader_Attack_Water",
"AIState_A01_AttackInvaders","AIState_S08_AlliedParatroopers","AIState_S04_AlliedGroundBase_SimpleAttack_Water_MEDIUM","AIState_S07_JapanLandAttack2","AIState_A08_WaterHarassment02",
"BalancedAttackWater","AIState_S06_AlliedSubBaseW_WaterAttack_HARD","AlliedCapturePriorityTech_BRUTAL","AIState_S04_Soviet_CaptureRefinery","FleetCommand_NavyAttack",
"AIState_S03_Part2_ManCannon_WP_1","AIState_A05_LandAttack","AIState_J07_AlliedFighterAircraftDefense","AIState_S08_SovietVolcanoBase_Navy_Hunters","AIState_S08_Soviet_AirAssaults",
"AIState_J04_AI1_BonusObj1Capture","AIState_A08_KLFAssault","AIState_J08_JapanAntiKirov","AIState_J08_SovietEliteBase_Aircraft","AIState_J09_SovietScientist_AirAttack",
"AIState_S08_SovietVolcanoBase_FighterAircraft","AIState_J05_MCVHunt_RocketAngels","AIState_A09_Coop_WaterAttack","AIState_S08_SovietVolcanoBase_RimGuard","AIState_J04_Defend_Statues",
"AIState_S03_Japan_VehicleDefense","AIState_J07_AlliedVindicatorAttack","AIState_A05_NavalAttack","AIState_J09_WaterAttack","AIState_J05_Allied_Vindicator_Attack_Structures",
"AIState_S07_JapanNavalAttack","AIState_A07_VindicatorAttack_Closest","AIState_A06_President_CaptureControlRooms","AIState_S08_Soviet_Navy_BinghamAttack","AIState_A09_BomberAttack",
"AIState_S05_HeavyAntiStructureNavy","AIState_J04_FootHoldCreated_LandAttack","AIState_A07_P2B_SiegeTeam","AIState_S08_Soviet_Fighters","AIState_S08_Soviet_Navy_PremierAttack",
"TerrorDroneHarrassment","BalancedAttackWater_EASY","AIState_A09_AssaultAircraft","AIState_S07_LandAttack","VindicatorAttack_Closest",
"AIState_S08_SovietVolcanoBase_AssaultAircraft","AIState_S08_SovietVolcanoBase_Navy_Protectors","BalancedAttackAssaultAircraft","AIState_A06_President_VindicatorAttack","AIState_S03_Japan_Harvester_Attack",
"AIState_J07_AlliedShrinkFreezeSuprise","AIState_S07_NavalAttack","BombardmentShipAttack","AIState_J07_AlliedParatroopers","AIState_S07_EmperorAttack",
"IFVHarrassment","BalancedAttackBomberAircraft","AIState_J07_AlliedCenturyBomberAttack","AIState_A09_VindicatorAttack","AIState_J08_SovietFrontLine_Infantry",
"AIState_J05_Allied_Infantry","CommandHold_FighterAircraft","AIState_A04_Commando_Controller","AIState_J03_Aircraft_Attacks","TwinbladeHarrassment",
"AIState_A07_CenturyBomberAttack","AIState_J08_SovietEliteBase_Navy","AIState_J06_CenturyBomberAttack","AIState_J08_SovietKrukov_Vehicles","AIState_S08_Soviet_InfantryAttackers",
"AIState_J08_SovietHeavyBase_Vehicle","AIState_J02_Soviet_Aircraft_Attack_Vanilla","AIState_J02_Soviet_Infantry_Vanilla","AIState_J03_Infantry_Attacks","AIState_J03_Tank_Attacks",
"AIState_J02_Soviet_Aircraft_Attack","AIState_J07_SovietRelayStationGuards","AIState_J05_Allied_Bomber_Structure","AIState_J02_Soviet_Vehicles","AIState_J02_Soviet_Vehicles_Vanilla",
"AIState_J05_UnPack_BaseDefenseAdvanced","AIState_A03_Protect_Hydrofoils","AIState_J07_AlliedRelayStationGuards","AIState_S08_SovietVolcanoBase_LateAssault","AirMarshall_TwinbladeAttack",
"AIState_J02_Soviet_Infantry","AIState_J08_SovietKrukov_Kirovs","AIState_J03_Naval_Attacks","AIState_J08_SovietKrukov_Hinds","AIState_S02_Fight01",
"CenturyBomberAttack","AIState_J04_AI1_Assault_Statues_Inf","AIState_A08_KirovTakedown","AIState_J08_SovietKrukov_Dreadnoughts","AIState_J04_AI1_Phase4_HarborAttack",
"AIState_A08_KirovWaterEscort02","AIState_J04_AI1_Phase3_HarborAttack","AIState_J08_SovietKrukov_AABoats","AIState_A01_Defend_Points","AIState_A08_KirovTakedownAir",
"AIState_A08_KLFAllDefendKirovs01","AIState_A06_AlliedCaptureBase","VindicatorAttack","AIState_A08_KirovWaterEscort01","AIState_J04_AI1_Phase2_StatueAttack",
"AIState_S03_Japan_Expand_BaseDefense","AIState_S04_AlliedMainBase_CaptureBanks","AIState_A03_Allied_APPAttackers","SovietNavalBase","AIState_S04_Soviet_CaptureBanks",
"AlliedNavalBase","AIState_S04_AlliedGroundBase_CaptureBanks","AIState_J04_AI1_Aircraft_Carrier","RetreatMCVToLand","AIState_S07_PowerplantAttack",
"AIState_A09_LandObjectiveAttack","RetreatMCVToWater","AIState_J05_UnPack_BaseDefense","AIState_J04_AI1_BomberAircraft"}

AITacticTeamsTable={
"AlliedScout_DefenseAvoidanceAttack_0_0","AlliedStealthDetector_StaticDefense_0_0","ACVHarrassment_SimpleAttack_0_0","IFVHarrassment_SimpleAttack_0_0","AlliedCaptureWaterHusks_GarrisonBuilding_0_0",
"AlliedCaptureTech_Engineer_0_0","AlliedCaptureTech_EASY_Engineer_0_0","AlliedCaptureTech_MEDIUM_Engineer_0_0","AlliedCapturePriorityTech_HARD_Engineer_0_0","AlliedCaptureNonPriorityTech_HARD_Engineer_0_0",
"AlliedCapturePriorityTech_BRUTAL_Engineer_0_0","AlliedCaptureNonPriorityTech_BRUTAL_Engineer_0_0","AlliedCaptureVehicleHealTech_Engineer_0_0","AlliedExpansion_SimpleExpansion_0_0","AlliedExpansion_MEDIUM_SimpleExpansion_0_0",
"AlliedExpansion_HARD_SimpleExpansion_0_0","AlliedExpansion_BRUTAL_SimpleExpansion_0_0","AlliedInfiltration_DefenseAvoidanceAttack_0_0","AlliedTransportAttack_DefenseAvoidanceAttack_0_0","TanyaController_DefenseAvoidanceAttack_0_0",
"AlliedAirDrop_SimpleAttack_0_0","VindicatorDefense_SimpleAttack_0_0","VindicatorAttack_DefenseAvoidanceAttack_0_0","VindicatorAttack_MEDIUM_DefenseAvoidanceAttack_0_0","VindicatorAttack_EASY_SimpleAttack_0_0",
"VindicatorAttack_Closest_SimpleAttack_0_0","CenturyBomberAttack_DefenseAvoidanceAttack_0_0","AlliedNavalBase_SimpleExpansion_0_0","BalancedDefense_StaticDefense_0_0","BalancedAttackGround_DefenseAvoidanceAttack_0_0",
"BalancedAttackWater_DefenseAvoidanceAttack_0_0","BombardmentShipAttack_SimpleAttack_0_0","BalancedAttackOverwhelm_SimpleAttack_0_0","BalancedCleanup_SimpleAttack_0_0","BalancedAttackGround_MEDIUM_DefenseAvoidanceAttack_0_0",
"BalancedAttackWater_MEDIUM_DefenseAvoidanceAttack_0_0","BalancedAttackOverwhelm_MEDIUM_DefenseAvoidanceAttack_0_0","BalancedAttackGround_EASY_DefenseAvoidanceAttack_0_0","BalancedAttackWater_EASY_DefenseAvoidanceAttack_0_0","FighterAircraftSimpleAttack_SimpleAttack_0_0",
"FighterAircraftFlankAttack_DefenseAvoidanceAttack_0_0","FighterAircraft_MEDIUM_StaticDefense_0_0","BalancedAttackBomberAircraft_DefenseAvoidanceAttack_0_0","BalancedAttackAssaultAircraft_DefenseAvoidanceAttack_0_0","GrowingAttacks_Land_SimpleAttack_0_0",
"GrowingAttacks_Water_SimpleAttack_0_0","GrowingAttacks_Land_MEDIUM_SimpleAttack_0_0","GrowingAttacks_Water_MEDIUM_SimpleAttack_0_0","CommandAssault_Gather_Land_StaticDefense_0_0","CommandAssault_Gather_Water_StaticDefense_0_0",
"CommandAssault_Land_SimpleAttack_0_0","CommandAssault_Water_SimpleAttack_0_0","CommandAssault_FighterAircraft_SimpleAttack_0_0","CommandAssault_BomberAircraft_SimpleAttack_0_0","CommandHold_Land_StaticDefense_0_0",
"CommandHold_Water_StaticDefense_0_0","Command_StrikeTarget_Land_SimpleAttack_0_0","Command_StrikeTarget_Water_SimpleAttack_0_0","CommandHold_FighterAircraft_StaticDefense_0_0","CommandHold_BomberAircraft_SimpleAttack_0_0",
"Command_StrikeTarget_BomberAircraft_SimpleAttack_0_0","JapanScout_DefenseAvoidanceAttack_0_0","JapanStealthDetector_StaticDefense_0_0","TenguHarrassment_DefenseAvoidanceAttack_0_0","VXHarrassment_DefenseAvoidanceAttack_0_0",
"SuddenTransportHarrassment_DefenseAvoidanceAttack_0_0","JapanTransportAttack_DefenseAvoidanceAttack_0_0","JapanEggUnpacker_ExactExpansion_0_0","JapanEggUnpacker_AllowNearConyard_ExactExpansion_0_0","JapanCaptureWaterHusks_GarrisonBuilding_0_0",
"JapanCaptureTech_Engineer_0_0","JapanCaptureTech_EASY_Engineer_0_0","JapanCaptureTech_MEDIUM_Engineer_0_0","JapanCapturePriorityTech_HARD_Engineer_0_0","JapanCaptureNonPriorityTech_HARD_Engineer_0_0",
"JapanCapturePriorityTech_BRUTAL_Engineer_0_0","JapanCaptureNonPriorityTech_BRUTAL_Engineer_0_0","JapanCaptureVehicleHealTech_Engineer_0_0","JapanExpansion_ExactExpansion_0_0","JapanExpansion_MEDIUM_ExactExpansion_0_0",
"JapanExpansion_HARD_ExactExpansion_0_0","JapanExpansion_BRUTAL_ExactExpansion_0_0","JapanInfiltration_DefenseAvoidanceAttack_0_0","SovietScout_DefenseAvoidanceAttack_0_0","SovietStealthDetector_StaticDefense_0_0",
"SickleHarrassment_SimpleAttack_0_0","SickleHarrassment_MEDIUM_SimpleAttack_0_0","TerrorDroneHarrassment_DefenseAvoidanceAttack_0_0","TerrorDroneHarrassment_MEDIUM_DefenseAvoidanceAttack_0_0","TwinbladeHarrassment_DefenseAvoidanceAttack_0_0",
"TwinbladeHarrassment_EASY_SimpleAttack_0_0","KirovAttack_SimpleAttack_0_0","KirovFlankAttack_DefenseAvoidanceAttack_0_0","SovietTransportAttack_DefenseAvoidanceAttack_0_0","SovietCaptureWaterHusks_GarrisonBuilding_0_0",
"SovietCaptureTech_Engineer_0_0","SovietCaptureTech_EASY_Engineer_0_0","SovietCaptureTech_MEDIUM_Engineer_0_0","SovietCapturePriorityTech_HARD_Engineer_0_0","SovietCaptureNonPriorityTech_HARD_Engineer_0_0",
"SovietCapturePriorityTech_BRUTAL_Engineer_0_0","SovietCaptureNonPriorityTech_BRUTAL_Engineer_0_0","SovietCaptureVehicleHealTech_Engineer_0_0","SovietExpansion_SimpleExpansion_0_0","SovietExpansion_MEDIUM_SimpleExpansion_0_0",
"SovietExpansion_HARD_SimpleExpansion_0_0","SovietExpansion_BRUTAL_SimpleExpansion_0_0","SovietNavalBase_SimpleExpansion_0_0"
}

StringHashesTable={
["DDFC28DE"]="AlliedScoutInfantry",["139CBC97"]="AlliedAntiInfantryInfantry",["9C5D3BB8"]="AlliedAntiVehicleInfantry",["E1E9179B"]="AlliedEngineer",
["4AA5D515"]="AlliedInfiltrationInfantry",["53E0EB12"]="AlliedCommandoTech1",["12E7D7A4"]="JapanScoutInfantry",["FB02C55"]="JapanAntiInfantryInfantry",
["7D0549DD"]="JapanAntiVehicleInfantry",["20DBDFCC"]="JapanEngineer",["A768E216"]="JapanInfiltrationInfantry",["D81C1012"]="JapanAntiVehicleInfantryTech3",
["6586A5A0"]="JapanCommandoTech1",["33026FA1"]="SovietScoutInfantry",["19AB11AF"]="SovietAntiInfantryInfantry",["2C358C61"]="SovietAntiVehicleInfantry",
["A08AABD3"]="SovietEngineer",["3E11865D"]="SovietHeavyAntiVehicleInfantry",["174F874F"]="SovietCommandoTech1",["2A196E71"]="AlliedMiner",
["1C331EB6"]="AlliedAntiInfantryVehicle",["BB06395A"]="AlliedAntiAirVehicleTech1",["7B91527"]="AlliedAntiVehicleVehicleTech1",["D48ED838"]="AlliedAntiStructureVehicle",
["52BFE9C5"]="AlliedAntiVehicleVehicleTech3",["28DA574E"]="AlliedMCV",["92CDE50F"]="JapanMiner",["1791E072"]="JapanLightTransportVehicle",
["C3986ED4"]="JapanAntiInfantryVehicle",["CEB7DA1F"]="JapanAntiVehicleVehicleTech1",["6E8C5FFF"]="JapanAntiAirVehicleTech1",["90B81D3C"]="JapanAntiStructureVehicle",
["59908E62"]="JapanAntiVehicleVehicleTech3",["1C2EF767"]="JapanMCV",["F6DAC2A4"]="SovietMiner",["BB686AE1"]="SovietSurveyor",
["D741D327"]="SovietScoutVehicle",["60F0B4E9"]="SovietAntiInfantryVehicle",["CCBD2C91"]="SovietAntiAirShip",["94B3590B"]="SovietAntiVehicleVehicleTech1",
["821381DE"]="SovietAntiStructureVehicle",["9E45383C"]="SovietAntiVehicleVehicleTech3",["AF4C0DA5"]="SovietMCV",["B74F8348"]="AlliedAntiGroundAircraft",
["3C82B910"]="AlliedFighterAircraft",["509D5101"]="AlliedSupportAircraft",["83D5A86B"]="AlliedBomberAircraft",["40ACAD6D"]="SovietAntiGroundAircraft",
["7F54CED1"]="SovietFighterAircraft",["FFA811AE"]="SovietBomberAircraft",["8ACA3F75"]="AlliedAntiNavalScout",["2E211A99"]="AlliedAntiAirShip",
["5AE534FC"]="AlliedAntiNavyShipTech1",["9705D80"]="AlliedAntiStructureShip",["CEDA61FD"]="JapanNavyScoutShip",["B142DEC6"]="JapanAntiAirShip",
["1A2CA9AB"]="JapanAntiVehicleShip",["FC5E3314"]="JapanAntiStructureShip",["AFF62E78"]="SovietAntiNavyShipTech1",["8D0A384A"]="SovietAntiNavyShipTech2",
["BCEF51B9"]="SovietAntiStructureShip",["AF6B84FA"]="AlliedAttackDrone",["57F07A3A"]="JapanBarracksEgg",["2412FB82"]="JapanBaseDefenseAdvancedEgg",
["1F496B6B"]="JapanBaseDefenseEgg",["F0455D99"]="JapanNavalYardEgg",["C6B3F8AA"]="JapanPowerPlantEgg",["FF4A8B60"]="JapanRefineryEgg",
["5C1C0F0F"]="JapanSuperWeaponAdvancedEgg",["5FC93021"]="JapanSuperWeaponEgg",["78D3E32C"]="JapanTechStructureEgg",["A02E31D3"]="JapanWarFactoryEgg",
["75288D70"]="AlliedMiner_Naval",["4068B3D7"]="AlliedAntiInfantryVehicle_Ground",["648D1440"]="AlliedMCV_Naval",["E27A88A0"]="JapanMiner_Naval",
["BA8E535F"]="JapanAntiVehicleVehicleTech1_Naval",["D2ECDA2C"]="JapanMCV_Naval",["DDACA5DD"]="JapanAntiVehicleInfantry_Ambush",["951764B9"]="SovietMiner_Naval",
["92718B35"]="SovietSurveyor_Naval",["522BCB61"]="SovietAntiAirShip_Ground",["1545FAC2"]="SovietMCV_Naval",["61A093F6"]="AlliedConstructionYard",
["89B86E3D"]="AlliedPowerPlant",["509BD329"]="AlliedBarracks",["8ECE261C"]="AlliedRefinery",["8209C058"]="AlliedWarFactory",
["7848F598"]="AlliedNavalYard",["5B3008B7"]="AlliedAirfield",["CA9257EB"]="AlliedTechStructure",["C3040FF"]="AlliedOutpost",
["296799CF"]="AlliedWallPiece",["9435832"]="AlliedWallSegmentPiece",["EE3E07BD"]="AlliedBaseDefense",["69B62705"]="AlliedBaseDefenseAdvanced",
["FD87E82A"]="AlliedSuperWeapon",["95D6E965"]="AlliedSuperWeaponAdvanced",["356FA3A9"]="JapanConstructionYard",["309480DD"]="JapanPowerPlant",
["4F32965"]="JapanBarracks",["5D02B20C"]="JapanRefinery",["A689B39A"]="JapanWarFactory",["263DA9AF"]="JapanNavalYard",
["D20CC8DE"]="JapanTechStructure",["F8C50039"]="JapanWallPiece",["BF93CE00"]="JapanWallSegmentPiece",["89AE48EA"]="JapanBaseDefense",
["2D795EEA"]="JapanBaseDefenseAdvanced",["D6D22475"]="JapanSuperWeapon",["1AFC9A6E"]="JapanSuperWeaponAdvanced",["C16FF13F"]="SovietConstructionYard",
["CF8D9F20"]="SovietPowerPlant",["80D4EA1E"]="SovietBarracks",["C45AAEAB"]="SovietRefinery",["D50C222E"]="SovietWarFactory",
["6E1ABB35"]="SovietNavalYard",["D25BB962"]="SovietAirfield",["524BBD01"]="SovietPowerPlantAdvanced",["B7377639"]="SovietTechStructure",
["A01D437D"]="SovietCrane",["9442731"]="SovietOutpost",["A82CF003"]="SovietWallPiece",["895CAE6"]="SovietWallSegmentPiece",
["4DF5F9C1"]="SovietBaseDefenseGround",["1769BE29"]="SovietBaseDefenseAir",["FA1F6466"]="SovietBaseDefenseAdvanced",["D20552E1"]="SovietSuperWeapon",
["856C9DD6"]="SovietSuperWeaponAdvanced",["E980BF64"]="SovietBunker",["EA8F676B"]="AlliedLegionnaireInfantry",["C04A61DC"]="AlliedArtilleryVehicle",
["8BEAB78D"]="AlliedFutureTank",["3D6832A4"]="AlliedGunshipAircraft",["C9E24BAF"]="JapanArcherInfantry",["7B862459"]="JapanSentinelVehicle",
["30A862D6"]="JapanFortressShip",["5A609D09"]="JapanFortressShip_Pack",["59052E2F"]="SovietDesolatorInfantry",["8E9ED5CC"]="SovietMortarcycle",
["257E867"]="SovietHeavyWalkerVehicle",["68672EEF"]="SovietGrinderVehicle"}


function IsPlayerAI(self)
	if strfind(tostring(ObjectTeamName(self)), "Skirmish") or strfind(tostring(ObjectDescription(self)), " AI")
	or strfind(tostring(ObjectDescription(self)), " KI") or strfind(tostring(ObjectDescription(self)), "Enemy") 
	or strfind(tostring(ObjectTeamName(self)),"_0_0") then
	return true else return false
	end
end

function IfTwoObjectsBelongToSamePlayer(self,other)
	local DESCSelf = ObjectDescription(self)
	local DESCOther = ObjectDescription(other)
	if DESCSelf and DESCOther and
	strsub(DESCSelf,strfind(DESCSelf," owned by player ",1,true)+17,strfind(DESCSelf," owned by player ",1,true)+17) ==
	strsub(DESCOther,strfind(DESCOther," owned by player ",1,true)+17,strfind(DESCOther," owned by player ",1,true)+17) then
	return true else return false
	end
end

function GetObjectType(self)
	local OBJTem = ObjectTemplateName(self)
	return StringHashesTable[strsub(OBJTem,14,strlen(OBJTem))]
end

function GetObjectOrderName(self)
	local OBJDESC = ObjectDescription(self)
	local Order = strsub(OBJDESC,8,strfind(OBJDESC," ",8,true)-1)
	local UnitRef = "object_" .. Order
	ExecuteAction("SET_UNIT_REFERENCE",UnitRef,self)
	return UnitRef
end

function GetObjectScriptName(self)
	local DESC = ObjectDescription(self)
	local a,_ = strfind(DESC,") [{",1,true)
	if a then return strsub(DESC,strfind(DESC,"(",1,true)+1,a-1)
	end
end

function GetTeamName(self)
	local Team = ObjectTeamName(self)
	for i=1,getn(AllTeamTable) do
	if strfind(AllTeamTable[i],Team) then
	return AllTeamTable[i] end
	end
end

PlayerToTeamTable = {}
function GetObjectTeamName(self)
	local Team = ObjectTeamName(self)
	local EndNumber = strsub(Team,strlen(Team),strlen(Team))
	if tonumber(EndNumber) then
		if tonumber(EndNumber) ~= 0 then
			return "Player_"..EndNumber.."/"..Team
		else return PlayerToTeamTable[GetObjectUserPlayerName(self)].."/"..Team
		end
	else return "unknown team"
	end
end

function GetPlayerNameByTeam(teamname)
	if teamname then
		if teamname ~= "team" then
			return strsub(teamname,1,strfind(teamname,"/")-1)
		else return "Player_0" end
	end
end

function GetObjectUserPlayerName(self)
	local DESC = ObjectDescription(self)
	local a,b = strfind(DESC,"by player ",1,true)
	return strsub(DESC,a+3,b+1)
end

CompareTable = {["<"]=0,["<="]=1,["=="]=2,[">="]=3,[">"]=4,["~="]=5 } --如果没有这个CompareTable，写上
function GetUnitPercentHealth(Object)  --可填self或名称
	if type(Object) == "table" then
		Object = GetObjectOrderName(Object)
	end
	for i=0,100 do
		if EvaluateCondition("UNIT_HEALTH",Object,CompareTable["<="],i) then
			return i*0.01
		end
	end
end



-- 天空盒与60FPS的LUA
-- 任意一个玩家的主基地发射天空盒武器，仅发射一次
-- 同时该主基地检测帧率
skybox_created = {}
function OnBaseConstructionYardCreated(self)
    ObjectHideSubObjectPermanently(self, "Upgrade_02", true)
    ObjectHideSubObjectPermanently(self, "Upgrade_03", true)
    ExecuteAction("SET_CAMERA_CLIP_DEPTH_MULTIPLIER", 20)
    if getn(skybox_created) == 0 then
        skybox_created = { "1" }
        ObjectGrantUpgrade(self, "Upgrade_SkyBox_Create")
    end
    local a = GetFrame()
	-- 主基地每次打开都会创建检测对象。不过应该不会有太多次吧。。
	--if a == 0 then
		ObjectCreateAndFireTempWeapon(self, "FPS_UpgradeProvider_Spawner_Weapon")
		ObjectCreateAndFireTempWeapon(self, "FPS_UpgradeChecker_Weapon")
	--end
end


frames_1 = ""
frames_2 = ""
function OnFPSCheckerCreated(self)
	-- 存活时间为1s的虚拟对象，检测1s时间经过的帧数
	if frames_1 == "" then
		local a = GetFrame()
        frames_1 = a
	end
end
function OnFPSCheckerDestroyed(self)
	if frames_2 == "" then
		local b = GetFrame()
		frames_2 = b
	end
end

-- 1.5秒计时之后创建的物体，仅用于触发帧数检测
function OnFPSFPSUpgradeProviderCreated(self)
    if frames_1 ~= "" and frames_2 ~= "" then
		-- 对LUA来说1s只有15帧，打上60FPS补丁后也只有30帧。实际测出来frames_2/frames_1分别是30/0（60帧下）或15/0（30帧下）
		-- GIVE_PLAYER_UPGRADE 似乎只在开局有效。放在这里1s后执行的就无效了，只能用object upgrade。
		local diff = frames_2 - frames_1
        if diff > 29 then
			--WriteToFile("60FPS!")
            -- 检测到是60帧，创建给予升级的物体。
			ObjectCreateAndFireTempWeapon(self, "FPS_UpgradeProvider_60FPS_Weapon")
			ExecuteAction("NAMED_KILL", self)
            --ObjectGrantUpgrade(self, "UPGRADE_60FPS")
        else
			--WriteToFile("30FPS!")
        end
    else
        -- 若存在该对象，但LUA数据里却没有frames_1和frames_2的值，说明这是载入的游戏
        -- 需要重新进行60FPS判定。
		--WriteToFile("1111")
        local a = GetFrame()
		if a ~= 0 then
			ObjectCreateAndFireTempWeapon(self, "FPS_UpgradeProvider_Spawner_Weapon")
            ObjectCreateAndFireTempWeapon(self, "FPS_UpgradeChecker_Weapon")
			--ObjectRemoveUpgrade(self, "UPGRADE_60FPS")
			ExecuteAction("NAMED_KILL", self)
		end
	end
end

function OnFPSFPSUpgradeProviderCreated2(self)
	if frames_1 == "" or frames_2 == "" then
		-- 若存在该对象，但LUA数据里却没有frames_1和frames_2的值，说明这是载入的游戏
		-- 需要重新进行60FPS判定。
		--WriteToFile("2222")
		local a = GetFrame()
		if a ~= 0 then
			ObjectCreateAndFireTempWeapon(self, "FPS_UpgradeProvider_Spawner_Weapon")
			ObjectCreateAndFireTempWeapon(self, "FPS_UpgradeChecker_Weapon")
			--ObjectRemoveUpgrade(self, "UPGRADE_60FPS")
			ExecuteAction("NAMED_KILL", self)
		end
	end
end

function OnMineCrystalHarvestEnd(self)
    local ObjSelf = GetObjectOrderName(self)
	ExecuteAction("NAMED_KILL", ObjSelf)
end


function OnMineCrystalWorthyHarvestStart(self)
    ObjectBroadcastEventToUnits(self, "worthy_harvest", 5)
end


function OnMinerSelfCheck(self)
    -- 每隔3s检查：如果矿车不在采矿也不在移动，则需要重置AI的指令。
    local ObjSelf = GetObjectOrderName(self)

    local test0 = ObjectTestModelCondition(self, "MOVING")
    local test1 = ObjectTestModelCondition(self, "DOCKING")
    local test2 = ObjectTestModelCondition(self, "WEAPONSTATE_ONE")
    local test3 = ObjectTestModelCondition(self, "HARVEST_PREPARATION")
    local test4 = ObjectTestModelCondition(self, "HARVEST_ACTION")
    if test0 == false and test1 == false and test2 == false and test3 == false and test4 == false then
        local ai = IsPlayerAI(self)

        if ai == true then
            -- WriteToFile("  111 " .. ObjSelf)

            -- 这三个指令可以重置矿车自己的ai，使其继续采矿
            ExecuteAction("UNIT_SET_STANCE", ObjSelf, 0)
            ExecuteAction("UNIT_SET_STANCE", ObjSelf, 3)
            ExecuteAction("UNIT_SET_STANCE", ObjSelf, 0)
        end
    end
end

function OnMinerGetWorthyOre(self)
	ObjectGrantUpgrade(self, "Upgrade_WorthyOre")
end

function OnMinerDocking(self)
    local worthy = ObjectTestModelCondition(self, "USER_1")
    if worthy == true then
        ObjectBroadcastEventToAllies(self, "worthy_docking", 5)
        ObjectRemoveUpgrade(self, "Upgrade_WorthyOre")
    else
		ObjectBroadcastEventToAllies(self, "normal_docking", 5)
    end
end

function OnWorthyOreRecovered(self)
	ObjectGrantUpgrade(self, "Upgrade_WorthyOre")
end

function OnNormalOreRecovered(self)
	ObjectRemoveUpgrade(self, "Upgrade_WorthyOre")
end

function PsychicPartisanMCVGrantAIUpgrade(self)
	local ai = IsPlayerAI(self)
    if ai == true then
		ObjectGrantUpgrade( self, "Upgrade_HardAIMultiPlayer" )
    end
end