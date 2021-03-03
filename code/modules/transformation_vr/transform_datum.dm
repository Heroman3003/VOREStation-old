/datum/transformation_datum
	var/species
	var/custom_species_name

	var/gender_physical
	var/gender_identity

	var/list/markings = list()

	var/body_color
	var/skin_tone
	var/eye_color

	var/hair_style
	var/hair_color

	var/gradient_style
	var/gradient_color

	var/facial_hair_style
	var/facial_hair_color

	var/ears_style
	var/ears_color_primary
	var/ears_color_secondary

	var/tail_style
	var/tail_color_primary
	var/tail_color_secondary

	var/wing_style
	var/wing_color_primary
	var/wing_color_secondary

	var/scale

/datum/transformation_datum/proc/apply_transformation(var/mob/living/carbon/human/victim)

	victim.set_species(species)

	victim.custom_species = custom_species_name

	victim.gender = gender_physical
	victim.identifying_gender = gender_identity

	for(var/M in markings)
		var/datum/sprite_accessory/marking/mark_datum = body_marking_styles_list[M]
		var/mark_color = "[markings[M]]"

		for(var/BP in mark_datum.body_parts)
			var/obj/item/organ/external/O = victim.organs_by_name[BP]
			if(O)
				O.markings[M] = list("color" = mark_color, "datum" = mark_datum)

	victim.r_skin = hex2num(copytext(body_color, 2, 4))
	victim.g_skin = hex2num(copytext(body_color, 4, 6))
	victim.b_skin = hex2num(copytext(body_color, 6, 8))

	victim.s_tone = skin_tone