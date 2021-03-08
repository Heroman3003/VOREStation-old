/obj/machinery/computer/transformation_designer
	name = "\improper Transformation Template Designer"
	desc = "Used to design transformation templates for the devices that use them."
	icon_screen = "teleport"
	icon_keyboard = "teleport_key"
	circuit = /obj/item/weapon/circuitboard/transformation_designer
	var/datum/transformation_datum/current_template = null

/obj/machinery/computer/transformation_designer/Initialize()
	current_template = new()

/obj/machinery/computer/transformation_designer/attack_hand(var/mob/user as mob)
	if(..())
		return

	user.set_machine(src)

	var/datum/species/mob_species = GLOB.all_species[current_template.species]


	var/dat = "<head><title>Body Design</title></head><body>"















/obj/item/weapon/circuitboard/transformation_designer
	name = T_BOARD("Transformation Template Designer")
	build_path = /obj/machinery/computer/transformation_designer