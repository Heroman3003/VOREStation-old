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

	//var/datum/species/mob_species = GLOB.all_species[current_template.species]


	var/dat = "<head><title>Transformation Template Design</title></head><body>"

	dat += "<br>\[<a href='?src=\ref[src];operation=change_speciesname'>Change Species Name</a>\]"

	user << browse(dat, "window=tfconsole;size=400x500")
	onclose(user, "tfconsole")

/obj/machinery/computer/transformation_designer/Topic(href, href_list)
	if(..())
		return 1

	if(!href_list["operation"])
		return
	switch(href_list["operation"])
		if("change_speciesname")
			to_chat(usr, "This is where we change the species")

	src.updateUsrDialog()










/obj/item/weapon/circuitboard/transformation_designer
	name = T_BOARD("Transformation Template Designer")
	build_path = /obj/machinery/computer/transformation_designer