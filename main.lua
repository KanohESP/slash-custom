--=========================================================================================================================================================--

-- PUBLIC AND FREE SCRIPT
                                                                        -- From github.com/KanohESP to all.
-- PUBLIC AND FREE SCRIPT

--=========================================================================================================================================================--




















--=============================================================================--
--============================= THINGS TO CHANGE ==============================--
--=============================================================================--

local payable = false
local function Buy(price)
    Notif("Has pagado ~b~" .. price .. "~w~$")
    PlaySoundFrontend(-1, "WEAPON_PURCHASE", "HUD_AMMO_SHOP_SOUNDSET", true)
    if payable then
        --writte here your buying function
    end
end
local function BuySale(price)
    Notif("Has pagado ~b~" .. price .. "~w~$")
    PlaySoundFrontend(-1, "WEAPON_PURCHASE", "HUD_AMMO_SHOP_SOUNDSET", true)
    if payable then
        --writte here your buying function
    end
end

--==============================================================================--

local pedAsSpawn = false
local mloillegale = GetInteriorAtCoords(1106.551, -2332.655, 30.393)
local GoToMenu = false
inMenu = false
local weaponData = {}
local pedConfig = { 
	model = 'mp_m_weapexp_01',
	x = 8.15, 
	y = -1099.294,
	z = 28.797,
	h = 157.613,
	animType = "scenario",
	animFlag = 0,
	animLib = 'CODE_HUMAN_CROSS_ROAD_WAIT', 
	animName = ''
}
local Weapons = {
    interiorIDs = {
        [153857] = true,
        [200961] = true,
        [140289] = {
            weaponRotationOffset = 135.0,
        },
        [180481] = true,
        [168193] = true,
        [164609] = {
            weaponRotationOffset = 150.0,
        },
        [175617] = true,
        [176385] = true,
        [178689] = true,
        [137729] = {
            additionalOffset = vec(8.3, -6.5, 0.0),
            additionalCameraOffset = vec(8.3, -6.0, 0.0),
            additionalCameraPoint = vec(1.0, -0.91, 0.0),
            additionalWeaponOffset = vec(0.0, 0.5, 0.0),
            weaponRotationOffset = -60.0,
        },
        [248065] = {
            additionalOffset = vec(-10.0, 3.0, 0.0),
            additionalCameraOffset = vec(-9.5, 3.0, 0.0),
            additionalCameraPoint = vec(-1.0, 0.4, 0.0),
            additionalWeaponOffset = vec(0.4, 0.0, 0.0),
        },
        [mloillegale] = {
            additionalCameraOffset = vec(-1.7266207, -2.364942, -2.727137),
            additionalCameraPoint = vec(-1.0, 0.4, 0.0),
            additionalWeaponOffset = vec(-2.8518755, -1.72522, -2.559147),
        },
    },
    closeMenuNextFrame = false,
    weaponClasses = {},
    weaponClassesIlle = {},
}

local globalWeaponTable = {

    {
           name = "Pistols",
        { 'WEAPON_PISTOL', 'Pistol' },     
    },
}
local globalAttachmentTable = {

    
    { "COMPONENT_AT_PI_SUPP", "Silenciador - ~c~0~w~ $", 0 },
    { "COMPONENT_AT_AR_SUPP_02", "Silenciador - ~c~0~w~ $", 0 },
    { "COMPONENT_AT_SR_SUPP", "Silenciador - ~c~0~w~ $", 0 },
    { "COMPONENT_AT_AR_SUPP", "Silenciador - ~c~0~w~ $", 0 },
    { "COMPONENT_AT_SR_SUPP_03", "Silenciador - ~c~0~w~ $", 0 },
    { "COMPONENT_AT_PI_SUPP_02", "Silenciador - ~c~0~w~ $", 0 },
    { "COMPONENT_AT_PI_COMP", "Compensador - ~c~0~w~ $", 0 },
    

    { "COMPONENT_CARBINERIFLE_MK2_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_MARKSMANRIFLE_MK2_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_SPECIALCARBINE_MK2_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_BULLPUPRIFLE_MK2_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_HEAVYSNIPER_MK2_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_COMBATMG_MK2_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_SMG_MK2_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_PISTOL_MK2_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_PISTOL_CLIP_02", "Cargador Ampliado - ~c~ ~c~0~w~ $", 0 },
    { "COMPONENT_HEAVYSHOTGUN_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_PISTOL50_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_COMBATPISTOL_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_APPISTOL_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_COMBATPDW_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_SNSPISTOL_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_SNSPISTOL_MK2_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_ASSAULTRIFLE_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_COMBATMG_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_MG_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_ASSAULTSMG_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_GUSENBERG_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_MICROSMG_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_BULLPUPRIFLE_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_COMPACTRIFLE_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_HEAVYPISTOL_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_VINTAGEPISTOL_CLIP_02", "Cargador Ampliado - ~c0~w~ $", 0 },
    { "COMPONENT_CARBINERIFLE_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_ADVANCEDRIFLE_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_MARKSMANRIFLE_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_SMG_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },
    { "COMPONENT_SPECIALCARBINE_CLIP_02", "Cargador Ampliado - ~c~0~w~ $", 0 },

    { "COMPONENT_AT_PI_FLSH_02", "Linterna - ~c~0~w~ $", 0 },
    { "COMPONENT_AT_AR_FLSH	", "Linterna - ~c~0~w~ $", 0 },
    { "COMPONENT_AT_PI_FLSH", "Linterna - ~c~0~w~ $", 0 },
    { "COMPONENT_AT_AR_FLSH", "Linterna - ~c~0~w~ $", 0 },
    { "COMPONENT_AT_PI_FLSH_03", "Linterna - ~c~0~w~ $", 0 },

    { "COMPONENT_AT_SCOPE_MACRO", "Mira - ~c~0~w~ $", 0 },
    { "COMPONENT_AT_SCOPE_MACRO_02", "Mira - ~c~0~w~ $", 0 },
    { "COMPONENT_AT_SCOPE_SMALL_02", "Mira - ~c~0~w~ $", 0 },
    { "COMPONENT_AT_SCOPE_MEDIUM", "Mira - ~c~0~w~ $", 0 },
    { "COMPONENT_AT_SCOPE_SMALL", "Mira - ~c~0~w~ $", 0 },
    { "COMPONENT_AT_PI_RAIL", "Mira - ~c~0~w~ $", 0 },

}

local globalWeaponTableIlle = {

    {
        name = "Pistolas",
        { 'WEAPON_PISTOL', 'Pistola' },
        { 'WEAPON_PISTOL_MK2', 'Pistola Mk II' },
        { 'WEAPON_COMBATPISTOL', 'Pistola de Combate' },
        { 'WEAPON_APPISTOL', 'Pistola AP' },
        { 'WEAPON_PISTOL50', 'Pistola .50' },
        { 'WEAPON_REVOLVER', 'Revolver' },
        { 'WEAPON_REVOLVER_MK2', 'Heavy Revolver Mk II' },
        { 'WEAPON_VINTAGEPISTOL', 'Pistola Vintage' },
        { 'WEAPON_SNSPISTOL', 'SNS Pistol' },
        { 'WEAPON_SNSPISTOL_MK2', 'SNS Pistol Mk II' },
        { 'WEAPON_MARKSMANPISTOL', 'Marksman Pistol' },
        { 'WEAPON_HEAVYPISTOL', 'Heavy Pistol' },
        { 'WEAPON_DOUBLEACTION', 'Double Action Revolver' },
    },
}

local globalTintTable = {
    mk1 = {
        { 1, "Verde - ~c~0~w~ $", 0 },
        { 3, "Rosa - ~c~0~w~ $", 0 },
        { 4, "Dust - ~c~0~w~ $", 0 },
        { 5, "Azul - ~c~0~w~ $", 0 },
        { 6, "Naranja - ~c~0~w~ $", 0 },
        { 7, "Plata - ~c~0~w~ $", 0 },
        { 2, "Oro - ~c~0~w~ $", 0 },
    },
}
for ci, wepTable in pairs(globalWeaponTable) do
    local className = wepTable.name
    Weapons.weaponClasses[ci] = {
        name = className,
        weapons = {},
    }
    local classWepTable = Weapons.weaponClasses[ci].weapons
    for wi, weaponObject in ipairs(wepTable) do
        if weaponObject[3] then
            classWepTable[wi] = weaponObject[3]
            classWepTable[wi].name = weaponObject[2]
            classWepTable[wi].model = weaponObject[1]
            classWepTable[wi].attachments = {}
        else
            classWepTable[wi] = {
                name = weaponObject[2],
                model = weaponObject[1],
                attachments = {},
            }
        end
        local wep = classWepTable[wi]
        for _, attachmentObject in ipairs(globalAttachmentTable) do
            if DoesWeaponTakeWeaponComponent(weaponObject[1], attachmentObject[1]) then
                wep.attachments[#wep.attachments + 1] = {
                    name = attachmentObject[2],
                    model = attachmentObject[1],
                    price = attachmentObject[3]
                }
            end
        end
        wep.clipSize = wep.clipSize or GetWeaponClipSize(weaponObject[1])
        wep.isMK2 = wep.isMK2 or (string.find(weaponObject[1], "_MK2") ~= nil)
    end
end

for ci, wepTable in pairs(globalWeaponTableIlle) do
    local className = wepTable.name
    Weapons.weaponClassesIlle[ci] = {
        name = className,
        weapons = {},
    }
    local classWepTable = Weapons.weaponClassesIlle[ci].weapons
    for wi, weaponObject in ipairs(wepTable) do
        if weaponObject[3] then
            classWepTable[wi] = weaponObject[3]
            classWepTable[wi].name = weaponObject[2]
            classWepTable[wi].model = weaponObject[1]
            classWepTable[wi].attachments = {}
        else
            classWepTable[wi] = {
                name = weaponObject[2],
                model = weaponObject[1],
                attachments = {},
            }
        end
        local wep = classWepTable[wi]
        for _, attachmentObject in ipairs(globalAttachmentTable) do
            if DoesWeaponTakeWeaponComponent(weaponObject[1], attachmentObject[1]) then
                wep.attachments[#wep.attachments + 1] = {
                    name = attachmentObject[2],
                    model = attachmentObject[1],
                    price = attachmentObject[3]
                }
            end
        end
        wep.clipSize = wep.clipSize or GetWeaponClipSize(weaponObject[1])
        wep.isMK2 = wep.isMK2 or (string.find(weaponObject[1], "_MK2") ~= nil)
    end
end

for intID, interior in pairs(Weapons.interiorIDs) do
    local additionalOffset = vec(0, 0, 0)
    if type(interior) == "table" then
        additionalOffset = interior.additionalOffset or additionalOffset
    end

    local locationCoords = GetOffsetFromInteriorInWorldCoords(intID, (1.0), 4.7, 1.0) + additionalOffset
end

function GoCustom()
    local radius = 1.0
    local waitForPlayerToLeave = false
    inMenu = true
    local interiorID = GetInteriorFromEntity(GetPlayerPed(-1))

    local additionalOffset = vec(0, 0, 0)
    if type(Weapons.interiorIDs[interiorID]) == "table" then
        additionalOffset = Weapons.interiorIDs[interiorID].additionalOffset or additionalOffset
    end
    for i, mloid in ipairs(Weapons.interiorIDs) do
        if GetInteriorFromEntity(GetPlayerPed(-1)) ~= i then
            interiorID = mloillegale
        end
    end

    SetPlayerControl(PlayerId(), false)

    local additionalCameraOffset = vec(0, 0, 0)
    local additionalCameraPoint = vec(0, 0, 0)
    if type(Weapons.interiorIDs[interiorID]) == "table" then
        additionalCameraOffset = Weapons.interiorIDs[interiorID].additionalCameraOffset or additionalCameraOffset
        additionalCameraPoint = Weapons.interiorIDs[interiorID].additionalCameraPoint or additionalCameraPoint
    end

    local additionalWeaponOffset = vec(0, 0, 0)
    if type(Weapons.interiorIDs[interiorID]) == "table" then
        rotationOffset = Weapons.interiorIDs[interiorID].weaponRotationOffset or 0.0
        additionalOffset = Weapons.interiorIDs[interiorID].additionalOffset or additionalOffset
        additionalWeaponOffset = Weapons.interiorIDs[interiorID].additionalWeaponOffset or additionalWeaponOffset
    end
    

    Weapons.currentMenuCamera = CreateCam("DEFAULT_SCRIPTED_CAMERA")
    local cam = Weapons.currentMenuCamera
    SetCamCoord(cam, GetOffsetFromInteriorInWorldCoords(interiorID, 1.097412, 5.177246, 1.522137) + additionalCameraOffset)
    PointCamAtCoord(cam, (GetOffsetFromInteriorInWorldCoords(interiorID, 2.222717, 5.324097, 1.05245) + additionalOffset) + additionalWeaponOffset)

    SetCamActive(cam, true)
    RenderScriptCams(true, 1, 500, 300, 0)

    Citizen.Wait(600)
    GoToMenu = true
    if interiorID == mloillegale then
        CustomUI.OpenMenu("Weaponsille")
    else
        CustomUI.OpenMenu("Weapons")
    end
    waitForPlayerToLeave = true

    additionalOffset = nil
    interiorID = nil
end

local function IsWeaponMK2(weaponModel)
    return string.find(weaponModel, "_MK2")
end
local function DoesPlayerOwnWeapon(weaponModel)
    return HasPedGotWeapon(GetPlayerPed(-1), weaponModel, 0)
end

local function DoesPlayerWeaponHaveComponent(weaponModel, componentModel)
    return (DoesPlayerOwnWeapon(weaponModel) and HasPedGotWeaponComponent(GetPlayerPed(-1), weaponModel, componentModel) or false)
end

local function IsPlayerWeaponTintActive(weaponModel, tint)
    return (tint == GetPedWeaponTintIndex(GetPlayerPed(-1), weaponModel))
end

Citizen.CreateThread(function()
    function CreateFakeWeaponObject(weapon, keepOldWeapon)
        if weapon.noPreview then
            if DoesEntityExist(Weapons.fakeWeaponObject) then
                DeleteObject(Weapons.fakeWeaponObject)
            end
            Weapons.fakeWeaponObject = false
            return false
        end
        local weaponWorldModel = GetWeapontypeModel(weapon.model)
        RequestModel(weaponWorldModel)
        while not HasModelLoaded(weaponWorldModel) do
            Citizen.Wait(0)
        end

        local interiorID = GetInteriorFromEntity(GetPlayerPed(-1))
        for i, mloid in ipairs(Weapons.interiorIDs) do
            if GetInteriorFromEntity(GetPlayerPed(-1)) ~= i then
                interiorID = 122114
            end
        end
        local rotationOffset = 0.0
        local additionalOffset = vec(0, 0, 0)
        local additionalWeaponOffset = vec(0, 0, 0)
        if type(Weapons.interiorIDs[interiorID]) == "table" then
            rotationOffset = Weapons.interiorIDs[interiorID].weaponRotationOffset or 0.0
            additionalOffset = Weapons.interiorIDs[interiorID].additionalOffset or additionalOffset
            additionalWeaponOffset = Weapons.interiorIDs[interiorID].additionalWeaponOffset or additionalWeaponOffset
        end
        local extraAdditionalWeaponOffset = weapon.offset or vec(0, 0, 0)

        local fakeWeaponCoords = (GetOffsetFromInteriorInWorldCoords(interiorID, 2.222717, 5.324097, 1.20245) + additionalOffset) + additionalWeaponOffset + extraAdditionalWeaponOffset
        local fakeWeapon = CreateWeaponObject(weapon.model, weapon.clipSize * 3, fakeWeaponCoords, true, 0.0)
        SetEntityAlpha(fakeWeapon, 0)
        SetEntityHeading(fakeWeapon, (GetCamRot(GetRenderingCam(), 1).z - 180) + rotationOffset)
        SetEntityCoordsNoOffset(fakeWeapon, fakeWeaponCoords)

        for i, attach in ipairs(weapon.attachments) do
            if DoesPlayerWeaponHaveComponent(weapon.model, attach.model) then
                GiveWeaponComponentToWeaponObject(fakeWeapon, attach.model)
            end
        end
        if DoesPlayerOwnWeapon(weapon.model) then
            SetWeaponObjectTintIndex(fakeWeapon, GetPedWeaponTintIndex(GetPlayerPed(-1), weapon.model))
        end

        if not keepOldWeapon then
            SetEntityAlpha(fakeWeapon, 255)
            if DoesEntityExist(Weapons.fakeWeaponObject) then
                DeleteObject(Weapons.fakeWeaponObject)
            end
            Weapons.fakeWeaponObject = fakeWeapon
        end
        Citizen.CreateThread(function()
            local axe = 0
            while DoesEntityExist(fakeWeapon) do
                Citizen.Wait(5)
                SetEntityRotation(fakeWeapon, GetEntityRotation(fakeWeapon) + vector3(0.0, 0.0, 0.4))
                if GetControlNormal(0, 1) == 1 or GetDisabledControlNormal(0, 1) == 1 then
                    SetEntityRotation(fakeWeapon, GetEntityRotation(fakeWeapon) + vector3(0.0, 0.0, 5))
                elseif GetControlNormal(0, 1) == -1 or GetDisabledControlNormal(0, 1) == -1 then
                    SetEntityRotation(fakeWeapon, GetEntityRotation(fakeWeapon) - vector3(0.0, 0.0, 5))           
                end
            end
        end)
        return fakeWeapon
    end
end)

local currentTempWeapon = false
local tempWeaponLocked = false
local function SetTempWeapon(weapon)
    if (not currentTempWeapon and weapon) or currentTempWeapon ~= weapon.model then
        currentTempWeapon = weapon
        if weapon == false then
            if DoesEntityExist(Weapons.fakeWeaponObject) then
                DeleteObject(Weapons.fakeWeaponObject)
            end
        else
            if not tempWeaponLocked then
                tempWeaponLocked = true
                Citizen.CreateThread(function()
                    CreateFakeWeaponObject(weapon)
                    currentTempWeapon = weapon.model
                    tempWeaponLocked = false
                end)
            end
        end
    end
end


local currentTempWeaponConfig = {
    component = false,
    tint = false,
}

local function SetTempWeaponConfig(weapon, component, tint)
    Citizen.CreateThread(function()
        if currentTempWeaponConfig.component ~= component or currentTempWeaponConfig.tint ~= tint then
            currentTempWeaponConfig = {
                component = component,
                tint = tint,
            }
            local fakeWeapon = CreateFakeWeaponObject(weapon, true)
            Citizen.Wait(30)
            if currentTempWeaponConfig.component then
                local attachWorldModel = GetWeaponComponentTypeModel(currentTempWeaponConfig.component)
                RequestModel(attachWorldModel)
                while not HasModelLoaded(attachWorldModel) do
                    Citizen.Wait(0)
                end
                GiveWeaponComponentToWeaponObject(fakeWeapon, currentTempWeaponConfig.component)
            end
            if currentTempWeaponConfig.tint then
                SetWeaponObjectTintIndex(fakeWeapon, currentTempWeaponConfig.tint)
            else
                SetWeaponObjectTintIndex(fakeWeapon, GetPedWeaponTintIndex(GetPlayerPed(-1), weapon.model))
            end

            SetEntityAlpha(fakeWeapon, 255)
            if DoesEntityExist(Weapons.fakeWeaponObject) then
                DeleteObject(Weapons.fakeWeaponObject)
            end
            Weapons.fakeWeaponObject = fakeWeapon
        end
    end)
end

local function GiveWeapon(weaponhash, weaponammo)
    GiveWeaponToPed(GetPlayerPed(-1), weaponhash, weaponammo, false, true)
    SetPedAmmoByType(GetPlayerPed(-1), GetPedAmmoTypeFromWeapon_2(GetPlayerPed(-1), weaponhash), weaponammo)
end

local function GiveAmmo(weaponHash, ammo)
    AddAmmoToPed(GetPlayerPed(-1), weaponHash, ammo)
end

local function GiveMaxAmmo(weaponHash)
    local Ammo = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(weaponHash))
    local maxAmmo = 99999
    if Ammo ~= 250 then
        SetAmmoInClip(PlayerPedId(), GetHashKey(weaponHash), GetWeaponClipSize(GetHashKey(weaponHash)))
        AddAmmoToPed(PlayerPedId(), GetHashKey(weaponHash), maxAmmo)
        Buy(0)
    else
        Notif("~r~Ya estás a tope!")
    end
end

local function GiveMaxAmmoSale(weaponHash)
    local Ammo = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(weaponHash))
    local maxAmmo = 99999
    if Ammo < 250 then
        SetAmmoInClip(PlayerPedId(), GetHashKey(weaponHash), GetWeaponClipSize(GetHashKey(weaponHash)))
        AddAmmoToPed(PlayerPedId(), GetHashKey(weaponHash), maxAmmo)
        BuySale(0)
    else
        Notif("~r~Ya estás a tope!")
    end
end

local function RemoveWeapon(weaponhash)
    RemoveWeaponFromPed(GetPlayerPed(-1), weaponhash)
end

local function GiveComponent(weaponname, componentname, weapon)
    GiveWeaponComponentToPed(GetPlayerPed(-1), weaponname, componentname)
    CreateFakeWeaponObject(weapon)
end

local function RemoveComponent(weaponname, componentname, weapon)
    RemoveWeaponComponentFromPed(GetPlayerPed(-1), weaponname, componentname)
    CreateFakeWeaponObject(weapon)
end

local function SetPlayerWeaponTint(weaponname, tint, weapon)
    SetPedWeaponTintIndex(GetPlayerPed(-1), weaponname, tint)
    CreateFakeWeaponObject(weapon)
end

local function SaveWeapons()

    for i, class in ipairs(Weapons.weaponClasses) do
        for j, weapon in ipairs(class.weapons) do
            if DoesPlayerOwnWeapon(weapon.model) then

                weaponData[weapon.model] = {
                    model = weapon.model,
                    tint = GetPedWeaponTintIndex(GetPlayerPed(-1), weapon.model),
                    ammo = GetAmmoInPedWeapon(GetPlayerPed(-1), weapon.model),
                    attachments = {},
                }

                for k, attach in ipairs(weapon.attachments) do
                    if DoesPlayerWeaponHaveComponent(weapon.model, attach.model) then
                        table.insert(weaponData[weapon.model].attachments,attach)
                    end
                end
            end
        end
    end
end

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        Citizen.Wait(0)
        if not pedAsSpawn then 
            npc = CreateNpc('s_m_y_xmech_02', 1105.768, -2330.083, 29.893, 178.442)
			pedAsSpawn = true
        end
        if Vdist(GetEntityCoords(PlayerPedId()), 1105.829, -2331.951, 30.393) < 1.2  then
            alert('Pulsa ~INPUT_PICKUP~ para personalizar tu pistola.')
            if IsControlPressed(2, 38) then
                GoCustom()
                SetEntityCoords(PlayerPedId(), 1104.696, -2331.891, 30.393)
            end
        end

      
    end
end)

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

local function ReleaseWeaponModels()
    for ci, wepTable in pairs(globalWeaponTable) do
        for wi, weaponObject in ipairs(wepTable) do
            if weaponObject[1] and HasModelLoaded(GetWeapontypeModel(weaponObject[1])) then
                SetModelAsNoLongerNeeded(GetWeapontypeModel(weaponObject[1]))

            end
        end
    end
end

Citizen.CreateThread(function()
    CustomUI.CreateMenu("Weapons", "Personnalisation", function()
        SetPlayerControl(PlayerId(), true)
        SetCamActive(cam, false)
        RenderScriptCams(false, 1, 600, 300, 300)
        if DoesEntityExist(Weapons.fakeWeaponObject) then
            DeleteObject(Weapons.fakeWeaponObject)
        end
        SetPedDropsWeaponsWhenDead(GetPlayerPed(-1), false)
        SaveWeapons()
        ReleaseWeaponModels()
        return true
    end)
    CustomUI.SetSubTitle('Weapons', "Personalizar")

   

    for i, class in ipairs(Weapons.weaponClasses) do
        CustomUI.CreateSubMenu("w_" .. class.name, "Weapons", class.name, function()
            if DoesEntityExist(Weapons.fakeWeaponObject) then
                DeleteObject(Weapons.fakeWeaponObject)
            end
            return true
        end)

        for i, weapon in ipairs(class.weapons) do
            CustomUI.CreateSubMenu("w_" .. class.name .. "_" .. weapon.model, "Weapons", weapon.name, function()
                SetTempWeaponConfig(weapon, false, false)
                return true
            end)

        end
    end

    while true do
        Citizen.Wait(0)
        if GoToMenu then
            if CustomUI.IsMenuOpened('Weapons') then
               
                for i, class in ipairs(Weapons.weaponClasses) do
                    CustomUI.MenuButton(class.name, "w_" .. class.name)
                end
                CustomUI.Display()
            end
            for i, class in ipairs(Weapons.weaponClasses) do
                if CustomUI.IsMenuOpened("w_" .. class.name) then
                    for i, weapon in ipairs(class.weapons) do
                        if DoesPlayerOwnWeapon(weapon.model) then
                            local clicked, hovered = CustomUI.SpriteMenuButton(weapon.name, "commonmenu", "shop_gunclub_icon_a", "shop_gunclub_icon_b", "w_" .. class.name .. "_" .. weapon.model)
                            if clicked then
                                SetCurrentPedWeapon(GetPlayerPed(-1), weapon.model, true)
                                CreateFakeWeaponObject(weapon)
                            elseif hovered then
                                SetTempWeapon(weapon)
                            end
                        end
                    end
                    CustomUI.Display()
                end
                for i, weapon in ipairs(class.weapons) do
                    if CustomUI.IsMenuOpened("w_" .. class.name .. "_" .. weapon.model) then
                        if not weapon.noAmmo then
                            if CustomUI.Button("Municion", "~c~250$") then
                                GiveMaxAmmo(weapon.model)
                            end
                        end
                        for i, attachment in ipairs(weapon.attachments) do
                            if DoesPlayerWeaponHaveComponent(weapon.model, attachment.model) then
                                local clicked, hovered = CustomUI.SpriteButton(attachment.name, "commonmenu", "shop_gunclub_icon_a", "shop_gunclub_icon_b")
                                if clicked then
                                    Notif("~b~Ya comprado.")
                                elseif hovered then
                                    SetTempWeaponConfig(weapon, false, false)
                                end
                            else
                                local clicked, hovered = CustomUI.SpriteButton(attachment.name, "commonmenu", "shop_tick_icon")
                                if clicked then
                                    GiveComponent(weapon.model, attachment.model, weapon)
                                    Buy(attachment.price)
                                elseif hovered then
                                    SetTempWeaponConfig(weapon, attachment.model, false)
                                end
                            end
                        end
                        if not weapon.noTint then
                            for i, tint in ipairs((weapon.isMK2 and globalTintTable.mk2 or globalTintTable.mk1)) do
                                if IsPlayerWeaponTintActive(weapon.model, tint[1]) then
                                    local clicked, hovered = CustomUI.SpriteButton(tint[2], "commonmenu", "shop_gunclub_icon_a", "shop_gunclub_icon_b")
                                    if clicked then
                                        Notif("~b~Ya comprado.")
                                    elseif hovered then
                                        SetTempWeaponConfig(weapon, false, tint[1])
                                    end
                                else
                                    local clicked, hovered = CustomUI.SpriteButton(tint[2], "commonmenu", "shop_tick_icon")
                                    if clicked then
                                        SetPlayerWeaponTint(weapon.model, tint[1], weapon)
                                        Buy(tint[3])
                                    elseif hovered then
                                        SetTempWeaponConfig(weapon, false, tint[1])
                                    end
                                end
                            end
                        end
                        CustomUI.Display()
                        DisplayAmmoThisFrame(true)
                    end
                end
            end

            if Weapons.closeMenuNextFrame then
                
                inMenu = false
                Weapons.closeMenuNextFrame = false
                CustomUI.CloseMenu()
                GoToMenu = false
               
            end
        end
    end
end)

local hudPosition = vec(0.915, 0.045)

function Draw2DText(x, y, text, scale)

    SetTextFont(4)
    SetTextProportional(7)
    SetTextScale(scale, scale)
    SetTextColour(198, 25, 66, 255)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

Citizen.CreateThread(function()
    CustomUI.CreateMenu("Weaponsille", "Personnalisation", function()
        SetPlayerControl(PlayerId(), true)
        SetCamActive(cam, false)
        RenderScriptCams(false, 1, 600, 300, 300)
        if DoesEntityExist(Weapons.fakeWeaponObject) then
            DeleteObject(Weapons.fakeWeaponObject)
        end
        SetPedDropsWeaponsWhenDead(GetPlayerPed(-1), false)
        SaveWeapons()
        ReleaseWeaponModels()
        return true
    end)
    CustomUI.SetSubTitle('Weaponsille', "Personalizar")

    for i, class in ipairs(Weapons.weaponClassesIlle) do
        CustomUI.CreateSubMenu("wi_" .. class.name, "Weaponsille", class.name, function()
            if DoesEntityExist(Weapons.fakeWeaponObject) then
                DeleteObject(Weapons.fakeWeaponObject)
            end
            return true
        end)

        for i, weapon in ipairs(class.weapons) do
            CustomUI.CreateSubMenu("wi_" .. class.name .. "_" .. weapon.model, "Weaponsille", weapon.name, function()
                SetTempWeaponConfig(weapon, false, false)
                return true
            end)

        end
    end

    while true do
        Citizen.Wait(0)
        if GoToMenu then

            if CustomUI.IsMenuOpened('Weaponsille') then
                for i, class in ipairs(Weapons.weaponClassesIlle) do
                    CustomUI.MenuButton(class.name, "wi_" .. class.name)
                end
                CustomUI.Display()
            end
            for i, class in ipairs(Weapons.weaponClassesIlle) do
                if CustomUI.IsMenuOpened("wi_" .. class.name) then
                
                    for i, weapon in ipairs(class.weapons) do
                        if DoesPlayerOwnWeapon(weapon.model) then
                            local clicked, hovered = CustomUI.SpriteMenuButton(weapon.name, "commonmenu", "shop_gunclub_icon_a", "shop_gunclub_icon_b", "wi_" .. class.name .. "_" .. weapon.model)
                            if clicked then
                                SetCurrentPedWeapon(GetPlayerPed(-1), weapon.model, true)
                                CreateFakeWeaponObject(weapon)
                            elseif hovered then
                                SetTempWeapon(weapon)
                            end
                        end
                    end
                    CustomUI.Display()
                end
                for i, weapon in ipairs(class.weapons) do
                    if CustomUI.IsMenuOpened("wi_" .. class.name .. "_" .. weapon.model) then
                        --Draw2DText(hudPosition.x, hudPosition.y, ("~w~Money : ~s~%d $"):format(MONEY_VARIABLE), 0.5)
                        if not weapon.noAmmo then
                            if CustomUI.Button("Municion - ~c~0$", "") then
                                GiveMaxAmmoSale(weapon.model)
                            end
                        end
                        for i, attachment in ipairs(weapon.attachments) do
                            if DoesPlayerWeaponHaveComponent(weapon.model, attachment.model) then
                                local clicked, hovered = CustomUI.SpriteButton(attachment.name, "commonmenu", "shop_gunclub_icon_a", "shop_gunclub_icon_b")
                                if clicked then
                                    Notif("~b~Ya comprado.")
                                elseif hovered then
                                    SetTempWeaponConfig(weapon, false, false)
                                end
                            else
                                local clicked, hovered = CustomUI.SpriteButton(attachment.name, "commonmenu", "shop_tick_icon")
                                if clicked then
                                    GiveComponent(weapon.model, attachment.model, weapon)
                                    BuySale(attachment.price)
                                elseif hovered then
                                    SetTempWeaponConfig(weapon, attachment.model, false)
                                end
                            end
                        end
                        if not weapon.noTint then
                            for i, tint in ipairs((weapon.isMK2 and globalTintTable.mk2 or globalTintTable.mk1)) do
                                if IsPlayerWeaponTintActive(weapon.model, tint[1]) then
                                    local clicked, hovered = CustomUI.SpriteButton(tint[2], "commonmenu", "shop_gunclub_icon_a", "shop_gunclub_icon_b")
                                    if clicked then
                                        Notif("~b~Ya comprado.")
                                    elseif hovered then
                                        SetTempWeaponConfig(weapon, false, tint[1])
                                    end
                                else
                                    local clicked, hovered = CustomUI.SpriteButton(tint[2], "commonmenu", "shop_tick_icon")
                                    if clicked then
                                            SetPlayerWeaponTint(weapon.model, tint[1], weapon)
                                        BuySale(tint[3])
                                    elseif hovered then
                                        SetTempWeaponConfig(weapon, false, tint[1])
                                    end
                                end
                            end
                        end
                        CustomUI.Display()
                        DisplayAmmoThisFrame(true)
                    end
                end
            end

            if Weapons.closeMenuNextFrame then
                inMenu = false
                Weapons.closeMenuNextFrame = false
                CustomUI.CloseMenu()
                GoToMenu = false 
            end
        end
    end
end)

local CustomWeapons = {
    interiorIDs = {
        [153857] = true,
        [200961] = true,
        [140289] = {
            weaponRotationOffset = 135.0,
        },
        [180481] = true,
        [168193] = {
            weaponCoords = vec(-660.8563, -935.3652, 21.93369),
            camCoords = vec(-661.8408, -935.4977, 22.33467),
        },
        [164609] = {
            weaponCoords = vec(-1306.469, -395.1452, 36.99135),
            camCoords = vec(-1306.469, -394.165, 37.30635),
        },
        [175617] = true,
        [176385] = true,
        [178689] = true,
        [137729] = {
            weaponCoords = vec(23.20143, -1107.817, 29.94579),
            camCoords = vec(22.24426, -1107.545, 30.34514),
        },
        [248065] = {
            weaponCoords = vec(808.999, -2157.083, 29.75742),
            camCoords = vec(809.6628, -2157.083, 30.14535),
        },
        [140289] = {
            weaponCoords = vec(251.4669, -51.15577, 70.07645),
            camCoords = vec(251.6564, -50.13564, 70.39243),
        },
    },
}









function Notif(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true,false)
end

RegisterCommand("custom", function()
    GoCustom()
end, false)

RegisterCommand("mloid", function()
    print(GetInteriorFromEntity(GetPlayerPed(-1)))
end, false)

SetPlayerControl(PlayerId(), true)
RenderScriptCams(false, 0, 0, 0, 0)

function CreateNpc(model, x, y, z, h)  -- Basic function to spawn a safe ped (unkillable). 
    RequestModel(model)
    while not HasModelLoaded(model) do 
        Citizen.Wait(1)
    end
    local npc = CreatePed(4, model, x, y, z+0.5, h,  false, true)
	SetPedFleeAttributes(npc, 0, 0)
	SetPedDropsWeaponsWhenDead(npc, false)
	SetPedDiesWhenInjured(npc, false)
	SetEntityInvincible(npc , true)
	FreezeEntityPosition(npc, true)
	SetBlockingOfNonTemporaryEvents(npc, true)
    return npc
end

