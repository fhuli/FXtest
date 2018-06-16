const _i = Citizen.pointerValueInt();
const _f = Citizen.pointerValueFloat();
const _v = Citizen.pointerValueVector();
const _r = Citizen.returnResultAnyway();
const _ri = Citizen.resultAsInteger();
const _rf = Citizen.resultAsFloat();
const _s = Citizen.resultAsString();
const _rv = Citizen.resultAsVector();
const _ro = Citizen.resultAsObject();
const _in = Citizen.invokeNative;
const _ii = Citizen.pointerValueIntInitialized;
const _fi = Citizen.pointerValueFloatInitialized;
function _ch(hash) {
	if (typeof hash === 'string') {
		return window.GetHashKey(hash);
	}

	return hash;
}

function _ts(num) {
	if (num == 0 || !num) { // workaround for users calling string parameters with '0', also nil being translated
		return null;
	}
	return num.toString();
}
function _fv(flt) {
	return flt + 0.0000001;
}

function _mfr(fn) {
	return Citizen.makeRefFunction(fn);
}

const _ENV = null;

/**
 * Cancels the currently executing event. See https://wiki.fivem.net/wiki/CancelEvent
 */
window.CancelEvent = function () {
	return _in("0xfa29d35d");
};

/**
 * thisScriptCheck - can be destroyed if it belongs to the calling script.
 */
window.CreateVehicle = function (modelHash, x, y, z, heading, isNetwork, thisScriptCheck) {
	return _in("0xdd75460a", _ch(modelHash), _fv(x), _fv(y), _fv(z), _fv(heading), isNetwork, thisScriptCheck);
};

window.DeleteFunctionReference = function (referenceIdentity) {
	return _in("0x1e86f206", _ts(referenceIdentity));
};

window.DropPlayer = function (playerSrc, reason) {
	return _in("0xba0613e1", _ts(playerSrc), _ts(reason));
};

window.DuplicateFunctionReference = function (referenceIdentity) {
	return _in("0xf4e2079d", _ts(referenceIdentity), _r, _s);
};

window.EnableEnhancedHostSupport = function (enabled) {
	return _in("0xf97b1c93", enabled);
};

window.ExecuteCommand = function (commandString) {
	return _in("0x561c060b", _ts(commandString));
};

window.FlagServerAsPrivate = function (_private) {
	return _in("0x13b6855d", _private);
};

window.GetConvar = function (varName, _default) {
	return _in("0x6ccd2564", _ts(varName), _ts(_default), _r, _s);
};

window.GetConvarInt = function (varName, _default) {
	return _in("0x935c0ab2", _ts(varName), _default, _r, _ri);
};

/**
 * Returns the name of the currently executing resource.
 * @return The name of the resource.
 */
window.GetCurrentResourceName = function () {
	return _in("0xe5e9ebbb", _r, _s);
};

window.GetEntityCoords = function (entity) {
	return _in("0x1647f1cb", entity, _r, _rv);
};

/**
 * Gets the current game timer in milliseconds.
 * @return The game time.
 */
window.GetGameTimer = function () {
	return _in("0xa4ea0691", _r, _ri);
};

/**
 * This native converts the passed string to a hash.
 */
window.GetHashKey = function (model) {
	return _in("0x98eff6f1", _ts(model), _r, _ri);
};

window.GetHostId = function () {
	return _in("0x5f70f5a3", _r, _s);
};

window.GetInstanceId = function () {
	return _in("0x9f1c4383", _r, _ri);
};

window.GetInvokingResource = function () {
	return _in("0x4d52fe5b", _r, _s);
};

window.GetNumPlayerIdentifiers = function (playerSrc) {
	return _in("0xff7f66ab", _ts(playerSrc), _r, _ri);
};

window.GetNumPlayerIndices = function () {
	return _in("0x63d13184", _r, _ri);
};

/**
 * Gets the amount of metadata values with the specified key existing in the specified resource's manifest.
 * See also: [Resource manifest](https://wiki.fivem.net/wiki/Resource_manifest)
 * @param resourceName The resource name.
 * @param metadataKey The key to look up in the resource manifest.
 */
window.GetNumResourceMetadata = function (resourceName, metadataKey) {
	return _in("0x776e864", _ts(resourceName), _ts(metadataKey), _r, _ri);
};

window.GetNumResources = function () {
	return _in("0x863f27b", _r, _ri);
};

window.GetPasswordHash = function (password) {
	return _in("0x23473ea4", _ts(password), _r, _s);
};

window.GetPlayerEndpoint = function (playerSrc) {
	return _in("0xfee404f9", _ts(playerSrc), _r, _s);
};

window.GetPlayerFromIndex = function (index) {
	return _in("0xc8a9ce08", index, _r, _s);
};

window.GetPlayerGuid = function (playerSrc) {
	return _in("0xe52d9680", _ts(playerSrc), _r, _s);
};

window.GetPlayerIdentifier = function (playerSrc, identifier) {
	return _in("0x7302dbcf", _ts(playerSrc), identifier, _r, _s);
};

window.GetPlayerLastMsg = function (playerSrc) {
	return _in("0x427e8e6a", _ts(playerSrc), _r, _ri);
};

window.GetPlayerName = function (playerSrc) {
	return _in("0x406b4b20", _ts(playerSrc), _r, _s);
};

window.GetPlayerPed = function (playerSrc) {
	return _in("0x6e31e993", _ts(playerSrc), _r, _ri);
};

window.GetPlayerPing = function (playerSrc) {
	return _in("0xff1290d4", _ts(playerSrc), _r, _ri);
};

/**
 * Returns all commands that are registered in the command system.
 * The data returned adheres to the following layout:
 * ```
 * [
 * {
 * "name": "cmdlist"
 * },
 * {
 * "name": "command1"
 * }
 * ]
 * ```
 * @return An object containing registered commands.
 */
window.GetRegisteredCommands = function () {
	return window.msgpack_unpack(_in("0xd4bef069", _r, _ro));
};

window.GetResourceByFindIndex = function (findIndex) {
	return _in("0x387246b7", findIndex, _r, _s);
};

/**
 * Gets the metadata value at a specified key/index from a resource's manifest.
 * See also: [Resource manifest](https://wiki.fivem.net/wiki/Resource_manifest)
 * @param metadataKey The key in the resource manifest.
 * @param resourceName The resource name.
 * @param index The value index, in a range from [0..GET_NUM_RESOURCE_METDATA-1].
 */
window.GetResourceMetadata = function (resourceName, metadataKey, index) {
	return _in("0x964bab1d", _ts(resourceName), _ts(metadataKey), index, _r, _s);
};

/**
 * Returns the physical on-disk path of the specified resource.
 * @param resourceName The name of the resource.
 * @return The resource directory name, possibly without trailing slash.
 */
window.GetResourcePath = function (resourceName) {
	return _in("0x61dcf017", _ts(resourceName), _r, _s);
};

window.InvokeFunctionReference = function (referenceIdentity, argsSerialized, argsLength, retvalLength) {
	return _in("0xe3551879", _ts(referenceIdentity), _ts(argsSerialized), argsLength, _ii(retvalLength) /* may be optional */, _r, _s);
};

window.IsAceAllowed = function (object) {
	return _in("0x7ebb9929", _ts(object), _r);
};

/**
 * Gets whether or not this is the CitizenFX server.
 * @return A boolean value.
 */
window.IsDuplicityVersion = function () {
	return _in("0xcf24c52e", _r);
};

window.IsPlayerAceAllowed = function (playerSrc, object) {
	return _in("0xdedae23d", _ts(playerSrc), _ts(object), _r);
};

/**
 * Reads the contents of a text file in a specified resource.
 * If executed on the client, this file has to be included in `files` in the resource manifest.
 * Example: `local data = LoadResourceFile("devtools", "data.json")`
 * @param resourceName The resource name.
 * @param fileName The file in the resource.
 * @return The file contents
 */
window.LoadResourceFile = function (resourceName, fileName) {
	return _in("0x76a9ee1f", _ts(resourceName), _ts(fileName), _r, _s);
};

window.PerformHttpRequestInternal = function (requestData, requestDataLength) {
	return _in("0x8e8cc653", _ts(requestData), requestDataLength, _r, _ri);
};

window.RegisterCommand = function (commandName, handler, restricted) {
	return _in("0x5fa79b0f", _ts(commandName), _mfr(handler), restricted);
};

/**
 * Registers a build task factory for resources.
 * The function should return an object (msgpack map) with the following fields:
 * ```
 * {
 * // returns whether the specific resource should be built
 * shouldBuild = func(resourceName: string): bool,
 * 
 * // asynchronously start building the specific resource.
 * // call cb when completed
 * build = func(resourceName: string, cb: func(success: bool, status: string): void): void
 * }
 * ```
 * @param factoryFn The factory function.
 * @param factoryId The identifier for the build task.
 */
window.RegisterResourceBuildTaskFactory = function (factoryId, factoryFn) {
	return _in("0x285b43ca", _ts(factoryId), _mfr(factoryFn));
};

/**
 * Writes the specified data to a file in the specified resource.
 * Using a length of `-1` will automatically detect the length assuming the data is a C string.
 * @param fileName The name of the file.
 * @param dataLength The length of the written data.
 * @param resourceName The name of the resource.
 * @param data The data to write to the file.
 * @return A value indicating if the write succeeded.
 */
window.SaveResourceFile = function (resourceName, fileName, data, dataLength) {
	return _in("0xa09e7e7b", _ts(resourceName), _ts(fileName), _ts(data), dataLength, _r);
};

window.SetConvar = function (varName, value) {
	return _in("0x341b16d2", _ts(varName), _ts(value));
};

/**
 * p7 is always 1 in the scripts. Set to 1, an area around the destination coords for the moved entity is cleared from other entities.
 * Often ends with 1, 0, 0, 1); in the scripts. It works.
 * Axis - Invert Axis Flags
 */
window.SetEntityCoords = function (entity, xPos, yPos, zPos, xAxis, yAxis, zAxis, clearArea) {
	return _in("0xdf70b41b", entity, _fv(xPos), _fv(yPos), _fv(zPos), xAxis, yAxis, zAxis, clearArea);
};

window.SetGameType = function (gametypeName) {
	return _in("0xf90b7469", _ts(gametypeName));
};

window.SetHttpHandler = function (handler) {
	return _in("0xf5c6330c", _mfr(handler));
};

window.SetMapName = function (mapName) {
	return _in("0xb7ba82dc", _ts(mapName));
};

/**
 * Ped: The ped to warp.
 * vehicle: The vehicle to warp the ped into.
 * Seat_Index: [-1 is driver seat, -2 first free passenger seat]
 * Moreinfo of Seat Index
 * DriverSeat = -1
 * Passenger = 0
 * Left Rear = 1
 * RightRear = 2
 */
window.SetPedIntoVehicle = function (ped, vehicle, seatIndex) {
	return _in("0x7500c79", ped, vehicle, seatIndex);
};

/**
 * Call SET_PLAYER_WANTED_LEVEL_NOW for immediate effect
 * wantedLevel is an integer value representing 0 to 5 stars even though the game supports the 6th wanted level but no police will appear since no definitions are present for it in the game files
 * disableNoMission-  Disables When Off Mission- appears to always be false
 */
window.SetPlayerWantedLevel = function (player, wantedLevel, disableNoMission) {
	return _in("0xb7a0914b", player, wantedLevel, disableNoMission);
};

/**
 * colorPrimary &amp; colorSecondary are the paint index for the vehicle.
 * For a list of valid paint indexes, view: pastebin.com/pwHci0xK
 * -------------------------------------------------------------------------
 * Use this to get the number of color indices: pastebin.com/RQEeqTSM
 * Note: minimum color index is 0, maximum color index is (numColorIndices - 1)
 */
window.SetVehicleColours = function (vehicle, colorPrimary, colorSecondary) {
	return _in("0x57f24253", vehicle, colorPrimary, colorSecondary);
};

window.StartResource = function (resourceName) {
	return _in("0x29b440dc", _ts(resourceName), _r);
};

window.StopResource = function (resourceName) {
	return _in("0x21783161", _ts(resourceName), _r);
};

window.TempBanPlayer = function (playerSrc, reason) {
	return _in("0x1e35dbba", _ts(playerSrc), _ts(reason));
};

/**
 * The backing function for TriggerClientEvent.
 */
window.TriggerClientEventInternal = function (eventName, eventTarget, eventPayload, payloadLength) {
	return _in("0x2f7a49e6", _ts(eventName), _ts(eventTarget), _ts(eventPayload), payloadLength);
};

/**
 * The backing function for TriggerEvent.
 */
window.TriggerEventInternal = function (eventName, eventPayload, payloadLength) {
	return _in("0x91310870", _ts(eventName), _ts(eventPayload), payloadLength);
};

window.VerifyPasswordHash = function (password, hash) {
	return _in("0x2e310acd", _ts(password), _ts(hash), _r);
};

/**
 * Returns whether or not the currently executing event was canceled. See https://wiki.fivem.net/wiki/WasEventCanceled
 * @return A boolean.
 */
window.WasEventCanceled = function () {
	return _in("0x58382a19", _r);
};

