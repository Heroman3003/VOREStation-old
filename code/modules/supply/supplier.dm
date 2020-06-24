/datum/supplier
	var/name = null
	var/illegal = SUPPLIER_LEGAL
	var/currency_used = CURRENCY_VBUX
	var/list/supplypacks = list()
	var/list/supply_groups = list()
	var/list/material_prices = list()				// In supplier's used currency
	var/list/export_prices = list()					// In supplier's used currency
	var/supplier_tag
	var/datum/supplier_info/lore_info

/datum/supplier_info
	var/name = null
	var/desc = null
	var/export_info = null