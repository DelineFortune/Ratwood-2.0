/obj/effect/proc_holder/spell/invoked/self/open_scholar_html
	name = "Open Scholar"
	desc = "Opens the Scholar HTML UI."
	overlay_state = "generic"
	clothes_req = FALSE
	chargedrain = 0
	releasedrain = 0
	chargetime = 0
	range = 0
	movement_interrupt = FALSE
	spell_tier = 1
	invocation_type = "whisper"
	recharge_time = 5 SECONDS
	cost = 0

	var/datum/scholar_html_interface/ui_holder

/obj/effect/proc_holder/spell/invoked/self/open_scholar_html/cast(list/targets, mob/user = usr)
	if(!user)
		revert_cast()
		return FALSE

	if(!ui_holder)
		ui_holder = new /datum/scholar_html_interface(user)
	else
		ui_holder.user = user

	ui_holder.open()
	return TRUE