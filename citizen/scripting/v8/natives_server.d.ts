/**
 * Cancels the currently executing event. See https://wiki.fivem.net/wiki/CancelEvent
 */
declare function CancelEvent(): void;

/**
 * thisScriptCheck - can be destroyed if it belongs to the calling script.
 */
declare function CreateVehicle(modelHash: string | number, x: number, y: number, z: number, heading: number, isNetwork: boolean, thisScriptCheck: boolean): void;

declare function DeleteFunctionReference(referenceIdentity: string): void;

declare function DropPlayer(playerSrc: string, reason: string): void;

declare function DuplicateFunctionReference(referenceIdentity: string): string;

declare function EnableEnhancedHostSupport(enabled: boolean): void;

declare function ExecuteCommand(commandString: string): void;

declare function FlagServerAsPrivate(_private: boolean): void;

declare function GetConvar(varName: string, _default: string): string;

declare function GetConvarInt(varName: string, _default: number): number;

/**
 * Returns the name of the currently executing resource.
 * @return The name of the resource.
 */
declare function GetCurrentResourceName(): string;

declare function GetEntityCoords(entity: number): number[];

/**
 * Gets the current game timer in milliseconds.
 * @return The game time.
 */
declare function GetGameTimer(): number;

/**
 * This native converts the passed string to a hash.
 */
declare function GetHashKey(model: string): number;

declare function GetHostId(): string;

declare function GetInstanceId(): number;

declare function GetInvokingResource(): string;

declare function GetNumPlayerIdentifiers(playerSrc: string): number;

declare function GetNumPlayerIndices(): number;

/**
 * Gets the amount of metadata values with the specified key existing in the specified resource's manifest.
 * See also: [Resource manifest](https://wiki.fivem.net/wiki/Resource_manifest)
 * @param metadataKey The key to look up in the resource manifest.
 * @param resourceName The resource name.
 */
declare function GetNumResourceMetadata(resourceName: string, metadataKey: string): number;

declare function GetNumResources(): number;

declare function GetPasswordHash(password: string): string;

declare function GetPlayerEndpoint(playerSrc: string): string;

declare function GetPlayerFromIndex(index: number): string;

declare function GetPlayerGuid(playerSrc: string): string;

declare function GetPlayerIdentifier(playerSrc: string, identifier: number): string;

declare function GetPlayerLastMsg(playerSrc: string): number;

declare function GetPlayerName(playerSrc: string): string;

declare function GetPlayerPed(playerSrc: string): number;

declare function GetPlayerPing(playerSrc: string): number;

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
declare function GetRegisteredCommands(): any;

declare function GetResourceByFindIndex(findIndex: number): string;

/**
 * Gets the metadata value at a specified key/index from a resource's manifest.
 * See also: [Resource manifest](https://wiki.fivem.net/wiki/Resource_manifest)
 * @param index The value index, in a range from [0..GET_NUM_RESOURCE_METDATA-1].
 * @param metadataKey The key in the resource manifest.
 * @param resourceName The resource name.
 */
declare function GetResourceMetadata(resourceName: string, metadataKey: string, index: number): string;

/**
 * Returns the physical on-disk path of the specified resource.
 * @param resourceName The name of the resource.
 * @return The resource directory name, possibly without trailing slash.
 */
declare function GetResourcePath(resourceName: string): string;

declare function InvokeFunctionReference(referenceIdentity: string, argsSerialized: string, argsLength: number, retvalLength: number): string;

declare function IsAceAllowed(object: string): number;

/**
 * Gets whether or not this is the CitizenFX server.
 * @return A boolean value.
 */
declare function IsDuplicityVersion(): number;

declare function IsPlayerAceAllowed(playerSrc: string, object: string): number;

/**
 * Reads the contents of a text file in a specified resource.
 * If executed on the client, this file has to be included in `files` in the resource manifest.
 * Example: `local data = LoadResourceFile("devtools", "data.json")`
 * @param fileName The file in the resource.
 * @param resourceName The resource name.
 * @return The file contents
 */
declare function LoadResourceFile(resourceName: string, fileName: string): string;

declare function PerformHttpRequestInternal(requestData: string, requestDataLength: number): number;

declare function RegisterCommand(commandName: string, handler: Function, restricted: boolean): void;

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
declare function RegisterResourceBuildTaskFactory(factoryId: string, factoryFn: Function): void;

/**
 * Writes the specified data to a file in the specified resource.
 * Using a length of `-1` will automatically detect the length assuming the data is a C string.
 * @param dataLength The length of the written data.
 * @param fileName The name of the file.
 * @param data The data to write to the file.
 * @param resourceName The name of the resource.
 * @return A value indicating if the write succeeded.
 */
declare function SaveResourceFile(resourceName: string, fileName: string, data: string, dataLength: number): number;

declare function SetConvar(varName: string, value: string): void;

/**
 * p7 is always 1 in the scripts. Set to 1, an area around the destination coords for the moved entity is cleared from other entities.
 * Often ends with 1, 0, 0, 1); in the scripts. It works.
 * Axis - Invert Axis Flags
 */
declare function SetEntityCoords(entity: number, xPos: number, yPos: number, zPos: number, xAxis: boolean, yAxis: boolean, zAxis: boolean, clearArea: boolean): void;

declare function SetGameType(gametypeName: string): void;

declare function SetHttpHandler(handler: Function): void;

declare function SetMapName(mapName: string): void;

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
declare function SetPedIntoVehicle(ped: number, vehicle: number, seatIndex: number): void;

/**
 * Call SET_PLAYER_WANTED_LEVEL_NOW for immediate effect
 * wantedLevel is an integer value representing 0 to 5 stars even though the game supports the 6th wanted level but no police will appear since no definitions are present for it in the game files
 * disableNoMission-  Disables When Off Mission- appears to always be false
 */
declare function SetPlayerWantedLevel(player: number, wantedLevel: number, disableNoMission: boolean): void;

/**
 * colorPrimary &amp; colorSecondary are the paint index for the vehicle.
 * For a list of valid paint indexes, view: pastebin.com/pwHci0xK
 * -------------------------------------------------------------------------
 * Use this to get the number of color indices: pastebin.com/RQEeqTSM
 * Note: minimum color index is 0, maximum color index is (numColorIndices - 1)
 */
declare function SetVehicleColours(vehicle: number, colorPrimary: number, colorSecondary: number): void;

declare function StartResource(resourceName: string): number;

declare function StopResource(resourceName: string): number;

declare function TempBanPlayer(playerSrc: string, reason: string): void;

/**
 * The backing function for TriggerClientEvent.
 */
declare function TriggerClientEventInternal(eventName: string, eventTarget: string, eventPayload: string, payloadLength: number): void;

/**
 * The backing function for TriggerEvent.
 */
declare function TriggerEventInternal(eventName: string, eventPayload: string, payloadLength: number): void;

declare function VerifyPasswordHash(password: string, hash: string): number;

/**
 * Returns whether or not the currently executing event was canceled. See https://wiki.fivem.net/wiki/WasEventCanceled
 * @return A boolean.
 */
declare function WasEventCanceled(): number;

