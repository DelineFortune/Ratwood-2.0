/datum/talent_tree_ui
	var/mob/owner

/datum/talent_tree_ui/New(mob/_owner)
	..()
	owner = _owner

/datum/talent_tree_ui/ui_state(mob/user)
	if(isnull(GLOB) || isnull(GLOB.always_state))
		return null
	return GLOB.always_state

/datum/talent_tree_ui/ui_status(mob/user)
	return UI_INTERACTIVE

/datum/talent_tree_ui/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Scholar", "Scholar", 1100, 700)
		if(ui.window)
			ui.window.locked = FALSE

		ui.open()

/datum/talent_tree_ui/ui_act(action, list/params, datum/tgui/ui)
	. = ..()
	if(.)
		return
	if(action == "close")
		SStgui.close_uis(src)
		return TRUE

/datum/talent_tree_ui/ui_data(mob/user)
	. = list()
	.["canvas"] = list("w"=1100, "h"=700)
	.["points"] = list("available"=25, "spent"=0, "max"=75)

	.["nodes"] = list(
		list("id"="n1",  "x"=560, "y"=80,  "state"="locked"),
		list("id"="n2",  "x"=650, "y"=80,  "state"="locked"),
		list("id"="n3",  "x"=740, "y"=80,  "state"="locked"),
		list("id"="n4",  "x"=560, "y"=170, "state"="locked"),
		list("id"="n5",  "x"=650, "y"=170, "state"="locked"),
		list("id"="n6",  "x"=740, "y"=170, "state"="locked"),
		list("id"="n7",  "x"=470, "y"=260, "state"="locked"),
		list("id"="n8",  "x"=650, "y"=260, "state"="available"),
		list("id"="n9",  "x"=830, "y"=260, "state"="locked"),
		list("id"="n10", "x"=560, "y"=360, "state"="locked"),
		list("id"="n11", "x"=740, "y"=360, "state"="locked"),
		list("id"="n12", "x"=650, "y"=460, "state"="locked"),
		list("id"="n13", "x"=560, "y"=560, "state"="locked"),
		list("id"="n14", "x"=740, "y"=560, "state"="locked"),
		list("id"="n15", "x"=650, "y"=640, "state"="locked")
	)

	.["edges"] = list(
		list("from"="n1","to"="n4"),
		list("from"="n2","to"="n5"),
		list("from"="n3","to"="n6"),
		list("from"="n4","to"="n7"),
		list("from"="n4","to"="n8"),
		list("from"="n5","to"="n8"),
		list("from"="n6","to"="n9"),
		list("from"="n7","to"="n10"),
		list("from"="n8","to"="n10"),
		list("from"="n8","to"="n11"),
		list("from"="n9","to"="n11"),
		list("from"="n10","to"="n12"),
		list("from"="n11","to"="n12"),
		list("from"="n12","to"="n13"),
		list("from"="n12","to"="n14"),
		list("from"="n13","to"="n15"),
		list("from"="n14","to"="n15")
	)
