#define AB_SHIFT_NONE		0
#define AB_SHIFT_PASSIVE	1
#define AB_SHIFT_ACTIVE		2

/mob/living/simple_mob/vore/slaughter_demon
	name = "slaughter demon"
	desc = "It's a rawr! Beware of doom poof!"
	tt_desc = "Redspacus Spookius"

	icon_state = "prpldemon"
	icon_living = "prpldemon"
	icon_dead = "prpldemon_dead"
	icon = 'icons/mob/vore.dmi'

	faction = "demon"
	maxHealth = 30
	health = 30
	movement_cooldown = 0

	response_help = "stares at"
	response_disarm = "is spooked by"
	response_harm = "shivers in thought of"

	melee_damage_lower = 3
	melee_damage_upper = 1
	attacktext = list("clawed")

	vore_active = TRUE

	var/shifted_out = FALSE
	var/shift_state = AB_SHIFT_NONE
	var/last_shift = 0

/mob/living/simple_mob/vore/slaughter_demon/UnarmedAttack()
	if(shifted_out)
		return FALSE

	. = ..()

/mob/living/simple_mob/vore/slaughter_demon/can_fall()
	if(shifted_out)
		return FALSE

	return ..()

/mob/living/simple_mob/vore/slaughter_demon/zMove(direction)
	if(shifted_out)
		var/turf/destination = (direction == UP) ? GetAbove(src) : GetBelow(src)
		if(destination)
			forceMove(destination)
		return TRUE

	return ..()

/mob/living/simple_mob/vore/slaughter_demon/Life()
	. = ..()
	if(shifted_out)
		density = FALSE

/mob/living/simple_mob/vore/slaughter_demon/handle_atmos()
	if(shifted_out)
		return
	else
		return .=..()