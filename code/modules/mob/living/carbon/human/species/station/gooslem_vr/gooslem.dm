/datum/species/gooslem
	name =             SPECIES_GOOSLEM
	name_plural =      "Gooslems"
	blurb =            "Sometimes very advanced civilizations will produce the ability to swap into manufactured, robotic bodies. And sometimes \
						<i>VERY</i> advanced civilizations have the option of 'nanoswarm' bodies. Effectively a single robot body comprised \
						of millions of tiny nanites working in concert to maintain cohesion."
	show_ssd =         "totally quiescent"
	death_message =    "rapidly loses cohesion, dissolving into a cloud of gray dust..."
	knockout_message = "collapses inwards, forming a disordered puddle of gray goo."
	remains_type = /obj/effect/decal/cleanable/ash

	blood_color = "#505050" //This is the same as the 80,80,80 below, but in hex
	flesh_color = "#505050"
	base_color = "#FFFFFF" //Color mult, start out with this

	flags =            NO_SCAN | NO_SLIP | NO_MINOR_CUT | NO_HALLUCINATION | NO_INFECT | NO_PAIN | NO_POISON | NO_EMBED
	appearance_flags = RADIATION_GLOWS
	spawn_flags		 = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED
	health_hud_intensity = 2
	num_alternate_languages = 3
	assisted_langs = list(LANGUAGE_ROOTLOCAL, LANGUAGE_ROOTGLOBAL, LANGUAGE_VOX)
	color_mult = TRUE

	breath_type = null
	poison_type = null

	virus_immune =	1
	blood_volume =	300
	min_age =		18
	max_age =		200
	brute_mod =		0 //Brute isn't very effective, they're strongslem
	burn_mod =		2.0 //Burn, however, is
	oxy_mod =		0

	//cold_level_1 = 280 //Default 260 - Lower is better
	//cold_level_2 = 220 //Default 200
	//cold_level_3 = 130 //Default 120

	//heat_level_1 = 320 //Default 360
	//heat_level_2 = 370 //Default 400
	//heat_level_3 = 600 //Default 1000

	//Space doesn't bother them
	//hazard_low_pressure = -1
	//hazard_high_pressure = 200 //They can cope with slightly higher pressure

	//Cold/heat does affect them, but it's done in special ways below
	//cold_level_1 = -INFINITY
	//cold_level_2 = -INFINITY
	//cold_level_3 = -INFINITY
	//heat_level_1 = INFINITY
	//heat_level_2 = INFINITY
	//heat_level_3 = INFINITY

	//body_temperature =      290

	//siemens_coefficient =   3 //Very bad zappy times
	rarity_value =          5

	//darksight = 3 // Equivalent to the minor trait

	has_organ = list(
		O_BRAIN = /obj/item/organ/internal/mmi_holder/posibrain/nano
		)
	has_limbs = list(
		BP_TORSO =  list("path" = /obj/item/organ/external/chest/unbreakable/nano),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/unbreakable/nano),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/unbreakable/nano),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm/unbreakable/nano),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right/unbreakable/nano),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg/unbreakable/nano),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right/unbreakable/nano),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/unbreakable/nano),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/unbreakable/nano),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/unbreakable/nano),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/unbreakable/nano)
		)

	heat_discomfort_strings = list("You feel too warm.")
	cold_discomfort_strings = list("You feel too cool.")

	//These verbs are hidden, for hotkey use only
	inherent_verbs = list(
		/mob/living/carbon/human/proc/nano_regenerate, //These verbs are hidden so you can macro them,
		/mob/living/carbon/human/proc/nano_partswap,
		/mob/living/carbon/human/proc/nano_metalnom,
		/mob/living/carbon/human/proc/nano_blobform,
		/mob/living/carbon/human/proc/nano_set_size,
		/mob/living/carbon/human/proc/nano_change_fitting, //These verbs are displayed normally,
		/mob/living/carbon/human/proc/shapeshifter_select_hair,
		/mob/living/carbon/human/proc/shapeshifter_select_hair_colors,
		/mob/living/carbon/human/proc/shapeshifter_select_colour,
		/mob/living/carbon/human/proc/shapeshifter_select_eye_colour,
		/mob/living/carbon/human/proc/shapeshifter_select_gender,
		/mob/living/carbon/human/proc/shapeshifter_select_wings,
		/mob/living/carbon/human/proc/shapeshifter_select_tail,
		/mob/living/carbon/human/proc/shapeshifter_select_ears
		)

	var/global/list/abilities = list()

/mob/living/carbon/human/gooslem/Initialize(var/new_loc)
	return ..(new_loc, SPECIES_GOOSLEM)