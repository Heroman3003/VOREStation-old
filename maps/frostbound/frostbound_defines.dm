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
#define Z_LEVEL_CAVERN						11
#define Z_LEVEL_ALIENSHIP					12
#define Z_LEVEL_BEACH						13
#define Z_LEVEL_BEACH_CAVE					14
#define Z_LEVEL_AEROSTAT					15
#define Z_LEVEL_AEROSTAT_SURFACE			16
#define Z_LEVEL_DEBRISFIELD					17


//Camera networks
#define NETWORK_FROSTBOUND "Cerberus"
#define NETWORK_SATELLITE "Satellite"
#define NETWORK_OUTSIDE "Outside"
#define NETWORK_XENOBIO "Xenobiology"
#define NETWORK_EXCAVATION_OUTPOST "Excavation Outpost"





/datum/map/frostbound
	name = "Cerberus"
	full_name = "NSB Cerberus"
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

	station_name  = "NSB Cerberus"
	station_short = "Cerberus"
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

	station_networks = list(
							NETWORK_CARGO,
							NETWORK_CIRCUITS,
							NETWORK_CIVILIAN,
							NETWORK_COMMAND,
							NETWORK_ENGINE,
							NETWORK_ENGINEERING,
							NETWORK_EXCAVATION_OUTPOST,
							NETWORK_FROSTBOUND,
							NETWORK_MEDICAL,
							NETWORK_OUTSIDE,
							NETWORK_RESEARCH,
							NETWORK_ROBOTS,
							NETWORK_SATELLITE,
							NETWORK_SECURITY
							)
	secondary_networks = list(
							NETWORK_ERT,
							NETWORK_MERCENARY,
							NETWORK_THUNDER,
							NETWORK_COMMUNICATORS,
							NETWORK_ALARM_ATMOS,
							NETWORK_ALARM_POWER,
							NETWORK_ALARM_FIRE
							)

	bot_patrolling = FALSE

	allowed_spawns = list("Tram Station","Gateway","Cryogenic Storage","Cyborg Storage")
	spawnpoint_died = /datum/spawnpoint/tram
	spawnpoint_left = /datum/spawnpoint/tram
	spawnpoint_stayed = /datum/spawnpoint/cryo

	meteor_strike_areas = list()		//FROSTBOUND-TO-DO

	unit_test_exempt_areas = list()		//FROSTBOUND-TO-DO
	unit_test_exempt_from_atmos = list()		//FROSTBOUND-TO-DO

	lateload_z_levels = list(
		list("Frostbound - Misc","Frostbound - Ships","Frostbound - Asteroid Mine","Frostbound - Cavern"),
		list("Alien Ship - Z1 Ship"),
		list("Desert Planet - Z1 Beach","Desert Planet - Z2 Cave"),
		list("Remmi Aerostat - Z1 Aerostat","Remmi Aerostat - Z2 Surface"),
		list("Debris Field - Z1 Space")
		)

	ai_shell_restricted = TRUE
	ai_shell_allowed_levels = list(
		Z_LEVEL_STATION_ONE,
		Z_LEVEL_STATION_TWO,
		Z_LEVEL_STATION_THREE,
		Z_LEVEL_STATION_FOUR,
		Z_LEVEL_SATELLITE,
		Z_LEVEL_UNDERGROUND_MINE,
		Z_LEVEL_CENTRAL,
		Z_LEVEL_MISC,
		Z_LEVEL_SHIPS,
		Z_LEVEL_ASTEROID_MINE
		)

	lateload_single_pick = null

/datum/map/frostbound/perform_map_generation()		//FROSTBOUND-TO-DO

	new /datum/random_map/automata/cave_system/no_cracks(null, 1, 1, Z_LEVEL_UNDERGROUND_MINE, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_UNDERGROUND_MINE, 64, 64)         // Create the mining ore distribution map.

	return 1

/datum/planet/virgo5
	expected_z_levels = list(
		Z_LEVEL_STATION_FOUR,
		Z_LEVEL_CENTRAL
	)

/datum/map/frostbound/get_map_levels(var/srcz, var/long_range = TRUE)
	if (long_range && (srcz in map_levels))
		return map_levels
	else if (srcz == Z_LEVEL_MISC || srcz == Z_LEVEL_SHIPS || Z_LEVEL_ALIENSHIP) //technical levels + levels that sholdnt be seen through
		return list() // Nothing on these z-levels- sensors won't show, and GPSes won't see each other.
	else if (srcz >= Z_LEVEL_STATION_ONE && srcz <= Z_LEVEL_UNDERGROUND_MINE)
		return list(
			Z_LEVEL_STATION_ONE,
			Z_LEVEL_STATION_TWO,
			Z_LEVEL_STATION_THREE,
			Z_LEVEL_STATION_FOUR,
			Z_LEVEL_SATELLITE,
			Z_LEVEL_UNDERGROUND_MINE)
	else if(srcz >= Z_LEVEL_BEACH && srcz <= Z_LEVEL_BEACH_CAVE)
		return list(
			Z_LEVEL_BEACH,
			Z_LEVEL_BEACH_CAVE)
	else if(srcz >= Z_LEVEL_AEROSTAT && srcz <= Z_LEVEL_AEROSTAT_SURFACE)
		return list(
			Z_LEVEL_AEROSTAT,
			Z_LEVEL_AEROSTAT_SURFACE)
	else
		return list(srcz) //prevents runtimes when using CMC. any Z-level not defined above will be 'isolated' and only show to GPSes/CMCs on that same Z (e.g. CentCom).

#define FROSTBOUND_MAP_SIZE 200 // Width and height of compiled in tether z levels.
#define FROSTBOUND_HOLOMAP_GUTTER 40 // 40px gutter between icons
#define FROSTBOUND_HOLOMAP_MARGIN_X ((HOLOMAP_ICON_SIZE - (2*FROSTBOUND_MAP_SIZE) - TETHER_HOLOMAP_CENTER_GUTTER) / 2)
#define FROSTBOUND_HOLOMAP_MARGIN_Y ((HOLOMAP_ICON_SIZE - (2*FROSTBOUND_MAP_SIZE) - FROSTBOUND_HOLOMAP_GUTTER) / 2)

/datum/map_z_level/frostbound/station
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED|MAP_LEVEL_XENOARCH_EXEMPT
	holomap_legend_x = 220
	holomap_legend_y = 160

/datum/map_z_level/frostbound/station/floor1
	z = Z_LEVEL_STATION_ONE
	name = "Floor 1"
	base_turf = /turf/simulated/floor/outdoors/rocks/virgo5_cavern
	holomap_offset_x = FROSTBOUND_HOLOMAP_MARGIN_X
	holomap_offset_y = FROSTBOUND_HOLOMAP_MARGIN_Y

/datum/map_z_level/frostbound/station/floor2
	z = Z_LEVEL_STATION_TWO
	name = "Floor 2"
	base_turf = /turf/simulated/open
	holomap_offset_x = FROSTBOUND_HOLOMAP_MARGIN_X
	holomap_offset_y = HOLOMAP_ICON_SIZE - FROSTBOUND_HOLOMAP_MARGIN_Y - FROSTBOUND_MAP_SIZE

/datum/map_z_level/frostbound/station/floor3
	z = Z_LEVEL_STATION_THREE
	name = "Floor 3"
	base_turf = /turf/simulated/open
	holomap_offset_x = HOLOMAP_ICON_SIZE - FROSTBOUND_HOLOMAP_MARGIN_X - FROSTBOUND_MAP_SIZE
	holomap_offset_y = FROSTBOUND_HOLOMAP_MARGIN_Y

/datum/map_z_level/frostbound/station/floor4
	z = Z_LEVEL_STATION_FOUR
	name = "Floor 4 (Surface)"
	base_turf = /turf/simulated/floor/outdoors/rocks/virgo5_surface
	holomap_offset_x = HOLOMAP_ICON_SIZE - FROSTBOUND_HOLOMAP_MARGIN_X - FROSTBOUND_MAP_SIZE
	holomap_offset_y = HOLOMAP_ICON_SIZE - FROSTBOUND_HOLOMAP_MARGIN_Y - FROSTBOUND_MAP_SIZE

/datum/map_z_level/frostbound/satellite
	z = Z_LEVEL_SATELLITE
	name = "Floor 4 (Surface)"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_XENOARCH_EXEMPT
	base_turf = /turf/space

/datum/map_z_level/frostbound/mine
	z = Z_LEVEL_UNDERGROUND_MINE
	name = "Excavation Outpost"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES
	base_turf = /turf/simulated/floor/outdoors/rocks/virgo5_cavern

/datum/map_z_level/frostbound/central
	z = Z_LEVEL_CENTRAL
	name = "Transfer Facility"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT

/datum/map_z_level/frostbound/misc
	z = Z_LEVEL_MISC
	name = "Misc"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_XENOARCH_EXEMPT