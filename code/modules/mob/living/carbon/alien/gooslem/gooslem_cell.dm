/mob/living/carbon/alien/gooslem_cell
	name = "gooslem cell"
	voice_name = "gooslem cell"
	adult_form = /mob/living/carbon/human
	can_namepick_as_adult = 1
	adult_name = "gooslem"
	speak_emote = list("blurbles")
	icon_state = "nymph"
	item_state = "nymph"
	death_msg = "expires with a pitiful chirrup..."

	can_pull_size = ITEMSIZE_SMALL
	can_pull_mobs = MOB_PULL_SMALLER

/mob/living/carbon/alien/gooslem_cell/update_icons()

	if(stat == DEAD)
		icon_state = "[initial(icon_state)]_dead"
	else if(lying || resting || stunned)
		icon_state = "[initial(icon_state)]_sleep"
	else
		icon_state = "[initial(icon_state)]"

	overlays.Cut()