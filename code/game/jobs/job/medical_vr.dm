/datum/job/cmo
	disallow_jobhop = TRUE

/datum/job/doctor
	spawn_positions = 5
	alt_titles = list(
		"Surgeon" = /decl/hierarchy/outfit/job/medical/doctor/surgeon,
		"Emergency Physician" = /decl/hierarchy/outfit/job/medical/doctor/emergency_physician,
		"Nurse" = /decl/hierarchy/outfit/job/medical/doctor/nurse)