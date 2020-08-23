/area/awaymission/fractal_labyrinth
	name = "LOCATIONERROR"
	icon_state = "blank"
	requires_power = 0
	dynamic_lighting = 0
	mobcountmax = 0
	floracountmax = 0
	flags = BLUE_SHIELDED

/turf/simulated/wall/dungeon/nojoin/can_join_with(var/turf/simulated/wall/W)
	return 0

/turf/simulated/floor/dungeon/cult
	name = "floor"
	icon = 'icons/turf/flooring/cult.dmi'
	icon_state = "cult"
	initial_flooring = /decl/flooring/reinforced/cult

/turf/simulated/floor/dungeon/cult/slow1
	movement_cost = 1

/turf/simulated/floor/dungeon/cult/slow2
	movement_cost = 2

/turf/simulated/floor/dungeon/cult/slow3
	movement_cost = 3

/turf/simulated/floor/dungeon/cult/slow4
	movement_cost = 4