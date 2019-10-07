#if !defined(USING_MAP_DATUM)

	#include "frostbound_defines.dm"
	#include "frostbound_turfs.dm"
	#include "frostbound_things.dm"
	#include "frostbound_areas.dm"
	#include "frostbound_shuttle_defs.dm"
	#include "frostbound_shuttles.dm"
	#include "frostbound_telecomms.dm"

	#include "frostbound-01-underground3.dmm"
	#include "frostbound-02-underground2.dmm"
	#include "frostbound-03-underground1.dmm"
	#include "frostbound-04-surface.dmm"
	#include "frostbound-05-satellite.dmm"
	#include "frostbound-06-mining.dmm"
	#include "frostbound-07-central.dmm"

	#include "submaps/_frostbound_submaps.dm"

	#define USING_MAP_DATUM /datum/map/frostbound

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Cerberus

#endif