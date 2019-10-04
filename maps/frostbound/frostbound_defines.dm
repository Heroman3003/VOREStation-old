#define Z_LEVEL_STATION_ONE					1
#define Z_LEVEL_STATION_TWO					2
#define Z_LEVEL_STATION_THREE				3
#define Z_LEVEL_STATION_FOUR				4
#define Z_LEVEL_SATELLITE					5
#define Z_LEVEL_UNDERGROUND_MINE			6
#define Z_LEVEL_CENTRAL						7
#define Z_LEVEL_MISC						8
#define Z_LEVEL_SHIPS						9
#define Z_LEVEL_ASTEROID_MINE				10
#define Z_LEVEL_WILDERNESS					11
#define Z_LEVEL_ALIENSHIP					12
#define Z_LEVEL_BEACH						13
#define Z_LEVEL_BEACH_CAVE					14
#define Z_LEVEL_AEROSTAT					15
#define Z_LEVEL_AEROSTAT_SURFACE			16
#define Z_LEVEL_DEBRISFIELD					17





/datum/map/frostbound
	name = "Virgo"
	full_name = "NSB Duoluma"
	path = "frostbound"

	zlevel_datum_type = /datum/map_z_level/frostbound

	lobby_icon = 'icons/misc/title_vr.dmi'
	lobby_screens = list("tether")
	id_hud_icons = 'icons/mob/hud_jobs_vr.dmi'

	holomap_smoosh = list(list(
		Z_LEVEL_STATION_ONE,
		Z_LEVEL_STATION_TWO,
		Z_LEVEL_STATION_THREE,
		Z_LEVEL_STATION_FOUR))

	station_name  = "NSB Duoluma"
	station_short = "*FBPLACEHOLDER*"
	dock_name     = "Virgo-5 Facility"
	boss_name     = "Central Command"
	boss_short    = "CentCom"
	company_name  = "NanoTrasen"
	company_short = "NT"
	starsys_name  = "Virgo-Erigone"

	shuttle_docked_message = "The scheduled Teal Line tram to the %dock_name% has arrived. It will depart in approximately %ETD%."
	shuttle_leaving_dock = "The Teal Line tram has left the station. Estimate %ETA% until the tram arrives at %dock_name%."
	shuttle_called_message = "A scheduled crew transfer to the %dock_name% is occuring. The tram will be arriving shortly. Those departing should proceed to the Teal Line tram station within %ETA%."
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	emergency_shuttle_docked_message = "The evacuation tram has arrived at the tram station. You have approximately %ETD% to board the tram."
	emergency_shuttle_leaving_dock = "The emergency tram has left the station. Estimate %ETA% until the shuttle arrives at %dock_name%."
	emergency_shuttle_called_message = "An emergency evacuation has begun, and an off-schedule tram has been called. It will arrive at the tram station in approximately %ETA%."
	emergency_shuttle_recall_message = "The evacuation tram has been recalled."

	bot_patrolling = FALSE

	allowed_spawns = list("Tram Station","Gateway","Cryogenic Storage","Cyborg Storage")
	spawnpoint_died = /datum/spawnpoint/tram
	spawnpoint_left = /datum/spawnpoint/tram
	spawnpoint_stayed = /datum/spawnpoint/cryo