// Areas

/area/awaymission/fractal_labyrinth
	name = "LOCATIONERROR"
	icon_state = "blank"
	requires_power = 0
	dynamic_lighting = 0
	mobcountmax = 0
	floracountmax = 0
	flags = BLUE_SHIELDED

// Turfs

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

/turf/simulated/wall/marble/Initialize(mapload)
	. = ..(mapload,  MAT_MARBLE)

// Structures

/obj/structure/simple_door/marble/New(var/newloc,var/material_name)
	..(newloc, "MAT_MARBLE")

// Mobs

/mob/living/simple_mob/fractal
	tt_desc = "%ENTRYNOTFOUND%"
	icon = 'icons/mob/fractal/32x32.dmi'

/mob/living/simple_mob/fractal/reverse_clown
	name = "nwolc"
	desc = "How's it hanging?"
	icon_state = "clown"
	icon_living = "clown"
	icon_dead = "clown"

	faction = "fractal_theater"

	health = 175
	maxHealth = 175

	response_help = "sekop"
	response_disarm = "edisa sehsup yltneg"
	response_harm = "stih"

	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = list("deknoh", "denroh")
	//attack_sound = 'sound/items/bikehorn_reverse.ogg'

	say_list_type = /datum/say_list/reverse_clown

/datum/say_list/reverse_clown
	speak = list("KNOH", "!knoH", "!sega rof no gniog neeb sah tca sihT", "?dne reve ti lliw ,ortseaM")
	emote_see = list("sknoh")

/mob/living/simple_mob/fractal/reverse_mime
	name = "emim"
	desc = "One quiet hangout."
	icon_state = "mine"
	icon_living = "mime"
	icon_dead = "mime"

	faction = "fractal_theater"

	health = 175
	maxHealth = 175

	response_help = "sekop"
	response_disarm = "edisa sehsup yltneg"
	response_harm = "stih"

	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = list("semim", "ta setalucitseg")

	say_list_type = /datum/say_list/reverse_mime

/datum/say_list/reverse_mime
	emote_see = list("secnad", "llaw elbisivni otni spmub", "yltnelis shgis")