/datum/reagent/advmutationtoxin
	name = "Advanced Mutation Toxin"
	id = "advmutationtoxin"
	description = "A corruptive toxin produced by slimes. Turns the subject of the chemical into a Promethean."
	reagent_state = LIQUID
	color = "#13BC5E"

/obj/item/weapon/reagent_containers/pill/amt
	name = "amt pill"

/obj/item/weapon/reagent_containers/pill/amt/Initialize()
	. = ..()
	reagents.add_reagent("advmutationtoxin", 1)

/datum/reagent/advmutationtoxin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.species.name != "Promethean")
			to_chat(H, "<span class='danger'>Your flesh rapidly mutates!</span>")
			H.verbs -= H.species.inherent_verbs

			var/list/backup_implants = list()
			for(var/obj/item/organ/I in H.organs)
				for(var/obj/item/weapon/implant/backup/BI in I.contents)
					backup_implants += BI
			if(backup_implants.len)
				for(var/obj/item/weapon/implant/backup/BI in backup_implants)
					BI.forceMove(H.loc)

			H.species = all_species[SPECIES_PROMETHEAN]
			H.species.create_organs(H) //This is the only way to make it so Unathi TF doesn't result in people dying from organ rejection.
			for(var/obj/item/organ/I in H.organs) //This prevents organ rejection
				I.species = all_species[SPECIES_PROMETHEAN]
			for(var/obj/item/organ/I in H.internal_organs) //This prevents organ rejection
				I.species = all_species[SPECIES_PROMETHEAN]
			for(var/obj/item/organ/external/Z in H.organs)//Just in case.
				Z.sync_colour_to_human(H)
			H.fixblood()
			H.update_icons_body()
			H.update_tail_showing()

			if(backup_implants.len)
				var/obj/item/organ/external/torso = H.get_organ(BP_TORSO)
				for(var/obj/item/weapon/implant/backup/BI in backup_implants)
					BI.forceMove(torso)
					torso.implants += BI

			H.verbs += H.species.inherent_verbs

			H.shapeshifter_set_colour("#05FF9B")

/datum/chemical_reaction/slime/sapphire_mutation
	name = "Slime Mutation Toxins"
	id = "slime_mutation_tox"
	result = "mutationtoxin"
	required_reagents = list("blood" = 5)
	result_amount = 30
	required = /obj/item/slime_extract/sapphire

/datum/reagent/nif_repair_nanites
	name = "Programmed Nanomachines"
	id = "nifrepairnanites"
	description = "A thick grey slurry of NIF repair nanomachines."
	taste_description = "metallic"
	reagent_state = LIQUID
	color = "#333333"
	scannable = 1

/datum/reagent/nif_repair_nanites/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.nif)
			var/obj/item/device/nif/nif = H.nif //L o c a l
			if(nif.stat == NIF_TEMPFAIL)
				nif.stat = NIF_INSTALLING
			nif.durability = min(nif.durability + removed, initial(nif.durability))
