/obj/vehicle/sealed/mecha/combat/marauder
	desc = "Heavy-duty, combat exosuit, developed for FOB defence operations or escorts."
	name = "\improper Defensive Mobile Suit MK.1"
	icon_state = "marauder"
	iff_signal = TGMC_LOYALIST_IFF
	base_icon_state = "marauder"
	move_delay = 5
//	minimap_icon = "mech_pilot"
	max_integrity = 500
	soft_armor = list(MELEE = 50, BULLET = 75, LASER = 75, ENERGY = 30, BOMB = 30, BIO = 0, FIRE = 100, ACID = 100)
	max_temperature = 60000
	wreckage = /obj/structure/mecha_wreckage/marauder
	mecha_flags = CANSTRAFE | IS_ENCLOSED | HAS_HEADLIGHTS
	mech_type = EXOSUIT_MODULE_COMBAT
	force = 45
	max_equip_by_category = list(
		MECHA_UTILITY = 3,
		MECHA_POWER = 2,
		MECHA_ARMOR = 3,
	)
	bumpsmash = FALSE
	materials = list(/datum/material/metal = 350000)

/obj/vehicle/sealed/mecha/combat/marauder/generate_actions()
	. = ..()
	initialize_passenger_action_type(/datum/action/vehicle/sealed/mecha/mech_smoke)
	initialize_passenger_action_type(/datum/action/vehicle/sealed/mecha/mech_zoom)

/obj/vehicle/sealed/mecha/combat/marauder/loaded
	equip_by_category = list(
		MECHA_L_ARM = null,
		MECHA_R_ARM = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack,
		MECHA_UTILITY = list(),
		MECHA_POWER = list(),
		MECHA_ARMOR = list(/obj/item/mecha_parts/mecha_equipment/armor/antiproj_armor_booster),
	)

/datum/action/vehicle/sealed/mecha/mech_smoke
	name = "Smoke"
	action_icon_state = "mech_smoke"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_MECHABILITY_SMOKE,
	)
/datum/action/vehicle/sealed/mecha/mech_smoke/action_activate(trigger_flags)
	if(!owner || !chassis || !(owner in chassis.occupants))
		return
	if(!TIMER_COOLDOWN_CHECK(src, COOLDOWN_MECHA_SMOKE) && chassis.smoke_charges>0)
		chassis.smoke_system.start()
		chassis.smoke_charges--
		TIMER_COOLDOWN_START(src, COOLDOWN_MECHA_SMOKE, chassis.smoke_cooldown)

/datum/action/vehicle/sealed/mecha/mech_zoom
	name = "Zoom"
	action_icon_state = "mech_zoom_off"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_MECHABILITY_TOGGLE_ZOOM,
	)
/datum/action/vehicle/sealed/mecha/mech_zoom/action_activate(trigger_flags)
	if(!owner?.client || !chassis || !(owner in chassis.occupants))
		return
	chassis.zoom_mode = !chassis.zoom_mode
	action_icon_state = "mech_zoom_[chassis.zoom_mode ? "on" : "off"]"
	chassis.log_message("Toggled zoom mode.", LOG_MECHA)
	to_chat(owner, "[icon2html(chassis, owner)]<font color='[chassis.zoom_mode?"blue":"red"]'>Zoom mode [chassis.zoom_mode?"en":"dis"]abled.</font>")
	if(chassis.zoom_mode)
		owner.client.view_size.set_view_radius_to(4.5)
		SEND_SOUND(owner, sound('sound/mecha/imag_enh.ogg', volume=50))
	else
		owner.client.view_size.reset_to_default()
	update_button_icon()

/obj/vehicle/sealed/mecha/combat/marauder/seraph
	desc = "Heavy-duty,Front line assault suit, intended for heavy duty attacks."
	name = "\improper Assault Mobile Suit MK.1"
	icon_state = "seraph"
	base_icon_state = "seraph"
	move_delay = 3
	max_integrity = 550
	wreckage = /obj/structure/mecha_wreckage/seraph
	force = 55
	max_equip_by_category = list(
		MECHA_UTILITY = 3,
		MECHA_POWER = 2,
		MECHA_ARMOR = 3,
	)
	equip_by_category = list(
		MECHA_L_ARM = null,
		MECHA_R_ARM = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack,
		MECHA_UTILITY = list(),
		MECHA_POWER = list(),
		MECHA_ARMOR = list(/obj/item/mecha_parts/mecha_equipment/armor/antiproj_armor_booster),
	)
/obj/vehicle/sealed/mecha/combat/marauder/seraphtgmc
	desc = "Heavy-duty,Front line assault suit, intended for heavy duty attacks."
	name = "\improper Assault Mobile Suit MK.1"
	icon_state = "seraph"
	base_icon_state = "seraph"
	move_delay = 3
	max_integrity = 550
	wreckage = /obj/structure/mecha_wreckage/seraph
	force = 55
	max_equip_by_category = list(
		MECHA_UTILITY = 3,
		MECHA_POWER = 2,
		MECHA_ARMOR = 3,
	)
	materials = list(/datum/material/metal = 500000)

/obj/vehicle/sealed/mecha/combat/marauder/mauler
	desc = "Super-Heavy-duty, combat exosuit, developed off of the existing Assault Mobile Suit MK.1 model. A literal juggernaut."
	name = "\improper Assault Heavy Mobile Suit MK.2"
	icon_state = "mauler"
	base_icon_state = "mauler"
	max_integrity = 1000
	wreckage = /obj/structure/mecha_wreckage/mauler
	max_equip_by_category = list(
		MECHA_UTILITY = 3,
		MECHA_POWER = 2,
		MECHA_ARMOR = 4,
	)
	destruction_sleep_duration = 20

/obj/vehicle/sealed/mecha/combat/marauder/mauler/loaded
	equip_by_category = list(
		MECHA_L_ARM = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/lmg,
		MECHA_R_ARM = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack,
		MECHA_UTILITY = list(),
		MECHA_POWER = list(),
		MECHA_ARMOR = list(/obj/item/mecha_parts/mecha_equipment/armor/antiproj_armor_booster),
	)

