local _i, _f, _v, _r, _ri, _rf, _rl, _s, _rv, _ro, _in, _ii, _fi =
	Citizen.PointerValueInt(), Citizen.PointerValueFloat(), Citizen.PointerValueVector(),
	Citizen.ReturnResultAnyway(), Citizen.ResultAsInteger(), Citizen.ResultAsFloat(), Citizen.ResultAsLong(), Citizen.ResultAsString(), Citizen.ResultAsVector(), Citizen.ResultAsObject(),
	Citizen.InvokeNative, Citizen.PointerValueIntInitialized, Citizen.PointerValueFloatInitialized

local g = _G
local rs = rawset
local msgpack = msgpack
local _tostring = tostring
local function _ts(num)
	if num == 0 or not num then -- workaround for users calling string parameters with '0', also nil being translated
		return nil
	end
	return _tostring(num)
end
local function _ch(hash)
	if g.type(hash) == 'string' then
		return g.GetHashKey(hash)
	end

	return hash
end

local function _mfr(fn)
	return g.Citizen.GetFunctionReference(fn)
end

local Global = setmetatable({}, { __newindex = function(_, n, v)
	g[n] = v

	rs(_, n, v)
end})

_ENV = nil

--- Loads a minimap overlay from a GFx file in the current resource.
-- @param name The path to a `.gfx` file in the current resource. It has to be specified as a `file`.
-- @return A minimap overlay ID.
function Global.AddMinimapOverlay(name)
	return _in(0x4afd2499, _ts(name), _r, _ri)
end

function Global.AddTextEntry(entryKey, entryText)
	return _in(0x32ca01c3, _ts(entryKey), _ts(entryText))
end

function Global.AddTextEntryByHash(entryKey, entryText)
	return _in(0x289da860, _ch(entryKey), _ts(entryText))
end

--- This is similar to the PushScaleformMovieFunction natives, except it calls in the `TIMELINE` of a minimap overlay.
-- @param fnName A function in the overlay's TIMELINE.
-- @param miniMap The minimap overlay ID.
function Global.CallMinimapScaleformFunction(miniMap, fnName)
	return _in(0x4c89c0ed, miniMap, _ts(fnName), _r)
end

function Global.CanRegisterMissionPickups(p0)
	return _in(0x0A49D1CB6E34AF72, p0, _r)
end

function Global.CanVehicleParachuteBeActivated(vehicle)
	return _in(0xA916396DF4154EE3, vehicle, _r)
end

--- Cancels the currently executing event. See https://wiki.fivem.net/wiki/CancelEvent
function Global.CancelEvent()
	return _in(0xfa29d35d)
end

function Global.DeleteFunctionReference(referenceIdentity)
	return _in(0x1e86f206, _ts(referenceIdentity))
end

function Global.DeleteResourceKvp(key)
	return _in(0x7389b5df, _ts(key))
end

function Global.DoesVehicleHaveDoor(vehicle, doorIndex)
	return _in(0x645F4B6E8499F632, vehicle, doorIndex, _r)
end

function Global.DuplicateFunctionReference(referenceIdentity)
	return _in(0xf4e2079d, _ts(referenceIdentity), _r, _s)
end

function Global.EndFindKvp(handle)
	return _in(0xb3210203, handle)
end

function Global.EndFindObject(findHandle)
	return _in(0xdeda4e50, findHandle)
end

function Global.EndFindPed(findHandle)
	return _in(0x9615c2ad, findHandle)
end

function Global.EndFindPickup(findHandle)
	return _in(0x3c407d53, findHandle)
end

function Global.EndFindVehicle(findHandle)
	return _in(0x9227415a, findHandle)
end

function Global.ExecuteCommand(commandString)
	return _in(0x561c060b, _ts(commandString))
end

--- This native is not implemented.
function Global.ExperimentalLoadCloneCreate(data, objectId, tree)
	return _in(0xd2cb95a3, _ts(data), objectId, _ts(tree), _r, _ri)
end

--- This native is not implemented.
function Global.ExperimentalLoadCloneSync(entity, data)
	return _in(0x6bc189ac, entity, _ts(data))
end

--- This native is not implemented.
function Global.ExperimentalSaveCloneCreate(entity)
	return _in(0x9d65cad2, entity, _r, _s)
end

--- This native is not implemented.
function Global.ExperimentalSaveCloneSync(entity)
	return _in(0x38d19210, entity, _r, _s)
end

function Global.FindFirstObject(outEntity)
	return _in(0xfaa6cb5d, _ii(outEntity) --[[ may be optional ]], _r, _ri)
end

function Global.FindFirstPed(outEntity)
	return _in(0xfb012961, _ii(outEntity) --[[ may be optional ]], _r, _ri)
end

function Global.FindFirstPickup(outEntity)
	return _in(0x3ff9d340, _ii(outEntity) --[[ may be optional ]], _r, _ri)
end

function Global.FindFirstVehicle(outEntity)
	return _in(0x15e55694, _ii(outEntity) --[[ may be optional ]], _r, _ri)
end

function Global.FindKvp(handle)
	return _in(0xbd7bebc5, handle, _r, _s)
end

function Global.FindNextObject(findHandle, outEntity)
	return _in(0x4e129dbf, findHandle, _ii(outEntity) --[[ may be optional ]], _r)
end

function Global.FindNextPed(findHandle, outEntity)
	return _in(0xab09b548, findHandle, _ii(outEntity) --[[ may be optional ]], _r)
end

function Global.FindNextPickup(findHandle, outEntity)
	return _in(0x4107ef0f, findHandle, _ii(outEntity) --[[ may be optional ]], _r)
end

function Global.FindNextVehicle(findHandle, outEntity)
	return _in(0x8839120d, findHandle, _ii(outEntity) --[[ may be optional ]], _r)
end

function Global.GetAllVehicles(vehArray)
	return _in(0x9B8E1BF04B51F2E8, _ii(vehArray) --[[ may be optional ]], _r, _ri)
end

--- Returns the world matrix of the specified camera. To turn this into a view matrix, calculate the inverse.
function Global.GetCamMatrix(camera)
	return _in(0x8f57a89d, camera, _v, _v, _v, _v)
end

--- Returns the name of the currently executing resource.
-- @return The name of the resource.
function Global.GetCurrentResourceName()
	return _in(0xe5e9ebbb, _r, _s)
end

function Global.GetEntryPositionOfDoor(vehicle, doorIndex)
	return _in(0xC0572928C0ABFDA3, vehicle, doorIndex, _r, _rv)
end

function Global.GetHasLowerableWheels(vehicle)
	return _in(0xDCA174A42133F08C, vehicle, _r)
end

function Global.GetInstanceId()
	return _in(0x9f1c4383, _r, _ri)
end

--- Gets the amount of metadata values with the specified key existing in the specified resource's manifest.
-- See also: [Resource manifest](https://wiki.fivem.net/wiki/Resource_manifest)
-- @param metadataKey The key to look up in the resource manifest.
-- @param resourceName The resource name.
function Global.GetNumResourceMetadata(resourceName, metadataKey)
	return _in(0x776e864, _ts(resourceName), _ts(metadataKey), _r, _ri)
end

function Global.GetNumResources()
	return _in(0x863f27b, _r, _ri)
end

function Global.GetNumberOfVehicleDoors(vehicle)
	return _in(0x92922A607497B14D, vehicle, _r, _ri)
end

function Global.GetPedAmmoTypeFromWeapon_2(ped, weaponHash)
	return _in(0xF489B44DD5AF4BD9, ped, _ch(weaponHash), _r, _ri)
end

function Global.GetPlayerFromServerId(serverId)
	return _in(0x344ea166, serverId, _r, _ri)
end

function Global.GetPlayerServerId(player)
	return _in(0x4d97bcc7, player, _r, _ri)
end

--- Returns all commands that are registered in the command system.
-- The data returned adheres to the following layout:
-- ```
-- [
-- {
-- "name": "cmdlist"
-- },
-- {
-- "name": "command1"
-- }
-- ]
-- ```
-- @return An object containing registered commands.
function Global.GetRegisteredCommands()
	return msgpack.unpack(_in(0xd4bef069, _r, _ro))
end

function Global.GetResourceByFindIndex(findIndex)
	return _in(0x387246b7, findIndex, _r, _s)
end

function Global.GetResourceKvpFloat(key)
	return _in(0x35bdceea, _ts(key), _r, _rf)
end

function Global.GetResourceKvpInt(key)
	return _in(0x557b586a, _ts(key), _r, _ri)
end

function Global.GetResourceKvpString(key)
	return _in(0x5240da5a, _ts(key), _r, _s)
end

--- Gets the metadata value at a specified key/index from a resource's manifest.
-- See also: [Resource manifest](https://wiki.fivem.net/wiki/Resource_manifest)
-- @param index The value index, in a range from [0..GET_NUM_RESOURCE_METDATA-1].
-- @param metadataKey The key in the resource manifest.
-- @param resourceName The resource name.
function Global.GetResourceMetadata(resourceName, metadataKey, index)
	return _in(0x964bab1d, _ts(resourceName), _ts(metadataKey), index, _r, _s)
end

function Global.GetVehicleAcceleration(vehicle)
	return _in(0x478321, vehicle, _r, _rf)
end

function Global.GetVehicleAlarmTimeLeft(vehicle)
	return _in(0xc62aac98, vehicle, _r, _ri)
end

function Global.GetVehicleClutch(vehicle)
	return _in(0x1dad4583, vehicle, _r, _rf)
end

function Global.GetVehicleCurrentGear(vehicle)
	return _in(0xb4f4e566, vehicle, _r, _ri)
end

function Global.GetVehicleCurrentRpm(vehicle)
	return _in(0xe7b12b54, vehicle, _r, _rf)
end

function Global.GetVehicleDashboardColour(vehicle, color)
	return _in(0xB7635E80A5C31BFF, vehicle, _ii(color) --[[ may be optional ]])
end

function Global.GetVehicleDashboardSpeed(vehicle)
	return _in(0x9aad420e, vehicle, _r, _rf)
end

function Global.GetVehicleEngineTemperature(vehicle)
	return _in(0xf4f495cb, vehicle, _r, _rf)
end

function Global.GetVehicleFuelLevel(vehicle)
	return _in(0x5f739bb8, vehicle, _r, _rf)
end

function Global.GetVehicleGravityAmount(vehicle)
	return _in(0xb48a1292, vehicle, _r, _rf)
end

function Global.GetVehicleHandbrake(vehicle)
	return _in(0x483b013c, vehicle, _r)
end

--- Returns the effective handling data of a vehicle as a floating-point value.
-- Example: `local fSteeringLock = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fSteeringLock')`
-- @param vehicle The vehicle to obtain data for.
-- @param class The handling class to get. Only "CHandlingData" is supported at this time.
-- @param fieldName The field name to get. These match the keys in `handling.meta`.
-- @return A floating-point value.
function Global.GetVehicleHandlingFloat(vehicle, class, fieldName)
	return _in(0x642fc12f, vehicle, _ts(class), _ts(fieldName), _r, _rf)
end

--- Returns the effective handling data of a vehicle as an integer value.
-- Example: `local modelFlags = GetVehicleHandlingInt(vehicle, 'CHandlingData', 'strModelFlags')`
-- @param vehicle The vehicle to obtain data for.
-- @param class The handling class to get. Only "CHandlingData" is supported at this time.
-- @param fieldName The field name to get. These match the keys in `handling.meta`.
-- @return An integer.
function Global.GetVehicleHandlingInt(vehicle, class, fieldName)
	return _in(0x27396c75, vehicle, _ts(class), _ts(fieldName), _r, _ri)
end

--- Returns the effective handling data of a vehicle as a vector value.
-- Example: `local inertiaMultiplier = GetVehicleHandlingVector(vehicle, 'CHandlingData', 'vecInertiaMultiplier')`
-- @param vehicle The vehicle to obtain data for.
-- @param class The handling class to get. Only "CHandlingData" is supported at this time.
-- @param fieldName The field name to get. These match the keys in `handling.meta`.
-- @return An integer.
function Global.GetVehicleHandlingVector(vehicle, class, fieldName)
	return _in(0xfb341304, vehicle, _ts(class), _ts(fieldName), _r, _rv)
end

function Global.GetVehicleHighGear(vehicle)
	return _in(0xf1d1d689, vehicle, _r, _ri)
end

--- Gets the vehicle indicator light state. 0 = off, 1 = left, 2 = right, 3 = both
-- @return An integer.
function Global.GetVehicleIndicatorLights(vehicle)
	return _in(0x83070354, vehicle, _r, _ri)
end

function Global.GetVehicleInteriorColour(vehicle, color)
	return _in(0x7D1464D472D32136, vehicle, _ii(color) --[[ may be optional ]])
end

function Global.GetVehicleNextGear(vehicle)
	return _in(0xddb298ae, vehicle, _r, _ri)
end

function Global.GetVehicleNumberOfWheels(vehicle)
	return _in(0xedf4b0fc, vehicle, _r, _ri)
end

function Global.GetVehicleOilLevel(vehicle)
	return _in(0xfc7f8ef4, vehicle, _r, _rf)
end

function Global.GetVehicleSteeringAngle(vehicle)
	return _in(0x1382fcea, vehicle, _r, _rf)
end

function Global.GetVehicleSteeringScale(vehicle)
	return _in(0x954465de, vehicle, _r, _rf)
end

function Global.GetVehicleTurboPressure(vehicle)
	return _in(0xe02b51d7, vehicle, _r, _rf)
end

function Global.GetVehicleWheelHealth(vehicle, wheelIndex)
	return _in(0x54a677f5, vehicle, wheelIndex, _r, _rf)
end

--- Gets speed of a wheel at the tyre.
-- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
-- @return An integer.
function Global.GetVehicleWheelSpeed(vehicle, wheelIndex)
	return _in(0x149c9da0, vehicle, wheelIndex, _r, _rf)
end

--- Returns the offset of the specified wheel relative to the wheel's axle center.
function Global.GetVehicleWheelXOffset(vehicle, wheelIndex)
	return _in(0xcc90cbca, vehicle, wheelIndex, _r, _rf)
end

function Global.GetVehicleWheelXrot(vehicle, wheelIndex)
	return _in(0x15ecc0ab, vehicle, wheelIndex, _r, _rf)
end

--- Returns whether or not the specific minimap overlay has loaded.
-- @param id A minimap overlay ID.
-- @return A boolean indicating load status.
function Global.HasMinimapOverlayLoaded(id)
	return _in(0xf7535f32, id, _r)
end

function Global.HasVehicleJumpingAbility(vehicle)
	return _in(0x9078C0C5EF8C19E9, vehicle, _r)
end

function Global.HasVehicleParachute(vehicle)
	return _in(0xBC9CFF381338CB4F, vehicle, _r)
end

function Global.HasVehicleRocketBoost(vehicle)
	return _in(0x36D782F68B309BDA, vehicle, _r)
end

function Global.InvokeFunctionReference(referenceIdentity, argsSerialized, argsLength, retvalLength)
	return _in(0xe3551879, _ts(referenceIdentity), _ts(argsSerialized), argsLength, _ii(retvalLength) --[[ may be optional ]], _r, _s)
end

function Global.IsAceAllowed(object)
	return _in(0x7ebb9929, _ts(object), _r)
end

--- Gets whether or not this is the CitizenFX server.
-- @return A boolean value.
function Global.IsDuplicityVersion()
	return _in(0xcf24c52e, _r)
end

function Global.IsModelAPed(modelHash)
	return _in(0x75816577FEA6DAD5, _ch(modelHash), _r)
end

function Global.IsThisModelAnAmphibiousCar(model)
	return _in(0x633F6F44A537EBB6, _ch(model), _r)
end

function Global.IsVehicleAlarmSet(vehicle)
	return _in(0xdc921211, vehicle, _r)
end

function Global.IsVehicleEngineStarting(vehicle)
	return _in(0xbb340d04, vehicle, _r)
end

function Global.IsVehicleInteriorLightOn(vehicle)
	return _in(0xa411f72c, vehicle, _r)
end

function Global.IsVehicleNeedsToBeHotwired(vehicle)
	return _in(0xf9933bf4, vehicle, _r)
end

function Global.IsVehiclePreviouslyOwnedByPlayer(vehicle)
	return _in(0xf849ed67, vehicle, _r)
end

function Global.IsVehicleRocketBoostActive(vehicle)
	return _in(0x3D34E80EED4AE3BE, vehicle, _r)
end

function Global.IsVehicleWanted(vehicle)
	return _in(0xa7daf7c, vehicle, _r)
end

--- Reads the contents of a text file in a specified resource.
-- If executed on the client, this file has to be included in `files` in the resource manifest.
-- Example: `local data = LoadResourceFile("devtools", "data.json")`
-- @param fileName The file in the resource.
-- @param resourceName The resource name.
-- @return The file contents
function Global.LoadResourceFile(resourceName, fileName)
	return _in(0x76a9ee1f, _ts(resourceName), _ts(fileName), _r, _s)
end

function Global.N_0x0035bb914316f1e3(p0, p1, p2, p3)
	return _in(0x0035BB914316F1E3, p0, p1, p2, p3)
end

function Global.N_0x015b03ee1c43e6ec(p0)
	return _in(0x015B03EE1C43E6EC, p0)
end

function Global.N_0x0379daf89ba09aa5(p0, p1)
	return _in(0x0379DAF89BA09AA5, p0, p1)
end

function Global.N_0x03c2eebb04b3fb72(p0, p1, p2, p3, p4, p5, p6)
	return _in(0x03C2EEBB04B3FB72, p0, p1, p2, p3, p4, p5, p6)
end

function Global.N_0x0419b167ee128f33(p0, p1)
	return _in(0x0419B167EE128F33, p0, p1, _r, _ri)
end

function Global.N_0x041c7f2a6c9894e6(p0, p1, p2)
	return _in(0x041C7F2A6C9894E6, p0, p1, p2, _r, _ri)
end

function Global.N_0x04918a41bc9b8157(p0, p1, p2)
	return _in(0x04918A41BC9B8157, p0, p1, p2, _r, _ri)
end

function Global.N_0x04d90ba8207ada2d(p0)
	return _in(0x04D90BA8207ADA2D, p0)
end

function Global.N_0x0581730ab9380412(p0, p1, p2, p3, p4, p5)
	return _in(0x0581730AB9380412, p0, p1, p2, p3, p4, p5)
end

function Global.N_0x0596843b34b95ce5(p0, p1)
	return _in(0x0596843B34B95CE5, p0, p1)
end

function Global.N_0x05f04155a226fbbf(p0, p1, p2, p3)
	return _in(0x05F04155A226FBBF, p0, p1, p2, p3)
end

function Global.N_0x065d03a9d6b2c6b5(p0, p1)
	return _in(0x065D03A9D6B2C6B5, p0, p1)
end

function Global.N_0x06eaf70ae066441e(p0)
	return _in(0x06EAF70AE066441E, p0)
end

function Global.N_0x07dbd622d9533857(p0)
	return _in(0x07DBD622D9533857, p0, _r, _ri)
end

function Global.N_0x07eab372c8841d99(p0, p1, p2)
	return _in(0x07EAB372C8841D99, p0, p1, p2, _r, _ri)
end

function Global.N_0x08a1b82b91900682(p0, p1, p2)
	return _in(0x08A1B82B91900682, p0, p1, p2)
end

function Global.N_0x08b0ca7a6ab3ac32(p0, p1, p2)
	return _in(0x08B0CA7A6AB3AC32, p0, p1, p2)
end

function Global.N_0x0a50d2604e05cb94(p0, p1, p2, p3, p4)
	return _in(0x0A50D2604E05CB94, p0, p1, p2, p3, p4)
end

function Global.N_0x0a9c7f36e5d7b683(p0)
	return _in(0x0A9C7F36E5D7B683, p0)
end

function Global.N_0x0aa27680a0bd43fa()
	return _in(0x0AA27680A0BD43FA)
end

function Global.N_0x0abf535877897560(p0)
	return _in(0x0ABF535877897560, p0, _r, _ri)
end

function Global.N_0x0b3e35ac043707d9(p0, p1)
	return _in(0x0B3E35AC043707D9, p0, p1)
end

function Global.N_0x0b565b0aae56a0e8(p0, p1, p2, p3, p4, p5, p6)
	return _in(0x0B565B0AAE56A0E8, p0, p1, p2, p3, p4, p5, p6)
end

function Global.N_0x0b8b7f74bf061c6d()
	return _in(0x0B8B7F74BF061C6D, _r, _ri)
end

function Global.N_0x0be4be946463f917(p0)
	return _in(0x0BE4BE946463F917, p0, _r, _ri)
end

function Global.N_0x0c112765300c7e1e(p0)
	return _in(0x0C112765300C7E1E, p0, _r, _ri)
end

function Global.N_0x0c82d21a77c22d49(p0, p1, p2, p3)
	return _in(0x0C82D21A77C22D49, p0, p1, p2, p3)
end

function Global.N_0x0c8fac83902a62df(p0)
	return _in(0x0C8FAC83902A62DF, p0)
end

function Global.N_0x0cb1be0633c024a8(p0, p1, p2, p3)
	return _in(0x0CB1BE0633C024A8, p0, p1, p2, p3)
end

function Global.N_0x0cf97f497fe7d048(p0)
	return _in(0x0CF97F497FE7D048, p0)
end

function Global.N_0x0d30eb83668e63c5(p0, p1, p2, p3)
	return _in(0x0D30EB83668E63C5, p0, p1, p2, p3)
end

function Global.N_0x0d5f65a8f4ebdab5(p0, p1)
	return _in(0x0D5F65A8F4EBDAB5, p0, p1)
end

function Global.N_0x0e4f77f7b9d74d84(p0)
	return _in(0x0E4F77F7B9D74D84, p0)
end

function Global.N_0x0eacdf8487d5155a(p0)
	return _in(0x0EACDF8487D5155A, p0)
end

function Global.N_0x0f62619393661d6e(p0, p1, p2)
	return _in(0x0F62619393661D6E, p0, p1, p2)
end

function Global.N_0x0fe8e1fcd2b86b33(p0, p1, p2, p3)
	return _in(0x0FE8E1FCD2B86B33, p0, p1, p2, p3)
end

function Global.N_0x1086127b3a63505e(p0, p1, p2)
	return _in(0x1086127B3A63505E, p0, p1, p2)
end

function Global.N_0x1087bc8ec540daeb(p0, p1)
	return _in(0x1087BC8EC540DAEB, p0, p1)
end

function Global.N_0x112209ce0290c03a(p0, p1, p2, p3)
	return _in(0x112209CE0290C03A, p0, p1, p2, p3)
end

function Global.N_0x11579d940949c49e(p0)
	return _in(0x11579D940949C49E, p0)
end

function Global.N_0x1201e8a3290a3b98(p0, p1)
	return _in(0x1201E8A3290A3B98, p0, p1)
end

function Global.N_0x125e6d638b8605d4(p0)
	return _in(0x125E6D638B8605D4, p0, _r, _rv)
end

function Global.N_0x12d148d26538d0f9(p0, p1, p2, p3)
	return _in(0x12D148D26538D0F9, p0, p1, p2, p3)
end

function Global.N_0x1312ddd8385aee4e(p0, p1)
	return _in(0x1312DDD8385AEE4E, p0, p1)
end

function Global.N_0x1398582b7f72b3ed(p0)
	return _in(0x1398582B7F72B3ED, p0)
end

function Global.N_0x13f1fcb111b820b0(p0)
	return _in(0x13F1FCB111B820B0, p0)
end

function Global.N_0x144da052257ae7d8(p0)
	return _in(0x144DA052257AE7D8, p0)
end

function Global.N_0x1461b28a06717d68(p0)
	return _in(0x1461B28A06717D68, p0, _r, _ri)
end

function Global.N_0x148b08c2d2acb884(p0, p1, p2)
	return _in(0x148B08C2D2ACB884, p0, p1, p2)
end

function Global.N_0x14eda9ee27bd1626(p0)
	return _in(0x14EDA9EE27BD1626, p0)
end

function Global.N_0x15803fec3b9a872b(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	return _in(0x15803FEC3B9A872B, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
end

function Global.N_0x159b7318403a1cd8(p0)
	return _in(0x159B7318403A1CD8, p0)
end

function Global.N_0x15cfa549788d35ef()
	return _in(0x15CFA549788D35EF)
end

function Global.N_0x15f944730c832252(p0, p1)
	return _in(0x15F944730C832252, p0, p1)
end

function Global.N_0x1632be0ac1e62876(p0, p1)
	return _in(0x1632BE0AC1E62876, p0, p1)
end

function Global.N_0x1636d7fc127b10d2(p0)
	return _in(0x1636D7FC127B10D2, p0)
end

function Global.N_0x164c5ff663790845(p0)
	return _in(0x164C5FF663790845, p0)
end

function Global.N_0x171bafb3c60389f4(p0)
	return _in(0x171BAFB3C60389F4, p0, _r, _ri)
end

function Global.N_0x17330ebf2f2124a8()
	return _in(0x17330EBF2F2124A8)
end

function Global.N_0x17f7471eaca78290(p0)
	return _in(0x17F7471EACA78290, p0)
end

function Global.N_0x1888694923ef4591()
	return _in(0x1888694923EF4591)
end

function Global.N_0x1950dae9848a4739(p0, p1, p2)
	return _in(0x1950DAE9848A4739, p0, p1, p2, _r, _ri)
end

function Global.N_0x19d1b791cb3670fe(p0, p1)
	return _in(0x19D1B791CB3670FE, p0, p1)
end

function Global.N_0x19e50eb6e33e1d28(p0)
	return _in(0x19E50EB6E33E1D28, p0)
end

function Global.N_0x1a7ce7cd3e653485(p0)
	return _in(0x1A7CE7CD3E653485, p0)
end

function Global.N_0x1a8ea222f9c67dbb(p0)
	return _in(0x1A8EA222F9C67DBB, p0, _r, _ri)
end

function Global.N_0x1b212b26dd3c04df(p0, p1)
	return _in(0x1B212B26DD3C04DF, p0, p1)
end

function Global.N_0x1b7abe26cbcbf8c7(p0, p1, p2)
	return _in(0x1B7ABE26CBCBF8C7, p0, p1, p2)
end

function Global.N_0x1bbac99c0bc53656(p0, p1)
	return _in(0x1BBAC99C0BC53656, p0, p1)
end

function Global.N_0x1c1b69fae509ba97(p0, p1)
	return _in(0x1C1B69FAE509BA97, p0, p1)
end

function Global.N_0x1da0da9cb3f0c8bf(p0)
	return _in(0x1DA0DA9CB3F0C8BF, p0, _r, _ri)
end

function Global.N_0x1dda078d12879eee(p0, p1, p2)
	return _in(0x1DDA078D12879EEE, p0, p1, p2)
end

function Global.N_0x1e3f1b1b891a2aaa(p0, p1)
	return _in(0x1E3F1B1B891A2AAA, p0, p1)
end

function Global.N_0x1e45b34adebee48e()
	return _in(0x1E45B34ADEBEE48E)
end

function Global.N_0x1f34b0626c594380(p0, p1)
	return _in(0x1F34B0626C594380, p0, p1)
end

function Global.N_0x1f351cf1c6475734(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9)
	return _in(0x1F351CF1C6475734, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9)
end

function Global.N_0x1f8e00fb18239600(p0)
	return _in(0x1F8E00FB18239600, p0)
end

function Global.N_0x203b381133817079(p0)
	return _in(0x203B381133817079, p0)
end

function Global.N_0x213aeb2b90cba7ac(p0, p1, p2)
	return _in(0x213AEB2B90CBA7AC, p0, p1, p2)
end

function Global.N_0x2382ab11450ae7ba(p0, p1)
	return _in(0x2382AB11450AE7BA, p0, p1)
end

function Global.N_0x2467a2d807d37ca3(p0)
	return _in(0x2467A2D807D37CA3, p0, _r, _ri)
end

function Global.N_0x2472622ce1f2d45f(p0, p1, p2)
	return _in(0x2472622CE1F2D45F, p0, p1, p2)
end

function Global.N_0x259ba6d4e6f808f1(p0)
	return _in(0x259BA6D4E6F808F1, p0)
end

function Global.N_0x2605663bd4f23b5d(p0)
	return _in(0x2605663BD4F23B5D, p0)
end

function Global.N_0x265559da40b3f327(p0)
	return _in(0x265559DA40B3F327, p0)
end

function Global.N_0x26d99d5a82fd18e8(p0)
	return _in(0x26D99D5A82FD18E8, p0)
end

function Global.N_0x2790f4b17d098e26(p0)
	return _in(0x2790F4B17D098E26, p0)
end

function Global.N_0x27aa1c973cacfe63(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9)
	return _in(0x27AA1C973CACFE63, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9)
end

function Global.N_0x282b6739644f4347(p0)
	return _in(0x282B6739644F4347, p0)
end

function Global.N_0x28b18377eb6e25f6(p0, p1)
	return _in(0x28B18377EB6E25F6, p0, p1)
end

function Global.N_0x28ecb8ac2f607db2(p0, p1, p2, p3, p4)
	return _in(0x28ECB8AC2F607DB2, p0, p1, p2, p3, p4)
end

function Global.N_0x2916a928514c9827()
	return _in(0x2916A928514C9827)
end

function Global.N_0x29280002282f1928(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23)
	return _in(0x29280002282F1928, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23)
end

function Global.N_0x2a5e0621dd815a9a(p0, p1, p2, p3)
	return _in(0x2A5E0621DD815A9A, p0, p1, p2, p3)
end

function Global.N_0x2a86a0475b6a1434(p0, p1)
	return _in(0x2A86A0475B6A1434, p0, p1)
end

function Global.N_0x2afc2d19b50797f2(p0, p1, p2, p3)
	return _in(0x2AFC2D19B50797F2, p0, p1, p2, p3)
end

function Global.N_0x2b1c623823db0d9d(p0, p1, p2, p3, p4, p5, p6)
	return _in(0x2B1C623823DB0D9D, p0, p1, p2, p3, p4, p5, p6, _r, _ri)
end

function Global.N_0x2b40a97646381508(p0)
	return _in(0x2B40A97646381508, p0)
end

function Global.N_0x2bc54a8188768488(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	return _in(0x2BC54A8188768488, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
end

function Global.N_0x2c173ae2bdb9385e(p0)
	return _in(0x2C173AE2BDB9385E, p0, _r, _ri)
end

function Global.N_0x2c1d8b3b19e517cc(p0, p1)
	return _in(0x2C1D8B3B19E517CC, p0, p1, _r, _ri)
end

function Global.N_0x2c9f302398e13141(p0, p1)
	return _in(0x2C9F302398E13141, p0, p1)
end

function Global.N_0x2cd90358f67d0aa8(p0)
	return _in(0x2CD90358F67D0AA8, p0)
end

function Global.N_0x2ce9d95e4051aecd(p0)
	return _in(0x2CE9D95E4051AECD, p0)
end

function Global.N_0x2da41ed6e1fcd7a5(p0, p1)
	return _in(0x2DA41ED6E1FCD7A5, p0, p1, _r, _ri)
end

function Global.N_0x2de6c5e2e996f178(p0)
	return _in(0x2DE6C5E2E996F178, p0)
end

function Global.N_0x2dfc81c9b9608549(p0, p1)
	return _in(0x2DFC81C9B9608549, p0, p1, _r, _ri)
end

function Global.N_0x2e4c123d1c8a710e(p0, p1, p2, p3, p4, p5, p6)
	return _in(0x2E4C123D1C8A710E, p0, p1, p2, p3, p4, p5, p6, _r, _ri)
end

function Global.N_0x2f074c904d85129e(p0, p1, p2, p3, p4, p5, p6)
	return _in(0x2F074C904D85129E, p0, p1, p2, p3, p4, p5, p6)
end

function Global.N_0x2f41a3bae005e5fa(p0, p1)
	return _in(0x2F41A3BAE005E5FA, p0, p1)
end

function Global.N_0x2fa2494b47fdd009(p0, p1)
	return _in(0x2FA2494B47FDD009, p0, p1)
end

function Global.N_0x2fab6614ce22e196(p0, p1, p2, p3)
	return _in(0x2FAB6614CE22E196, p0, p1, p2, p3)
end

function Global.N_0x30fd873ece50e9f6(p0, p1, p2, p3, p4)
	return _in(0x30FD873ECE50E9F6, p0, p1, p2, p3, p4)
end

function Global.N_0x31e90b8873a4cd3b(p0, p1)
	return _in(0x31E90B8873A4CD3B, p0, p1)
end

function Global.N_0x32888337579a5970()
	return _in(0x32888337579A5970)
end

function Global.N_0x32cac93c9de73d32()
	return _in(0x32CAC93C9DE73D32, _r, _ri)
end

function Global.N_0x32caedf24a583345(p0)
	return _in(0x32CAEDF24A583345, p0)
end

function Global.N_0x32ebd154cb6b8b99(p0, p1, p2)
	return _in(0x32EBD154CB6B8B99, p0, p1, p2)
end

function Global.N_0x32f34ff7f617643b(p0, p1)
	return _in(0x32F34FF7F617643B, p0, p1)
end

function Global.N_0x33981d6804e62f49(p0, p1, p2, p3)
	return _in(0x33981D6804E62F49, p0, p1, p2, p3)
end

function Global.N_0x33d72899e24c3365(p0, p1)
	return _in(0x33D72899E24C3365, p0, p1, _r, _ri)
end

function Global.N_0x33de49edf4dde77a(p0)
	return _in(0x33DE49EDF4DDE77A, p0, _r, _rv)
end

function Global.N_0x352e2b5cf420bf3b(p0, p1)
	return _in(0x352E2B5CF420BF3B, p0, p1)
end

function Global.N_0x35bb21de06784373(p0, p1)
	return _in(0x35BB21DE06784373, p0, p1)
end

function Global.N_0x365e877c61d6988b(p0, p1, p2, p3)
	return _in(0x365E877C61D6988B, p0, p1, p2, p3)
end

function Global.N_0x36f32de87082343e(p0, p1)
	return _in(0x36F32DE87082343E, p0, p1)
end

function Global.N_0x375a706a5c2fd084(p0)
	return _in(0x375A706A5C2FD084, p0)
end

function Global.N_0x3795688a307e1eb6(p0)
	return _in(0x3795688A307E1EB6, p0, _r, _ri)
end

function Global.N_0x37d5f739fd494675(p0)
	return _in(0x37D5F739FD494675, p0, _r, _ri)
end

function Global.N_0x3855fb5eb2c5e8b2(p0)
	return _in(0x3855FB5EB2C5E8B2, p0, _r, _ri)
end

function Global.N_0x393bd2275ceb7793()
	return _in(0x393BD2275CEB7793, _r, _ri)
end

function Global.N_0x394cd08e31313c28()
	return _in(0x394CD08E31313C28)
end

function Global.N_0x39a5fb7eaf150840(p0, p1)
	return _in(0x39A5FB7EAF150840, p0, p1)
end

function Global.N_0x3a8b55fda4c8ddef(p0, p1, p2)
	return _in(0x3A8B55FDA4C8DDEF, p0, p1, p2, _r, _ri)
end

function Global.N_0x3b2fd68db5f8331c(p0, p1)
	return _in(0x3B2FD68DB5F8331C, p0, p1)
end

function Global.N_0x3b458ddb57038f08(p0, p1, p2)
	return _in(0x3B458DDB57038F08, p0, p1, p2)
end

function Global.N_0x3d120012440e6683()
	return _in(0x3D120012440E6683, _r, _ri)
end

function Global.N_0x3de3aa516fb126a4(p0)
	return _in(0x3DE3AA516FB126A4, p0)
end

function Global.N_0x3de51e9c80b116cf(p0)
	return _in(0x3DE51E9C80B116CF, p0, _r, _ri)
end

function Global.N_0x3e4adaff1830f146()
	return _in(0x3E4ADAFF1830F146, _r, _ri)
end

function Global.N_0x3e9679c1dfcf422c(p0, p1)
	return _in(0x3E9679C1DFCF422C, p0, p1)
end

function Global.N_0x3ebeac6c3f81f6bd(p0)
	return _in(0x3EBEAC6C3F81F6BD, p0)
end

function Global.N_0x3ed2b83ab2e82799(p0, p1)
	return _in(0x3ED2B83AB2E82799, p0, p1)
end

function Global.N_0x3f0cf9cb7e589b88()
	return _in(0x3F0CF9CB7E589B88, _r, _ri)
end

function Global.N_0x3f7325574e41b44d(p0, p1, p2, p3)
	return _in(0x3F7325574E41B44D, p0, p1, p2, p3)
end

function Global.N_0x4056ea1105f5abd7(p0, p1)
	return _in(0x4056EA1105F5ABD7, p0, p1)
end

function Global.N_0x40763ea7b9b783e7(p0, p1, p2)
	return _in(0x40763EA7B9B783E7, p0, p1, p2, _r, _ri)
end

function Global.N_0x4128464231e3ca0b(p0, p1, p2, p3)
	return _in(0x4128464231E3CA0B, p0, p1, p2, p3)
end

function Global.N_0x41290b40fa63e6da(p0)
	return _in(0x41290B40FA63E6DA, p0)
end

function Global.N_0x412f1364fa066cfb(p0)
	return _in(0x412F1364FA066CFB, p0, _r, _ri)
end

function Global.N_0x419615486bbf1956(p0)
	return _in(0x419615486BBF1956, p0)
end

function Global.N_0x42613035157e4208(p0)
	return _in(0x42613035157E4208, p0)
end

function Global.N_0x428ad3e26c8d9eb0(p0, p1, p2, p3, p4)
	return _in(0x428AD3E26C8D9EB0, p0, p1, p2, p3, p4)
end

function Global.N_0x42b65deef2edf2a1(p0)
	return _in(0x42B65DEEF2EDF2A1, p0)
end

function Global.N_0x4348bfda56023a2f(p0, p1)
	return _in(0x4348BFDA56023A2F, p0, p1, _r, _ri)
end

function Global.N_0x438822c279b73b93(p0)
	return _in(0x438822C279B73B93, p0)
end

function Global.N_0x4419966c9936071a(p0)
	return _in(0x4419966C9936071A, p0)
end

function Global.N_0x44621483ff966526(p0, p1)
	return _in(0x44621483FF966526, p0, p1)
end

function Global.N_0x44919cc079bb60bf(p0)
	return _in(0x44919CC079BB60BF, p0)
end

function Global.N_0x44cd1f493db2a0a6(p0, p1, p2)
	return _in(0x44CD1F493DB2A0A6, p0, p1, p2)
end

function Global.N_0x44f1012b69313374(p0, p1, p2, p3)
	return _in(0x44F1012B69313374, p0, p1, p2, p3)
end

function Global.N_0x451d05012ccec234(p0)
	return _in(0x451D05012CCEC234, p0, _r, _ri)
end

function Global.N_0x45a561a9421ab6ad(p0, p1)
	return _in(0x45A561A9421AB6AD, p0, p1, _r, _ri)
end

function Global.N_0x46f3add1e2d5baf2(p0, p1)
	return _in(0x46F3ADD1E2D5BAF2, p0, p1)
end

function Global.N_0x46f8696933a63c9b(p0, p1)
	return _in(0x46F8696933A63C9B, p0, p1, _r, _rv)
end

function Global.N_0x472841a026d26d8b()
	return _in(0x472841A026D26D8B, _r, _ri)
end

function Global.N_0x4757f00bc6323cfe(p0, p1)
	return _in(0x4757F00BC6323CFE, p0, p1)
end

function Global.N_0x47b32f5611e6e483(p0)
	return _in(0x47B32F5611E6E483, p0)
end

function Global.N_0x47b595d60664cffa(p0, p1)
	return _in(0x47B595D60664CFFA, p0, p1)
end

function Global.N_0x483aca1176ca93f1()
	return _in(0x483ACA1176CA93F1)
end

function Global.N_0x48608c3464f58ab4(p0, p1, p2)
	return _in(0x48608C3464F58AB4, p0, p1, p2)
end

function Global.N_0x4879e4fe39074cdf()
	return _in(0x4879E4FE39074CDF, _r, _ri)
end

function Global.N_0x488043841bbe156f()
	return _in(0x488043841BBE156F)
end

function Global.N_0x48c633e94a8142a7(p0)
	return _in(0x48C633E94A8142A7, p0, _r, _ri)
end

function Global.N_0x490861b88f4fd846(p0)
	return _in(0x490861B88F4FD846, p0)
end

function Global.N_0x497420e022796b3f()
	return _in(0x497420E022796B3F, _r, _ri)
end

function Global.N_0x4ad490ae1536933b(p0, p1)
	return _in(0x4AD490AE1536933B, p0, p1, _r, _ri)
end

function Global.N_0x4b5b620c9b59ed34(p0, p1)
	return _in(0x4B5B620C9B59ED34, p0, p1)
end

function Global.N_0x4ba166079d658ed4(p0, p1)
	return _in(0x4BA166079D658ED4, p0, p1)
end

function Global.N_0x4c2a9fdc22377075()
	return _in(0x4C2A9FDC22377075)
end

function Global.N_0x4c815eb175086f84(p0, p1)
	return _in(0x4C815EB175086F84, p0, p1, _r, _ri)
end

function Global.N_0x4d1cb8dc40208a17(p0, p1)
	return _in(0x4D1CB8DC40208A17, p0, p1, _r, _ri)
end

function Global.N_0x4e20d2a627011e8e(p0, p1)
	return _in(0x4E20D2A627011E8E, p0, p1, _r, _ri)
end

function Global.N_0x4e417c547182c84d(p0)
	return _in(0x4E417C547182C84D, p0, _r, _ri)
end

function Global.N_0x4e90d746056e273d(p0, p1)
	return _in(0x4E90D746056E273D, p0, p1)
end

function Global.N_0x501478855a6074ce(p0, p1, p2, p3, p4, p5)
	return _in(0x501478855A6074CE, p0, p1, p2, p3, p4, p5)
end

function Global.N_0x50634e348c8d44ef(p0)
	return _in(0x50634E348C8D44EF, p0, _r, _ri)
end

function Global.N_0x50c375537449f369(p0)
	return _in(0x50C375537449F369, p0)
end

function Global.N_0x516fc96eb88eefe5(p0)
	return _in(0x516FC96EB88EEFE5, p0)
end

function Global.N_0x5182a339a3474510(p0, p1, p2)
	return _in(0x5182A339A3474510, p0, p1, p2)
end

function Global.N_0x5335be58c083e74e(p0)
	return _in(0x5335BE58C083E74E, p0)
end

function Global.N_0x53c10c8bd774f2c9()
	return _in(0x53C10C8BD774F2C9, _r, _ri)
end

function Global.N_0x53cae13e9b426993(p0)
	return _in(0x53CAE13E9B426993, p0)
end

function Global.N_0x544996c0081abdeb(p0, p1)
	return _in(0x544996C0081ABDEB, p0, p1)
end

function Global.N_0x547237aa71ab44de(p0)
	return _in(0x547237AA71AB44DE, p0)
end

function Global.N_0x55a1e095db052fa5(p0, p1)
	return _in(0x55A1E095DB052FA5, p0, p1)
end

function Global.N_0x55a8becaf28a4eb7()
	return _in(0x55A8BECAF28A4EB7, _r, _ri)
end

--- Order of player1 and player2 are not interchangable, it was called for both orders.
function Global.N_0x55fcc0c390620314(player1, player2, toggle)
	return _in(0x55FCC0C390620314, player1, player2, toggle)
end

function Global.N_0x5615e0c5eb2bc6e2(p0, p1)
	return _in(0x5615E0C5EB2BC6E2, p0, p1)
end

function Global.N_0x5626d9d6810730d5()
	return _in(0x5626D9D6810730D5, _r, _ri)
end

function Global.N_0x563b65a643ed072e(p0, p1, p2)
	return _in(0x563B65A643ED072E, p0, p1, p2, _r, _ri)
end

function Global.N_0x577599cced639ca2(p0)
	return _in(0x577599CCED639CA2, p0)
end

function Global.N_0x585847c5e4e11709(p0, p1, p2)
	return _in(0x585847C5E4E11709, p0, p1, p2, _r, _ri)
end

function Global.N_0x5873c14a52d74236(p0)
	return _in(0x5873C14A52D74236, p0, _r, _ri)
end

function Global.N_0x58a39be597ce99cd()
	return _in(0x58A39BE597CE99CD)
end

function Global.N_0x59d421683d31835a(p0)
	return _in(0x59D421683D31835A, p0)
end

function Global.N_0x5b91b229243351a8(p0, p1)
	return _in(0x5B91B229243351A8, p0, p1)
end

function Global.N_0x5b9853296731e88d(p0, p1, p2, p3, p4, p5)
	return _in(0x5B9853296731E88D, p0, p1, p2, p3, p4, p5)
end

function Global.N_0x5ba68a0840d546ac(p0, p1)
	return _in(0x5BA68A0840D546AC, p0, p1, _r, _ri)
end

function Global.N_0x5bcde0f640c773d2(p0, p1, p2, p3)
	return _in(0x5BCDE0F640C773D2, p0, p1, p2, p3)
end

function Global.N_0x5c48b75732c8456c(p0, p1, p2, p3, p4, p5)
	return _in(0x5C48B75732C8456C, p0, p1, p2, p3, p4, p5)
end

function Global.N_0x5d2bfaab8d956e0e()
	return _in(0x5D2BFAAB8D956E0E)
end

function Global.N_0x5d97630a8a0ef123(p0, p1, p2)
	return _in(0x5D97630A8A0EF123, p0, p1, p2)
end

function Global.N_0x5da825a85d0ea6e6(p0, p1, p2)
	return _in(0x5DA825A85D0EA6E6, p0, p1, p2)
end

function Global.N_0x5dbf05db5926d089(p0)
	return _in(0x5DBF05DB5926D089, p0)
end

function Global.N_0x5e203da2ba15d436(p0)
	return _in(0x5E203DA2BA15D436, p0, _r, _ri)
end

function Global.N_0x5ecb40269053c0d4(p0)
	return _in(0x5ECB40269053C0D4, p0, _r, _ri)
end

function Global.N_0x5ecd378ee64450ab(p0)
	return _in(0x5ECD378EE64450AB, p0)
end

function Global.N_0x5ee5632f47ae9695(p0, p1)
	return _in(0x5EE5632F47AE9695, p0, p1)
end

function Global.N_0x5f456788b05faeac(p0, p1, p2)
	return _in(0x5F456788B05FAEAC, p0, p1, p2)
end

function Global.N_0x5ff2c33b13a02a11(p0)
	return _in(0x5FF2C33B13A02A11, p0)
end

function Global.N_0x60190048c0764a26(p0)
	return _in(0x60190048C0764A26, p0, _r, _ri)
end

function Global.N_0x60eedc12af66e846(p0)
	return _in(0x60EEDC12AF66E846, p0)
end

function Global.N_0x613f125ba3bd2eb9()
	return _in(0x613F125BA3BD2EB9, _r, _ri)
end

function Global.N_0x617f49c2668e6155()
	return _in(0x617F49C2668E6155, _r, _ri)
end

function Global.N_0x62374889a4d59f72()
	return _in(0x62374889A4D59F72)
end

function Global.N_0x62454a641b41f3c5(p0)
	return _in(0x62454A641B41F3C5, p0)
end

function Global.N_0x641f272b52e2f0f8(p0, p1)
	return _in(0x641F272B52E2F0F8, p0, p1)
end

function Global.N_0x6493cf69859b116a()
	return _in(0x6493CF69859B116A)
end

function Global.N_0x64d779659bc37b19(p0)
	return _in(0x64D779659BC37B19, p0, _r, _rv)
end

function Global.N_0x6501129c9e0ffa05(p0, p1)
	return _in(0x6501129C9E0FFA05, p0, p1)
end

function Global.N_0x651d3228960d08af(p0, p1)
	return _in(0x651D3228960D08AF, p0, p1)
end

function Global.N_0x6551b1f7f6cd46ea(p0)
	return _in(0x6551B1F7F6CD46EA, p0)
end

function Global.N_0x6558ac7c17bfef58(p0)
	return _in(0x6558AC7C17BFEF58, p0, _r, _ri)
end

function Global.N_0x658500ae6d723a7e(p0)
	return _in(0x658500AE6D723A7E, p0)
end

function Global.N_0x659cf2ef7f550c4f()
	return _in(0x659CF2EF7F550C4F, _r, _ri)
end

function Global.N_0x65b080555ea48149(p0)
	return _in(0x65B080555EA48149, p0)
end

function Global.N_0x65e7e78842e74cdb(p0)
	return _in(0x65E7E78842E74CDB, p0, _r, _ri)
end

function Global.N_0x668fd40bcba5de48(p0, p1, p2, p3, p4)
	return _in(0x668FD40BCBA5DE48, p0, p1, p2, p3, p4, _r, _ri)
end

function Global.N_0x66e3aaface2d1eb8(p0, p1, p2)
	return _in(0x66E3AAFACE2D1EB8, p0, p1, p2)
end

function Global.N_0x675d19c6067cae08(p0, p1, p2, p3)
	return _in(0x675D19C6067CAE08, p0, p1, p2, p3)
end

function Global.N_0x678f86d8fc040bdb(p0)
	return _in(0x678F86D8FC040BDB, p0)
end

function Global.N_0x68f8be6af5cdf8a6(p0, p1)
	return _in(0x68F8BE6AF5CDF8A6, p0, p1)
end

function Global.N_0x693478acbd7f18e7()
	return _in(0x693478ACBD7F18E7)
end

function Global.N_0x697f508861875b42(p0, p1, p2)
	return _in(0x697F508861875B42, p0, p1, p2, _r, _ri)
end

function Global.N_0x69ef772b192614c1(p0, p1, p2, p3)
	return _in(0x69EF772B192614C1, p0, p1, p2, p3)
end

function Global.N_0x6a1738b4323fe2d9(p0)
	return _in(0x6A1738B4323FE2D9, p0)
end

function Global.N_0x6a51f78772175a51(p0)
	return _in(0x6A51F78772175A51, p0)
end

function Global.N_0x6a60e43998228229(p0)
	return _in(0x6A60E43998228229, p0)
end

function Global.N_0x6bc0acd0673acebe(p0, p1, p2)
	return _in(0x6BC0ACD0673ACEBE, p0, p1, p2)
end

function Global.N_0x6bc97f4f4bb3c04b(p0, p1)
	return _in(0x6BC97F4F4BB3C04B, p0, p1)
end

function Global.N_0x6bccf9948492fd85(p0, p1, p2, p3, p4)
	return _in(0x6BCCF9948492FD85, p0, p1, p2, p3, p4)
end

function Global.N_0x6cdd58146a436083(p0)
	return _in(0x6CDD58146A436083, p0)
end

function Global.N_0x6ce177d014502e8a(p0)
	return _in(0x6CE177D014502E8A, p0)
end

function Global.N_0x6ce50e47f5543d0c()
	return _in(0x6CE50E47F5543D0C)
end

function Global.N_0x6e0a5253375c4584()
	return _in(0x6E0A5253375C4584, _r, _ri)
end

function Global.N_0x6e4361ff3e8cd7ca(p0)
	return _in(0x6E4361FF3E8CD7CA, p0, _r, _ri)
end

function Global.N_0x6eaaefc76acc311f(p0)
	return _in(0x6EAAEFC76ACC311F, p0, _r, _ri)
end

function Global.N_0x6fd97159fe3c971a(p0, p1, p2, p3)
	return _in(0x6FD97159FE3C971A, p0, p1, p2, p3)
end

function Global.N_0x7033eefd9b28088e(p0)
	return _in(0x7033EEFD9B28088E, p0)
end

function Global.N_0x705a844002b39dc0()
	return _in(0x705A844002B39DC0, _r, _ri)
end

function Global.N_0x711794453cfd692b(p0, p1)
	return _in(0x711794453CFD692B, p0, p1)
end

function Global.N_0x71302ec70689052a(p0)
	return _in(0x71302EC70689052A, p0, _r, _ri)
end

function Global.N_0x71dc455f5cd1c2b1(p0)
	return _in(0x71DC455F5CD1C2B1, p0, _r, _ri)
end

function Global.N_0x7241ccb7d020db69(p0, p1)
	return _in(0x7241CCB7D020DB69, p0, p1)
end

function Global.N_0x7242f8b741ce1086(p0)
	return _in(0x7242F8B741CE1086, p0, _r, _ri)
end

function Global.N_0x72beccf4b829522e(p0, p1)
	return _in(0x72BECCF4B829522E, p0, p1)
end

function Global.N_0x73001e34f85137f8(p0)
	return _in(0x73001E34F85137F8, p0)
end

function Global.N_0x73561d4425a021a2(p0, p1)
	return _in(0x73561D4425A021A2, p0, p1)
end

function Global.N_0x736d7aa1b750856b(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31)
	return _in(0x736D7AA1B750856B, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31)
end

function Global.N_0x737e398138550fff(p0, p1)
	return _in(0x737E398138550FFF, p0, p1)
end

function Global.N_0x756ae6e962168a04(p0, p1)
	return _in(0x756AE6E962168A04, p0, p1)
end

function Global.N_0x758a5c1b3b1e1990(p0)
	return _in(0x758A5C1B3B1E1990, p0)
end

function Global.N_0x76bba2cee66d47e9(p0)
	return _in(0x76BBA2CEE66D47E9, p0, _r, _ri)
end

function Global.N_0x76d26a22750e849e(p0)
	return _in(0x76D26A22750E849E, p0)
end

function Global.N_0x77fe3402004cd1b0(p0)
	return _in(0x77FE3402004CD1B0, p0)
end

function Global.N_0x78ceee41f49f421f(p0, p1)
	return _in(0x78CEEE41F49F421F, p0, p1)
end

function Global.N_0x792271ab35c356a4(p0, p1)
	return _in(0x792271AB35C356A4, p0, p1)
end

function Global.N_0x799017f9e3b10112(p0, p1, p2, p3, p4, p5, p6, p7)
	return _in(0x799017F9E3B10112, p0, p1, p2, p3, p4, p5, p6, p7)
end

function Global.N_0x7b18da61f6bae9d5(p0)
	return _in(0x7B18DA61F6BAE9D5, p0)
end

function Global.N_0x7b8a361c1813fbef()
	return _in(0x7B8A361C1813FBEF)
end

function Global.N_0x7bbe7ff626a591fe(p0)
	return _in(0x7BBE7FF626A591FE, p0)
end

function Global.N_0x7c06330bfdda182e(p0)
	return _in(0x7C06330BFDDA182E, p0)
end

function Global.N_0x7c226d5346d4d10a(p0)
	return _in(0x7C226D5346D4D10A, p0)
end

function Global.N_0x7d36291161859389(p0)
	return _in(0x7D36291161859389, p0)
end

function Global.N_0x7d8ba05688ad64c7(p0)
	return _in(0x7D8BA05688AD64C7, p0)
end

function Global.N_0x7db18ca8cad5b098()
	return _in(0x7DB18CA8CAD5B098, _r, _ri)
end

function Global.N_0x7e07c78925d5fd96(p0)
	return _in(0x7E07C78925D5FD96, p0, _r, _ri)
end

function Global.N_0x7ec3c679d0e7e46b(p0, p1, p2, p3)
	return _in(0x7EC3C679D0E7E46B, p0, p1, p2, p3)
end

function Global.N_0x7ef7649b64d7ff10(p0)
	return _in(0x7EF7649B64D7FF10, p0, _r, _ri)
end

function Global.N_0x801879a9b4f4b2fb()
	return _in(0x801879A9B4F4B2FB, _r, _ri)
end

function Global.N_0x80e3357fdef45c21(vehicle, toggle)
	return _in(0x80E3357FDEF45C21, vehicle, toggle)
end

function Global.N_0x814af7dcaacc597b(p0)
	return _in(0x814AF7DCAACC597B, p0)
end

function Global.N_0x815f18ad865f057f(p0)
	return _in(0x815F18AD865F057F, p0, _r, _ri)
end

function Global.N_0x8181ce2f25cb9bb7(p0, p1)
	return _in(0x8181CE2F25CB9BB7, p0, p1, _r, _ri)
end

function Global.N_0x81aa517fbba05d39(p0)
	return _in(0x81AA517FBBA05D39, p0, _r, _ri)
end

function Global.N_0x820e9892a77e97cd(p0, p1)
	return _in(0x820E9892A77E97CD, p0, p1)
end

function Global.N_0x821418c727fcacd7(p0)
	return _in(0x821418C727FCACD7, p0)
end

function Global.N_0x821fdc827d6f4090(p0)
	return _in(0x821FDC827D6F4090, p0)
end

function Global.N_0x826d1ee4d1cafc78(p0, p1)
	return _in(0x826D1EE4D1CAFC78, p0, p1)
end

function Global.N_0x82a2b386716608f1()
	return _in(0x82A2B386716608F1, _r, _ri)
end

function Global.N_0x82acc484ffa3b05f(p0)
	return _in(0x82ACC484FFA3B05F, p0, _r, _ri)
end

function Global.N_0x83660b734994124d(p0, p1, p2)
	return _in(0x83660B734994124D, p0, p1, p2, _r, _ri)
end

function Global.N_0x838da0936a24ed4d(p0, p1)
	return _in(0x838DA0936A24ED4D, p0, p1)
end

function Global.N_0x83f813570ff519de(p0, p1)
	return _in(0x83F813570FF519DE, p0, p1)
end

function Global.N_0x848b66100ee33b05(p0)
	return _in(0x848B66100EE33B05, p0)
end

function Global.N_0x84a810b375e69c0e()
	return _in(0x84A810B375E69C0E, _r, _ri)
end

function Global.N_0x84c0116d012e8fc2(p0)
	return _in(0x84C0116D012E8FC2, p0)
end

function Global.N_0x84dfc579c2fc214c(p0)
	return _in(0x84DFC579C2FC214C, p0)
end

function Global.N_0x84ea99c62cb3ef0c(p0, p1, p2)
	return _in(0x84EA99C62CB3EF0C, p0, p1, p2)
end

function Global.N_0x8533cafde1f0f336(p0)
	return _in(0x8533CAFDE1F0F336, p0, _r, _ri)
end

function Global.N_0x8586789730b10caf(p0, p1, p2, p3)
	return _in(0x8586789730B10CAF, p0, p1, p2, p3)
end

function Global.N_0x858ec9fd25de04aa(p0, p1)
	return _in(0x858EC9FD25DE04AA, p0, p1)
end

function Global.N_0x867458251d47ccb2(p0, p1)
	return _in(0x867458251D47CCB2, p0, p1)
end

function Global.N_0x86b4b6212cb8b627(p0, p1)
	return _in(0x86B4B6212CB8B627, p0, p1)
end

function Global.N_0x870b8b7a766615c8(p0, p1, p2)
	return _in(0x870B8B7A766615C8, p0, p1, p2)
end

function Global.N_0x878c75c09fbdb942()
	return _in(0x878C75C09FBDB942, _r, _ri)
end

function Global.N_0x87ddeb611b329a9c(p0)
	return _in(0x87DDEB611B329A9C, p0)
end

function Global.N_0x88087ee1f28024ae(p0)
	return _in(0x88087EE1F28024AE, p0)
end

function Global.N_0x8881c98a31117998(p0)
	return _in(0x8881C98A31117998, p0)
end

function Global.N_0x8989cbd7b4e82534(p0, p1, p2, p3, p4, p5, p6)
	return _in(0x8989CBD7B4E82534, p0, p1, p2, p3, p4, p5, p6)
end

function Global.N_0x8a24b067d175a7bd(p0, p1, p2, p3, p4, p5)
	return _in(0x8A24B067D175A7BD, p0, p1, p2, p3, p4, p5, _r, _ri)
end

function Global.N_0x8a800daccc0da55d()
	return _in(0x8A800DACCC0DA55D)
end

function Global.N_0x8b4ffc790ca131ef(p0, p1, p2, p3)
	return _in(0x8B4FFC790CA131EF, p0, p1, p2, p3, _r, _ri)
end

function Global.N_0x8b9cdbd6c566c38c()
	return _in(0x8B9CDBD6C566C38C, _r, _ri)
end

function Global.N_0x8bc515bae4aaf8ff(p0)
	return _in(0x8BC515BAE4AAF8FF, p0, _r, _ri)
end

function Global.N_0x8c33220c8d78ca0d(p0, p1)
	return _in(0x8C33220C8D78CA0D, p0, p1)
end

function Global.N_0x8c9d11605e59d955(p0)
	return _in(0x8C9D11605E59D955, p0)
end

function Global.N_0x8caab2bd3ea58bd4(p0)
	return _in(0x8CAAB2BD3EA58BD4, p0)
end

function Global.N_0x8d768602adef2245(p0, p1)
	return _in(0x8D768602ADEF2245, p0, p1)
end

function Global.N_0x8d8adb562f09a245(p0)
	return _in(0x8D8ADB562F09A245, p0)
end

function Global.N_0x8e243837643d9583(p0, p1, p2, p3)
	return _in(0x8E243837643D9583, p0, p1, p2, p3)
end

function Global.N_0x8ea86df356801c7d(p0, p1)
	return _in(0x8EA86DF356801C7D, p0, p1)
end

function Global.N_0x8f5d1ad832aeb06c(p0)
	return _in(0x8F5D1AD832AEB06C, p0, _r, _ri)
end

function Global.N_0x91ef34584710be99(p0, p1, p2, p3, p4, p5, p6, p7)
	return _in(0x91EF34584710BE99, p0, p1, p2, p3, p4, p5, p6, p7, _r, _ri)
end

function Global.N_0x9251b6abf2d0a5b4(p0, p1)
	return _in(0x9251B6ABF2D0A5B4, p0, p1)
end

function Global.N_0x928dbfb892638ef3()
	return _in(0x928DBFB892638EF3)
end

function Global.N_0x92c360b5f15d2302(p0, p1, p2, p3, p4, p5, p6)
	return _in(0x92C360B5F15D2302, p0, p1, p2, p3, p4, p5, p6)
end

function Global.N_0x930f504203f561c9(p0)
	return _in(0x930F504203F561C9, p0)
end

function Global.N_0x95eb5e34f821babe(p0, p1, p2)
	return _in(0x95EB5E34F821BABE, p0, p1, p2, _r, _ri)
end

function Global.N_0x9641588dab93b4b5(p0)
	return _in(0x9641588DAB93B4B5, p0)
end

function Global.N_0x96e6d5150dbf1c09(p0, p1, p2)
	return _in(0x96E6D5150DBF1C09, p0, p1, p2)
end

function Global.N_0x96ee0eba0163df80(p0, p1)
	return _in(0x96EE0EBA0163DF80, p0, p1)
end

function Global.N_0x9777734dad16992f()
	return _in(0x9777734DAD16992F, _r, _ri)
end

function Global.N_0x977ca98939e82e4b(p0, p1)
	return _in(0x977CA98939E82E4B, p0, p1)
end

function Global.N_0x98c3cf913d895111(p0, p1)
	return _in(0x98C3CF913D895111, p0, p1, _r, _ri)
end

function Global.N_0x99093f60746708ca(p0)
	return _in(0x99093F60746708CA, p0, _r, _ri)
end

function Global.N_0x998e18ceb44487fc(p0, p1, p2, p3)
	return _in(0x998E18CEB44487FC, p0, p1, p2, p3)
end

function Global.N_0x9a53ded9921de990(p0, p1)
	return _in(0x9A53DED9921DE990, p0, p1)
end

function Global.N_0x9c16459b2324b2cf(p0, p1)
	return _in(0x9C16459B2324B2CF, p0, p1)
end

function Global.N_0x9d30687c57baa0bb(p0)
	return _in(0x9D30687C57BAA0BB, p0)
end

function Global.N_0x9d75795b9dc6ebbf(p0)
	return _in(0x9D75795B9DC6EBBF, p0)
end

function Global.N_0x9da58cdbf6bdbc08(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	return _in(0x9DA58CDBF6BDBC08, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, _r, _ri)
end

function Global.N_0x9e82f0f362881b29(p0, p1, p2, p3, p4)
	return _in(0x9E82F0F362881B29, p0, p1, p2, p3, p4, _r, _ri)
end

function Global.N_0x9ebd751e5787baf2(p0)
	return _in(0x9EBD751E5787BAF2, p0)
end

function Global.N_0x9ec8858184cd253a()
	return _in(0x9EC8858184CD253A, _r, _ri)
end

function Global.N_0x9eca15adfe141431()
	return _in(0x9ECA15ADFE141431, _r, _ri)
end

function Global.N_0x9fe5633880ecd8ed(p0, p1, p2, p3)
	return _in(0x9FE5633880ECD8ED, p0, p1, p2, p3)
end

function Global.N_0xa0d3e4f7aafb7e78(p0, p1)
	return _in(0xA0D3E4F7AAFB7E78, p0, p1, _r, _ri)
end

function Global.N_0xa0f8a7517a273c05(p0, p1, p2, p3, p4)
	return _in(0xA0F8A7517A273C05, p0, p1, p2, p3, p4, _r, _ri)
end

function Global.N_0xa12d3a5a3753cc23()
	return _in(0xA12D3A5A3753CC23, _r, _ri)
end

function Global.N_0xa17784fca9548d15(p0, p1, p2)
	return _in(0xA17784FCA9548D15, p0, p1, p2)
end

function Global.N_0xa1a9fc1c76a6730d(p0)
	return _in(0xA1A9FC1C76A6730D, p0, _r, _ri)
end

function Global.N_0xa1dd82f3ccf9a01e(p0, p1, p2, p3, p4, p5)
	return _in(0xA1DD82F3CCF9A01E, p0, p1, p2, p3, p4, p5)
end

function Global.N_0xa247f9ef01d8082e(p0)
	return _in(0xA247F9EF01D8082E, p0)
end

function Global.N_0xa2a707979fe754dc(p0, p1)
	return _in(0xA2A707979FE754DC, p0, p1)
end

function Global.N_0xa2c9ac24b4061285(p0, p1)
	return _in(0xA2C9AC24B4061285, p0, p1, _r, _ri)
end

function Global.N_0xa3c53804bdb68ed2(p0, p1)
	return _in(0xA3C53804BDB68ED2, p0, p1)
end

function Global.N_0xa40cc53df8e50837(p0, args, argCount, bit)
	return _in(0xA40CC53DF8E50837, p0, args, argCount, bit)
end

function Global.N_0xa51b086b0b2c0f7a(p0, p1, p2, p3)
	return _in(0xA51B086B0B2C0F7A, p0, p1, p2, p3)
end

function Global.N_0xa6d3a8750dc73270(p0, p1)
	return _in(0xA6D3A8750DC73270, p0, p1)
end

function Global.N_0xa6f54bb2ffca35ea(p0)
	return _in(0xA6F54BB2FFCA35EA, p0)
end

function Global.N_0xa75ccf58a60a5fd1(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9)
	return _in(0xA75CCF58A60A5FD1, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9)
end

function Global.N_0xa761d4ac6115623d()
	return _in(0xA761D4AC6115623D, _r, _ri)
end

function Global.N_0xa78de25577300ba1(p0)
	return _in(0xA78DE25577300BA1, p0)
end

function Global.N_0xa7c511fa1c5bda38(p0, p1)
	return _in(0xA7C511FA1C5BDA38, p0, p1)
end

function Global.N_0xa8b6afdac320ac87(p0, p1)
	return _in(0xA8B6AFDAC320AC87, p0, p1)
end

function Global.N_0xa90e7227a9303fa9(p0, p1)
	return _in(0xA90E7227A9303FA9, p0, p1)
end

function Global.N_0xa943fd1722e11efd()
	return _in(0xA943FD1722E11EFD, _r, _ri)
end

function Global.N_0xa95f667a755725da(p0, p1, p2, p3)
	return _in(0xA95F667A755725DA, p0, p1, p2, p3)
end

function Global.N_0xaa3f739abddcf21f()
	return _in(0xAA3F739ABDDCF21F)
end

function Global.N_0xaa525dff66bb82f5(p0, p1, p2)
	return _in(0xAA525DFF66BB82F5, p0, p1, p2)
end

function Global.N_0xaa5fafcd2c5f5e47()
	return _in(0xAA5FAFCD2C5F5E47, _r, _ri)
end

function Global.N_0xab31ef4de6800ce9(p0, p1)
	return _in(0xAB31EF4DE6800CE9, p0, p1)
end

function Global.N_0xac272c0ae01b4bd8(p0, p1, p2, p3)
	return _in(0xAC272C0AE01B4BD8, p0, p1, p2, p3)
end

function Global.N_0xaf03011701811146(p0, p1)
	return _in(0xAF03011701811146, p0, p1, _r, _ri)
end

function Global.N_0xaf60e6a2936f982a(p0, p1)
	return _in(0xAF60E6A2936F982A, p0, p1)
end

function Global.N_0xaff47709f1d5dcce()
	return _in(0xAFF47709F1D5DCCE, _r, _ri)
end

function Global.N_0xb09d25e77c33eb3f(p0, p1, p2)
	return _in(0xB09D25E77C33EB3F, p0, p1, p2, _r, _ri)
end

function Global.N_0xb0ad1238a709b1a2(p0)
	return _in(0xB0AD1238A709B1A2, p0, _r, _ri)
end

--- Called in decompiled scripts as alternative to _SET_PED_ENEMY_AI_BLIP in an else, when the additional parameter p3 is not -1
function Global.N_0xb13dcb4c6faad238(ped, toggle, p3)
	return _in(0xB13DCB4C6FAAD238, ped, toggle, p3)
end

function Global.N_0xb17bc6453f6cf5ac(p0, p1)
	return _in(0xB17BC6453F6CF5AC, p0, p1)
end

function Global.N_0xb2092a1eaa7fd45f(p0)
	return _in(0xB2092A1EAA7FD45F, p0, _r, _ri)
end

function Global.N_0xb214d570ead7f81a(p0, p1)
	return _in(0xB214D570EAD7F81A, p0, p1)
end

function Global.N_0xb282749d5e028163(p0, p1)
	return _in(0xB282749D5E028163, p0, p1)
end

function Global.N_0xb2e0c0d6922d31f2(vehicle, toggle)
	return _in(0xB2E0C0D6922D31F2, vehicle, toggle)
end

function Global.N_0xb328dcc3a3aa401b(p0)
	return _in(0xB328DCC3A3AA401B, p0, _r, _ri)
end

function Global.N_0xb3ea4feabf41464b(p0, p1)
	return _in(0xB3EA4FEABF41464B, p0, p1, _r, _ri)
end

function Global.N_0xb3eca65c7317f174()
	return _in(0xB3ECA65C7317F174, _r, _ri)
end

function Global.N_0xb4771b9aaf4e68e4(p0, p1, p2)
	return _in(0xB4771B9AAF4E68E4, p0, p1, p2)
end

function Global.N_0xb49eca122467d05f(p0, p1, p2, p3)
	return _in(0xB49ECA122467D05F, p0, p1, p2, p3)
end

function Global.N_0xb4c2ec463672474e(p0, p1, p2, p3)
	return _in(0xB4C2EC463672474E, p0, p1, p2, p3)
end

function Global.N_0xb552929b85fc27ec(p0, p1)
	return _in(0xB552929B85FC27EC, p0, p1)
end

function Global.N_0xb569f41f3e7e83a4(p0)
	return _in(0xB569F41F3E7E83A4, p0)
end

function Global.N_0xb7257ba2550ea10a(p0, p1, p2, p3, p4, p5, p6)
	return _in(0xB7257BA2550EA10A, p0, p1, p2, p3, p4, p5, p6)
end

function Global.N_0xb81cf134aeb56ffb()
	return _in(0xB81CF134AEB56FFB)
end

function Global.N_0xb9496ce47546db2c(p0)
	return _in(0xB9496CE47546DB2C, p0, _r, _ri)
end

function Global.N_0xb9562064627ff9db(p0, p1)
	return _in(0xB9562064627FF9DB, p0, p1)
end

function Global.N_0xb9c362babecddc7a(p0, p1, p2, p3, p4)
	return _in(0xB9C362BABECDDC7A, p0, p1, p2, p3, p4)
end

function Global.N_0xba0127da25fd54c9(p0, p1)
	return _in(0xBA0127DA25FD54C9, p0, p1)
end

function Global.N_0xba3d194057c79a7b(p0)
	return _in(0xBA3D194057C79A7B, p0)
end

function Global.N_0xba7f0b77d80a4eb7(p0, p1)
	return _in(0xBA7F0B77D80A4EB7, p0, p1)
end

function Global.N_0xba8805a1108a2515(p0)
	return _in(0xBA8805A1108A2515, p0, _r, _ri)
end

function Global.N_0xba91d045575699ad(p0)
	return _in(0xBA91D045575699AD, p0, _r, _ri)
end

function Global.N_0xba9749cc94c1fd85()
	return _in(0xBA9749CC94C1FD85, _r, _ri)
end

function Global.N_0xbaa045b4e42f3c06(p0, p1)
	return _in(0xBAA045B4E42F3C06, p0, p1)
end

function Global.N_0xbaa2f0490e146be8(p0)
	return _in(0xBAA2F0490E146BE8, p0)
end

function Global.N_0xbb2333bb87ddd87f(p0, p1)
	return _in(0xBB2333BB87DDD87F, p0, p1)
end

function Global.N_0xbcfde9ede4cf27dc(p0, p1)
	return _in(0xBCFDE9EDE4CF27DC, p0, p1)
end

function Global.N_0xbd0efb25cca8f97a(p0, p1, p2, p3)
	return _in(0xBD0EFB25CCA8F97A, p0, p1, p2, p3)
end

function Global.N_0xbd32e46aa95c1dd2(p0)
	return _in(0xBD32E46AA95C1DD2, p0)
end

function Global.N_0xbe3db208333d9844()
	return _in(0xBE3DB208333D9844, _r, _ri)
end

function Global.N_0xbe509b0a3693de8b(p0)
	return _in(0xBE509B0A3693DE8B, p0)
end

function Global.N_0xbec0816ff5acbcda(p0, p1)
	return _in(0xBEC0816FF5ACBCDA, p0, p1)
end

function Global.N_0xbf371cd2b64212fd(p0)
	return _in(0xBF371CD2B64212FD, p0)
end

function Global.N_0xbfafdb5faaa5c5ab(p0)
	return _in(0xBFAFDB5FAAA5C5AB, p0)
end

function Global.N_0xc0ed6438e6d39ba8(p0, p1, p2)
	return _in(0xC0ED6438E6D39BA8, p0, p1, p2)
end

function Global.N_0xc1952f3773ba18fe(p0, p1, p2)
	return _in(0xC1952F3773BA18FE, p0, p1, p2)
end

function Global.N_0xc24075310a8b9cd1(p0, p1, p2, p3, p4)
	return _in(0xC24075310A8B9CD1, p0, p1, p2, p3, p4)
end

function Global.N_0xc2d2ad9eaae265b8()
	return _in(0xC2D2AD9EAAE265B8, _r, _ri)
end

function Global.N_0xc34bc448da29f5e9(p0, p1)
	return _in(0xC34BC448DA29F5E9, p0, p1)
end

function Global.N_0xc388a0f065f5bc34(p0, p1)
	return _in(0xC388A0F065F5BC34, p0, p1)
end

function Global.N_0xc3bfed92026a2aad(p0, p1, p2, p3, p4)
	return _in(0xC3BFED92026A2AAD, p0, p1, p2, p3, p4, _r, _ri)
end

function Global.N_0xc434133d9ba52777(p0, p1)
	return _in(0xC434133D9BA52777, p0, p1, _r, _ri)
end

function Global.N_0xc4b3347bd68bd609(p0)
	return _in(0xC4B3347BD68BD609, p0)
end

function Global.N_0xc5c8f970d4edff71(p0)
	return _in(0xC5C8F970D4EDFF71, p0)
end

function Global.N_0xc729991a9065376e(p0)
	return _in(0xC729991A9065376E, p0)
end

function Global.N_0xc8407624cef2354b(p0, p1)
	return _in(0xC8407624CEF2354B, p0, p1)
end

function Global.N_0xca465d9cc0d231ba(p0)
	return _in(0xCA465D9CC0D231BA, p0)
end

function Global.N_0xca4ac3eaae46ec7b(p0, p1)
	return _in(0xCA4AC3EAAE46EC7B, p0, p1, _r, _ri)
end

function Global.N_0xcb645e85e97ea48b()
	return _in(0xCB645E85E97EA48B, _r, _ri)
end

function Global.N_0xcc25a4553dfbf9ea(p0, p1, p2, p3, p4)
	return _in(0xCC25A4553DFBF9EA, p0, p1, p2, p3, p4)
end

function Global.N_0xcc6e3b6bb69501f1(p0)
	return _in(0xCC6E3B6BB69501F1, p0, _r, _ri)
end

function Global.N_0xcd74233600c4ea6b(p0)
	return _in(0xCD74233600C4EA6B, p0)
end

function Global.N_0xcd79a550999d7d4f(p0)
	return _in(0xCD79A550999D7D4F, p0, _r, _ri)
end

function Global.N_0xcda1c62be2777802(p0, p1, p2)
	return _in(0xCDA1C62BE2777802, p0, p1, p2)
end

function Global.N_0xce5d0e5e315db238(p0, p1, p2, p3, p4)
	return _in(0xCE5D0E5E315DB238, p0, p1, p2, p3, p4, _r, _ri)
end

function Global.N_0xce6294a232d03786(p0, p1)
	return _in(0xCE6294A232D03786, p0, p1, _r, _rv)
end

function Global.N_0xcea553e35c2246e1(p0, p1, p2)
	return _in(0xCEA553E35C2246E1, p0, p1, p2)
end

function Global.N_0xcea7c8e1b48ff68c(p0, p1)
	return _in(0xCEA7C8E1B48FF68C, p0, p1)
end

function Global.N_0xcf9159024555488c(p0)
	return _in(0xCF9159024555488C, p0)
end

function Global.N_0xd12882d3ff82bf11()
	return _in(0xD12882D3FF82BF11)
end

function Global.N_0xd1942374085c8469(p0)
	return _in(0xD1942374085C8469, p0)
end

function Global.N_0xd1a1ee3b4fa8e760(p0)
	return _in(0xD1A1EE3B4FA8E760, p0)
end

function Global.N_0xd1c9b92bdd3f151d(p0, p1, p2)
	return _in(0xD1C9B92BDD3F151D, p0, p1, p2)
end

function Global.N_0xd3301660a57c9272(p0)
	return _in(0xD3301660A57C9272, p0)
end

function Global.N_0xd3e51c0ab8c26eee(p0, p1)
	return _in(0xD3E51C0AB8C26EEE, p0, p1, _r, _ri)
end

function Global.N_0xd40aac51e8e4c663(p0)
	return _in(0xD40AAC51E8E4C663, p0, _r, _ri)
end

function Global.N_0xd4196117af7bb974(p0, p1)
	return _in(0xD4196117AF7BB974, p0, p1, _r, _ri)
end

function Global.N_0xd558bec0bba7e8d2(p0, p1, p2, p3, p4)
	return _in(0xD558BEC0BBA7E8D2, p0, p1, p2, p3, p4)
end

function Global.N_0xd565f438137f0e10(p0, p1)
	return _in(0xD565F438137F0E10, p0, p1)
end

function Global.N_0xd6781e42755531f7(p0)
	return _in(0xD6781E42755531F7, p0)
end

function Global.N_0xd7360051c885628b()
	return _in(0xD7360051C885628B, _r, _ri)
end

function Global.N_0xd76eeef746057fd6(p0)
	return _in(0xD76EEEF746057FD6, p0, _r, _ri)
end

function Global.N_0xd7b6c73cad419bcf(p0)
	return _in(0xD7B6C73CAD419BCF, p0)
end

function Global.N_0xd7cccba28c4ecaf0(p0, p1, p2, p3, p4)
	return _in(0xD7CCCBA28C4ECAF0, p0, p1, p2, p3, p4)
end

function Global.N_0xd80a80346a45d761(p0)
	return _in(0xD80A80346A45D761, p0, _r, _ri)
end

function Global.N_0xd81b7f27bc773e66(p0, p1, p2, p3, p4)
	return _in(0xD81B7F27BC773E66, p0, p1, p2, p3, p4)
end

function Global.N_0xd821056b9acf8052(p0, p1)
	return _in(0xD821056B9ACF8052, p0, p1)
end

function Global.N_0xd95cc5d2ab15a09f(p0)
	return _in(0xD95CC5D2AB15A09F, p0, _r, _ri)
end

function Global.N_0xd99db210089617fe(p0, p1, p2)
	return _in(0xD99DB210089617FE, p0, p1, p2)
end

function Global.N_0xda05194260cdcdf9(p0, p1)
	return _in(0xDA05194260CDCDF9, p0, p1)
end

function Global.N_0xda07819e452ffe8f(p0)
	return _in(0xDA07819E452FFE8F, p0)
end

function Global.N_0xdab963831dbfd3f4(p0, p1, p2, p3, p4)
	return _in(0xDAB963831DBFD3F4, p0, p1, p2, p3, p4, _r, _ri)
end

function Global.N_0xdaf80797fc534bec(p0)
	return _in(0xDAF80797FC534BEC, p0)
end

function Global.N_0xdbc966a01c02bca7(p0, p1, p2)
	return _in(0xDBC966A01C02BCA7, p0, p1, p2)
end

function Global.N_0xdce97bdf8a0eabc8()
	return _in(0xDCE97BDF8A0EABC8, _r, _ri)
end

function Global.N_0xdf6ca0330f2e737b(p0, p1)
	return _in(0xDF6CA0330F2E737B, p0, p1)
end

function Global.N_0xdffa5be8381c3314()
	return _in(0xDFFA5BE8381C3314, _r, _ri)
end

function Global.N_0xe16aa70ce9beedc3(p0)
	return _in(0xE16AA70CE9BEEDC3, p0, _r, _ri)
end

function Global.N_0xe23adc6fcb1f29ae(p0, p1, p2)
	return _in(0xE23ADC6FCB1F29AE, p0, p1, p2)
end

function Global.N_0xe2f53f172b45ede1()
	return _in(0xE2F53F172B45EDE1)
end

function Global.N_0xe3261d791eb44acb(p0)
	return _in(0xE3261D791EB44ACB, p0)
end

function Global.N_0xe35b38a27e8e7179(p0)
	return _in(0xE35B38A27E8E7179, p0, _r, _ri)
end

function Global.N_0xe4e2fd323574965c(p0, p1)
	return _in(0xE4E2FD323574965C, p0, p1)
end

function Global.N_0xe547e9114277098f()
	return _in(0xE547E9114277098F, _r, _ri)
end

function Global.N_0xe574a662acaefbb1()
	return _in(0xE574A662ACAEFBB1)
end

function Global.N_0xe6717e652b8c8d8a(p0, p1)
	return _in(0xE6717E652B8C8D8A, p0, p1)
end

function Global.N_0xe6a9f00d4240b519(p0, p1)
	return _in(0xE6A9F00D4240B519, p0, p1)
end

function Global.N_0xe7df4e0545dfb56e(p0, p1, p2)
	return _in(0xE7DF4E0545DFB56E, p0, p1, p2)
end

function Global.N_0xe82728f0de75d13a(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24)
	return _in(0xE82728F0DE75D13A, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24)
end

function Global.N_0xe827b9382cfb41ba(p0, p1, p2, p3)
	return _in(0xE827B9382CFB41BA, p0, p1, p2, p3)
end

function Global.N_0xe84eb93729c5f36a(p0)
	return _in(0xE84EB93729C5F36A, p0, _r, _ri)
end

function Global.N_0xe8853fbce7d8d0d6()
	return _in(0xE8853FBCE7D8D0D6, _r, _ri)
end

function Global.N_0xe8b0b270b6e7c76e(p0, p1, p2, p3)
	return _in(0xE8B0B270B6E7C76E, p0, p1, p2, p3)
end

function Global.N_0xe906ec930f5fe7c8(p0, p1)
	return _in(0xE906EC930F5FE7C8, p0, p1)
end

function Global.N_0xeb2bf817463dfa28(p0, p1)
	return _in(0xEB2BF817463DFA28, p0, p1, _r, _ri)
end

function Global.N_0xec69adf931aae0c3(p0)
	return _in(0xEC69ADF931AAE0C3, p0, _r, _ri)
end

function Global.N_0xeca658ce2a4e5a72(p0, p1)
	return _in(0xECA658CE2A4E5A72, p0, p1)
end

function Global.N_0xecdc202b25e5cf48(p0, p1, p2)
	return _in(0xECDC202B25E5CF48, p0, p1, p2)
end

function Global.N_0xed5ede9e676643c9(p0, p1)
	return _in(0xED5EDE9E676643C9, p0, p1)
end

function Global.N_0xed5fd7af10f5e262(p0, p1, p2, p3)
	return _in(0xED5FD7AF10F5E262, p0, p1, p2, p3)
end

function Global.N_0xedbc8405b3895cc9(p0, p1)
	return _in(0xEDBC8405B3895CC9, p0, p1)
end

function Global.N_0xedbf6c9b0d2c65c8(p0)
	return _in(0xEDBF6C9B0D2C65C8, p0)
end

function Global.N_0xedead9a91ec768b3(p0, p1, p2)
	return _in(0xEDEAD9A91EC768B3, p0, p1, p2)
end

function Global.N_0xefc13b1ce30d755d(p0, p1)
	return _in(0xEFC13B1CE30D755D, p0, p1)
end

function Global.N_0xefd79fa81dfba9cb(p0, p1)
	return _in(0xEFD79FA81DFBA9CB, p0, p1)
end

function Global.N_0xefd97ff47b745b8d(p0)
	return _in(0xEFD97FF47B745B8D, p0)
end

function Global.N_0xeff296097ff1e509(p0, p1)
	return _in(0xEFF296097FF1E509, p0, p1)
end

function Global.N_0xf051d9bfb6ba39c0(p0)
	return _in(0xF051D9BFB6BA39C0, p0)
end

function Global.N_0xf06a16ca55d138d8(p0, p1)
	return _in(0xF06A16CA55D138D8, p0, p1)
end

function Global.N_0xf06a6f41cb445443(p0)
	return _in(0xF06A6F41CB445443, p0)
end

function Global.N_0xf0a60040be558f2d(p0, p1, p2)
	return _in(0xF0A60040BE558F2D, p0, p1, p2, _r, _ri)
end

function Global.N_0xf11f01d98113536a(p0)
	return _in(0xF11F01D98113536A, p0, _r, _ri)
end

function Global.N_0xf12e33034d887f66(p0, p1, p2, p3, p4, p5)
	return _in(0xF12E33034D887F66, p0, p1, p2, p3, p4, p5, _r, _ri)
end

function Global.N_0xf12e6cd06c73d69e()
	return _in(0xF12E6CD06C73D69E, _r, _ri)
end

function Global.N_0xf287f506767cc8a9()
	return _in(0xF287F506767CC8A9, _r, _ri)
end

function Global.N_0xf3162836c28f9da5(p0, p1, p2, p3)
	return _in(0xF3162836C28F9DA5, p0, p1, p2, p3, _r, _ri)
end

function Global.N_0xf3b0e0aed097a3f5(p0, p1)
	return _in(0xF3B0E0AED097A3F5, p0, p1, _r, _ri)
end

function Global.N_0xf47e567b3630dd12(p0, p1)
	return _in(0xF47E567B3630DD12, p0, p1)
end

function Global.N_0xf534d94dfa2ead26(p0, p1, p2, p3, p4)
	return _in(0xF534D94DFA2EAD26, p0, p1, p2, p3, p4)
end

function Global.N_0xf6f4383b7c92f11a(p0)
	return _in(0xF6F4383B7C92F11A, p0)
end

function Global.N_0xf9f2922717b819ec()
	return _in(0xF9F2922717B819EC, _r, _ri)
end

function Global.N_0xfa07759e6fddd7cf(p0, p1, p2, p3)
	return _in(0xFA07759E6FDDD7CF, p0, p1, p2, p3)
end

function Global.N_0xfac75988a7d078d3(p0)
	return _in(0xFAC75988A7D078D3, p0)
end

function Global.N_0xfafc23aee23868db()
	return _in(0xFAFC23AEE23868DB, _r, _ri)
end

function Global.N_0xfb6c4072e9a32e92(p0, p1)
	return _in(0xFB6C4072E9A32E92, p0, p1, _r, _ri)
end

function Global.N_0xfb80ab299d2ee1bd(p0)
	return _in(0xFB80AB299D2EE1BD, p0)
end

function Global.N_0xfc40cbf7b90ca77c(vehicle)
	return _in(0xFC40CBF7B90CA77C, vehicle)
end

function Global.N_0xfc4ee00a7b3bfb76(p0, p1, p2)
	return _in(0xFC4EE00A7B3BFB76, p0, p1, p2)
end

function Global.N_0xfcc228e07217fcac(p0)
	return _in(0xFCC228E07217FCAC, p0)
end

function Global.N_0xfcfacd0db9d7a57d(ped, p1)
	return _in(0xFCFACD0DB9D7A57D, ped, p1)
end

function Global.N_0xfd1695c5d3b05439(p0, p1, p2, p3, p4, p5)
	return _in(0xFD1695C5D3B05439, p0, p1, p2, p3, p4, p5)
end

function Global.N_0xfe205f38aaa58e5b(p0, p1)
	return _in(0xFE205F38AAA58E5B, p0, p1)
end

function Global.N_0xfebfbfdfb66039de(p0)
	return _in(0xFEBFBFDFB66039DE, p0)
end

function Global.N_0xff5992e1c9e65d05(p0)
	return _in(0xFF5992E1C9E65D05, p0)
end

function Global.N_0xffbe02cd385356bd()
	return _in(0xFFBE02CD385356BD, _r, _ri)
end

function Global.RaiseLowerableWheels(vehicle)
	return _in(0xF660602546D27BA8, vehicle)
end

function Global.RegisterCommand(commandName, handler, restricted)
	return _in(0x5fa79b0f, _ts(commandName), _mfr(handler), restricted)
end

--- Registers a specified .gfx file as GFx font library.
-- The .gfx file has to be registered with the streamer already.
-- @param fileName The name of the .gfx file, without extension.
function Global.RegisterFontFile(fileName)
	return _in(0x1b3a363, _ts(fileName))
end

--- Registers a specified font name for use with text draw commands.
-- @param fontName The name of the font in the GFx font library.
-- @return An index to use with [SET\_TEXT\_FONT](#_0x66E0276CC5F6B9DA) and similar natives.
function Global.RegisterFontId(fontName)
	return _in(0xacf6d8ee, _ts(fontName), _r, _ri)
end

function Global.RegisterNuiCallbackType(callbackType)
	return _in(0xcd03cda9, _ts(callbackType))
end

--- Sends a message to the `loadingScreen` NUI frame, which contains the HTML page referenced in `loadscreen` resources.
-- @param jsonString The JSON-encoded message.
-- @return A success value.
function Global.SendLoadingScreenMessage(jsonString)
	return _in(0x8bbe6cc0, _ts(jsonString), _r)
end

function Global.SendNuiMessage(jsonString)
	return _in(0x78608acb, _ts(jsonString), _r)
end

--- Sets a global handling override for a specific vehicle class. The name is supposed to match the `handlingName` field from handling.meta.
-- Example: `SetHandlingField('AIRTUG', 'CHandlingData', 'fSteeringLock', 360.0)`
-- @param vehicle The vehicle class to set data for.
-- @param class The handling class to set. Only "CHandlingData" is supported at this time.
-- @param value The value to set.
-- @param fieldName The field name to set. These match the keys in `handling.meta`.
function Global.SetHandlingField(vehicle, class, fieldName, value)
	return _in(0xfe8064e3, _ts(vehicle), _ts(class), _ts(fieldName), value)
end

--- Sets a global handling override for a specific vehicle class. The name is supposed to match the `handlingName` field from handling.meta.
-- Example: `SetHandlingFloat('AIRTUG', 'CHandlingData', 'fSteeringLock', 360.0)`
-- @param vehicle The vehicle class to set data for.
-- @param class The handling class to set. Only "CHandlingData" is supported at this time.
-- @param value The floating-point value to set.
-- @param fieldName The field name to set. These match the keys in `handling.meta`.
function Global.SetHandlingFloat(vehicle, class, fieldName, value)
	return _in(0x90dd01c, _ts(vehicle), _ts(class), _ts(fieldName), value)
end

--- Sets a global handling override for a specific vehicle class. The name is supposed to match the `handlingName` field from handling.meta.
-- @param vehicle The vehicle class to set data for.
-- @param class The handling class to set. Only "CHandlingData" is supported at this time.
-- @param value The integer value to set.
-- @param fieldName The field name to set. These match the keys in `handling.meta`.
function Global.SetHandlingInt(vehicle, class, fieldName, value)
	return _in(0x8ab3f46c, _ts(vehicle), _ts(class), _ts(fieldName), value)
end

--- Sets a global handling override for a specific vehicle class. The name is supposed to match the `handlingName` field from handling.meta.
-- Example: `SetHandlingVector('AIRTUG', 'CHandlingData', 'vecCentreOfMassOffset', vector3(0.0, 0.0, -5.0))`
-- @param vehicle The vehicle class to set data for.
-- @param class The handling class to set. Only "CHandlingData" is supported at this time.
-- @param value The Vector3 value to set.
-- @param fieldName The field name to set. These match the keys in `handling.meta`.
function Global.SetHandlingVector(vehicle, class, fieldName, value)
	return _in(0x7f9d543, _ts(vehicle), _ts(class), _ts(fieldName), value)
end

function Global.SetInteriorPropColor(interiorID, propName, color)
	return _in(0xC1F1920BAF281317, interiorID, _ts(propName), color)
end

--- Sets whether or not `SHUTDOWN_LOADING_SCREEN` automatically shuts down the NUI frame for the loading screen. If this is enabled,
-- you will have to manually invoke `SHUTDOWN_LOADING_SCREEN_NUI` whenever you want to hide the NUI loading screen.
-- @param manualShutdown TRUE to manually shut down the loading screen NUI.
function Global.SetManualShutdownLoadingScreenNui(manualShutdown)
	return _in(0x1722c938, manualShutdown)
end

--- Sets the display info for a minimap overlay.
-- @param xScale The X scale for the overlay. This is equivalent to the Flash _xscale property, therefore 100 = 100%.
-- @param y The Y position for the overlay. This is equivalent to a game coordinate Y, except that it's inverted (gfxY = -gameY).
-- @param x The X position for the overlay. This is equivalent to a game coordinate X.
-- @param alpha The alpha value for the overlay. This is equivalent to the Flash _alpha property, therefore 100 = 100%.
-- @param yScale The Y scale for the overlay. This is equivalent to the Flash _yscale property.
-- @param miniMap The minimap overlay ID.
function Global.SetMinimapOverlayDisplay(miniMap, x, y, xScale, yScale, alpha)
	return _in(0x6a48b3ca, miniMap, x, y, xScale, yScale, alpha)
end

function Global.SetModelHeadlightConfiguration(modelHash, ratePerSecond, headlightRotation, invertRotation)
	return _in(0x7f6b8d75, _ch(modelHash), ratePerSecond, headlightRotation, invertRotation)
end

function Global.SetNuiFocus(hasFocus, hasCursor)
	return _in(0x5b98ae30, hasFocus, hasCursor)
end

function Global.SetRampVehicleReceivesRampDamage(vehicle, receivesDamage)
	return _in(0x28D034A93FE31BF5, vehicle, receivesDamage)
end

function Global.SetResourceKvp(key, value)
	return _in(0x21c7a35b, _ts(key), _ts(value))
end

function Global.SetResourceKvpFloat(key, value)
	return _in(0x9add2938, _ts(key), value)
end

function Global.SetResourceKvpInt(key, value)
	return _in(0x6a2b1e8, _ts(key), value)
end

--- Sets the player's rich presence detail state for social platform providers to a specified string.
-- @param presenceState The rich presence string to set.
function Global.SetRichPresence(presenceState)
	return _in(0x7bdcbd45, _ts(presenceState))
end

function Global.SetSnakeoilForEntry(name, path, data)
	return _in(0xa7dd3209, _ts(name), _ts(path), _ts(data))
end

function Global.SetTextChatEnabled(enabled)
	return _in(0x97b2f9f8, enabled, _r)
end

function Global.SetVehicleAlarmTimeLeft(vehicle, time)
	return _in(0xc108ee6f, vehicle, time)
end

--- Disables the vehicle from being repaired when a vehicle extra is enabled.
-- @param vehicle The vehicle to set disable auto vehicle repair.
-- @param value Setting the value to  true prevents the vehicle from being repaired when a extra is enabled. Setting the value to false allows the vehicle from being repaired when a extra is enabled.
function Global.SetVehicleAutoRepairDisabled(vehicle, value)
	return _in(0x5f3a3574, vehicle, value)
end

function Global.SetVehicleClutch(vehicle, clutch)
	return _in(0x2f70aced, vehicle, clutch)
end

function Global.SetVehicleCurrentRpm(vehicle, rpm)
	return _in(0x2a01a8fc, vehicle, rpm)
end

function Global.SetVehicleDashboardColour(vehicle, color)
	return _in(0x6089CDF6A57F326C, vehicle, color)
end

function Global.SetVehicleEngineTemperature(vehicle, temperature)
	return _in(0x6c93c4a9, vehicle, temperature)
end

function Global.SetVehicleFuelLevel(vehicle, level)
	return _in(0xba970511, vehicle, level)
end

function Global.SetVehicleGravityAmount(vehicle, gravity)
	return _in(0x1a963e58, vehicle, gravity)
end

--- Sets a handling override for a specific vehicle. Certain handling flags can only be set globally using `SET_HANDLING_FIELD`, this might require some experimentation.
-- Example: `SetVehicleHandlingField(vehicle, 'CHandlingData', 'fSteeringLock', 360.0)`
-- @param vehicle The vehicle to set data for.
-- @param class The handling class to set. Only "CHandlingData" is supported at this time.
-- @param value The value to set.
-- @param fieldName The field name to set. These match the keys in `handling.meta`.
function Global.SetVehicleHandlingField(vehicle, class, fieldName, value)
	return _in(0x2ba40795, vehicle, _ts(class), _ts(fieldName), value)
end

--- Sets a handling override for a specific vehicle. Certain handling flags can only be set globally using `SET_HANDLING_FLOAT`, this might require some experimentation.
-- Example: `SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fSteeringLock', 360.0)`
-- @param vehicle The vehicle to set data for.
-- @param class The handling class to set. Only "CHandlingData" is supported at this time.
-- @param value The floating-point value to set.
-- @param fieldName The field name to set. These match the keys in `handling.meta`.
function Global.SetVehicleHandlingFloat(vehicle, class, fieldName, value)
	return _in(0x488c86d2, vehicle, _ts(class), _ts(fieldName), value)
end

--- Sets a handling override for a specific vehicle. Certain handling flags can only be set globally using `SET_HANDLING_INT`, this might require some experimentation.
-- @param vehicle The vehicle to set data for.
-- @param class The handling class to set. Only "CHandlingData" is supported at this time.
-- @param value The integer value to set.
-- @param fieldName The field name to set. These match the keys in `handling.meta`.
function Global.SetVehicleHandlingInt(vehicle, class, fieldName, value)
	return _in(0xc37f4cf9, vehicle, _ts(class), _ts(fieldName), value)
end

--- Sets a handling override for a specific vehicle. Certain handling flags can only be set globally using `SET_HANDLING_VECTOR`, this might require some experimentation.
-- @param vehicle The vehicle to set data for.
-- @param class The handling class to set. Only "CHandlingData" is supported at this time.
-- @param value The Vector3 value to set.
-- @param fieldName The field name to set. These match the keys in `handling.meta`.
function Global.SetVehicleHandlingVector(vehicle, class, fieldName, value)
	return _in(0x12497890, vehicle, _ts(class), _ts(fieldName), value)
end

function Global.SetVehicleHighGear(vehicle, gear)
	return _in(0x20b1b3e6, vehicle, gear)
end

function Global.SetVehicleInteriorColour(vehicle, color)
	return _in(0xF40DD601A65F7F19, vehicle, color)
end

function Global.SetVehicleOilLevel(vehicle, level)
	return _in(0x90d1cad1, vehicle, level)
end

function Global.SetVehicleParachuteActive(vehicle, active)
	return _in(0x0BFFB028B3DD0A97, vehicle, active)
end

function Global.SetVehicleRocketBoostActive(vehicle, active)
	return _in(0x81E1552E35DC3839, vehicle, active)
end

function Global.SetVehicleRocketBoostPercentage(vehicle, percentage)
	return _in(0xFEB2DDED3509562E, vehicle, percentage)
end

function Global.SetVehicleRocketBoostRefillTime(vehicle, time)
	return _in(0xE00F2AB100B76E89, vehicle, time)
end

function Global.SetVehicleSteeringAngle(vehicle, angle)
	return _in(0xffccc2ea, vehicle, angle)
end

function Global.SetVehicleSteeringScale(vehicle, scale)
	return _in(0xeb46596f, vehicle, scale)
end

function Global.SetVehicleTurboPressure(vehicle, pressure)
	return _in(0x6485615e, vehicle, pressure)
end

function Global.SetVehicleWheelHealth(vehicle, wheelIndex, health)
	return _in(0xb22ecefd, vehicle, wheelIndex, health)
end

--- Adjusts the offset of the specified wheel relative to the wheel's axle center.
-- Needs to be called every frame in order to function properly, as GTA will reset the offset otherwise.
-- This function can be especially useful to set the track width of a vehicle, for example:
-- ```
-- function SetVehicleFrontTrackWidth(vehicle, width)
-- SetVehicleWheelXOffset(vehicle, 0, -width/2)
-- SetVehicleWheelXOffset(vehicle, 1, width/2)
-- end
-- ```
function Global.SetVehicleWheelXOffset(vehicle, wheelIndex, offset)
	return _in(0xbd6357d, vehicle, wheelIndex, offset)
end

function Global.SetVehicleWheelXrot(vehicle, wheelIndex, value)
	return _in(0xec75d517, vehicle, wheelIndex, value)
end

--- Shuts down the `loadingScreen` NUI frame, similarly to `SHUTDOWN_LOADING_SCREEN`.
function Global.ShutdownLoadingScreenNui()
	return _in(0xb9234afb)
end

function Global.StartFindKvp(prefix)
	return _in(0xdd379006, _ts(prefix), _r, _ri)
end

--- The backing function for TriggerEvent.
function Global.TriggerEventInternal(eventName, eventPayload, payloadLength)
	return _in(0x91310870, _ts(eventName), _ts(eventPayload), payloadLength)
end

--- The backing function for TriggerServerEvent.
function Global.TriggerServerEventInternal(eventName, eventPayload, payloadLength)
	return _in(0x7fdd1128, _ts(eventName), _ts(eventPayload), payloadLength)
end

--- parachuteModel = 230075693
function Global.VehicleSetCustomParachuteModel(vehicle, parachuteModel)
	return _in(0x4D610C6B56031351, vehicle, _ch(parachuteModel))
end

--- colorIndex = 0
function Global.VehicleSetCustomParachuteTexture(vehicle, colorIndex)
	return _in(0xA74AD2439468C883, vehicle, colorIndex)
end

--- Returns whether or not the currently executing event was canceled. See https://wiki.fivem.net/wiki/WasEventCanceled
-- @return A boolean.
function Global.WasEventCanceled()
	return _in(0x58382a19, _r)
end

