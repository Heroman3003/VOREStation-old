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
	var/ears_color_tertiary


	var/tail_style
	var/tail_color_primary
	var/tail_color_secondary
	var/tail_color_tertiary

	var/wing_style
	var/wing_color_primary
	var/wing_color_secondary
	var/wing_color_tertiary

	var/scale

/datum/transformation_datum/proc/apply_transformation(var/mob/living/carbon/human/victim)

	victim.set_species(species)

	victim.custom_species = custom_species_name

	victim.gender = gender_physical
	victim.identifying_gender = gender_identity


	for(var/obj/item/organ/external/O in victim.organs_by_name)
		if(istype(O))
			O.markings.Cut()
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

	victim.h_style = hair_style
	victim.r_hair = hex2num(copytext(hair_color, 2, 4))
	victim.g_hair = hex2num(copytext(hair_color, 4, 6))
	victim.b_hair = hex2num(copytext(hair_color, 6, 8))

	victim.grad_style = gradient_style
	victim.r_grad = hex2num(copytext(gradient_color, 2, 4))
	victim.g_grad = hex2num(copytext(gradient_color, 4, 6))
	victim.b_grad = hex2num(copytext(gradient_color, 6, 8))

	victim.f_style = facial_hair_style
	victim.r_facial = hex2num(copytext(facial_hair_color, 2, 4))
	victim.g_facial = hex2num(copytext(facial_hair_color, 4, 6))
	victim.b_facial = hex2num(copytext(facial_hair_color, 6, 8))

	victim.ear_style = ear_styles_list[ears_style]
	victim.r_ears = hex2num(copytext(ears_color_primary, 2, 4))
	victim.g_ears = hex2num(copytext(ears_color_primary, 4, 6))
	victim.b_ears = hex2num(copytext(ears_color_primary, 6, 8))
	victim.r_ears2 = hex2num(copytext(ears_color_secondary, 2, 4))
	victim.g_ears2 = hex2num(copytext(ears_color_secondary, 4, 6))
	victim.b_ears2 = hex2num(copytext(ears_color_secondary, 6, 8))
	victim.r_ears3 = hex2num(copytext(ears_color_tertiary, 2, 4))
	victim.g_ears3 = hex2num(copytext(ears_color_tertiary, 4, 6))
	victim.b_ears3 = hex2num(copytext(ears_color_tertiary, 6, 8))

	victim.tail_style = tail_styles_list[tail_style]
	victim.r_tail = hex2num(copytext(tail_color_primary, 2, 4))
	victim.g_tail = hex2num(copytext(tail_color_primary, 4, 6))
	victim.b_tail = hex2num(copytext(tail_color_primary, 6, 8))
	victim.r_tail2 = hex2num(copytext(tail_color_secondary, 2, 4))
	victim.g_tail2 = hex2num(copytext(tail_color_secondary, 4, 6))
	victim.b_tail2 = hex2num(copytext(tail_color_secondary, 6, 8))
	victim.r_tail3 = hex2num(copytext(tail_color_tertiary, 2, 4))
	victim.g_tail3 = hex2num(copytext(tail_color_tertiary, 4, 6))
	victim.b_tail3 = hex2num(copytext(tail_color_tertiary, 6, 8))

	victim.wing_style = wing_styles_list[wing_style]
	victim.r_wing = hex2num(copytext(wing_color_primary, 2, 4))
	victim.g_wing = hex2num(copytext(wing_color_primary, 4, 6))
	victim.b_wing = hex2num(copytext(wing_color_primary, 6, 8))
	victim.r_wing2 = hex2num(copytext(wing_color_secondary, 2, 4))
	victim.g_wing2 = hex2num(copytext(wing_color_secondary, 4, 6))
	victim.b_wing2 = hex2num(copytext(wing_color_secondary, 6, 8))
	victim.r_wing3 = hex2num(copytext(wing_color_tertiary, 2, 4))
	victim.g_wing3 = hex2num(copytext(wing_color_tertiary, 4, 6))
	victim.b_wing3 = hex2num(copytext(wing_color_tertiary, 6, 8))

	victim.resize(scale, animate = FALSE)


	victim.update_icon()