config = {
	enableVersionNotifier = false, --notify if a new version is available (server console)

	useModifiedEmergency = false, --require modified emergency script
	useModifiedBanking = true, --require Simple Banking
	useVDKInventory = true, --require VDK Inventory script
	useGcIdentity = false, --require GCIdentity
	enableOutfits = true, --require Skin Customization
	useJobSystem = true, -- require job system
	useWeashop = true, -- require es_weashop
	
	stationBlipsEnabled = true, -- switch between true or false to enable/disable blips for police stations
	useCopWhitelist = true,
	enableCheckPlate = false, --require garages
	
	enableOtherCopsBlips = true,
	useNativePoliceGarage = true,
	enableNeverWanted = true,
	
	propsSpawnLimitByCop = 20,
	
	displayRankBeforeNameOnChat = false,
	
	--Available languages : 'en', 'fr', 'de'
	lang = 'en',

	
	--Use by job system
	job = {
		officer_on_duty_job_id = 2,
		officer_not_on_duty_job_id = 1,
	},
	
	bindings = {
		interact_position = 51, -- E
		use_police_menu = 166, -- F5
		accept_fine = 246, -- Y
		refuse_fine = 45 -- R
	},

	--Customizable Departments
	departments = {
		label = {
			[0] = "Detective unit",
			[1] = "Los Santos Police Department",
			[2] = "Sheriff's Department",
			[3] = "SWAT Department",
			[4] = "Prison Department"
		},

		minified_label = {
			[0] = "DTU",
			[1] = "LSPD",
			[2] = "SHERIFF",
			[3] = "SWAT",
			[4] = "PRISON"
		}
	},
	
	--Customizable ranks
	rank = {

		--You can add or remove ranks as you want (just make sure to use numeric index, ascending)
		label = {
			[0] = "Cadet", 
			[1] = "Police Officer", 
			[2] = "Senior Police Officer", 
			[3] = "Sergeant",
			[4] = "Senior Sergeant",
			[5] = "Lieutenant", 
			[6] = "Captain", 
			[7] = "MemeLord", 
		},

		--Used for chat
		minified_label = {
			[0] = "CDT",
			[1] = "PO", --1
			[2] = "SPO",
			[3] = "SGT",
			[4] = "SGT2",
			[5] = "LT",
			[6] = "CPT",
			[7] = "oof",
		},

		--You can set here a badge for each rank you have. You have to enable "enableOutfits" to use this
		--The index is the rank index, the value is the badge index.
		--Here a link where you have the 4 MP Models badges with their index : https://kyominii.com/fivem/index.php/MP_Badges
		outfit_badge = {
			[0] = 0,
			[1] = 1,
			[2] = 1,
			[3] = 2,
			[4] = 3,
			[5] = 4,
			[6] = 5,
			[7] = 0,
		},

		--Minimum rank require to modify officers rank
		min_rank_set_rank = 3
	}
}

clockInStation = {
  {x=850.156677246094, y=-1283.92004394531, z=28.0047378540039}, -- La Mesa
  {x=457.956909179688, y=-992.72314453125, z=30.6895866394043}, -- Mission Row
  {x=1856.91320800781, y=3689.50073242188, z=34.2670783996582}, -- Sandy Shore
  {x=-450.063201904297, y=6016.5751953125, z=31.7163734436035} -- Paleto Bay
}

garageStation = {
   {x=-470.85266113281, y=6022.9296875, z=31.340530395508},  -- La Mesa
   {x=1873.3372802734, y=3687.3508300781, z=33.616954803467},  -- Mission Row
   {x=452.115966796875, y=-1018.10681152344, z=28.4786586761475}, -- Sandy Shore
   {x=855.24249267578, y=-1279.9300537109, z=26.513223648071 }  --Paleto Bay
}

heliStation = {
    {x=449.113966796875, y=-981.084966796875, z=43.691966796875} -- Mission Row
}

armoryStation = {
    {x=452.119966796875, y=-980.061966796875, z=30.690966796875},
    {x=853.157, y=-1267.74, z= 26.6729},	
    {x=1849.63, y=3689.48, z=34.2671},
    {x=-448.219, y= 6008.98, z=31.7164}
}

i18n.setLang(tostring(config.lang))