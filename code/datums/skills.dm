#define SKILLSID "skills-[cqc]-[melee_weapons]\
-[firearms]-[pistols]-[shotguns]-[rifles]-[smgs]-[heavy_weapons]-[smartgun]\
-[engineer]-[construction]-[leadership]-[medical]-[surgery]-[pilot]-[police]-[powerloader]-[large_vehicle]"

#define SKILLSIDSRC(S) "skills-[S.cqc]-[S.melee_weapons]\
-[S.firearms]-[S.pistols]-[S.shotguns]-[S.rifles]-[S.smgs]-[S.heavy_weapons]-[S.smartgun]\
-[S.engineer]-[S.construction]-[S.leadership]-[S.medical]-[S.surgery]-[S.pilot]-[S.police]-[S.powerloader]-[S.large_vehicle]"

/proc/getSkills(cqc = 0, melee_weapons = 0,\
firearms = 0, pistols = 0, shotguns = 0, rifles = 0, smgs = 0, heavy_weapons = 0, smartgun = 0,\
engineer = 0, construction = 0, leadership = 0, medical = 0, surgery = 0, pilot = 0, police = 0, powerloader = 0, large_vehicle = 0)
	. = locate(SKILLSID)
	if(!.)
		. = new /datum/skills(cqc, melee_weapons,\
			firearms, pistols, shotguns, rifles, smgs, heavy_weapons, smartgun,\
			engineer, construction, leadership, medical, surgery, pilot, police, powerloader, large_vehicle)

/proc/getSkillsType(skills_type = /datum/skills)
	var/datum/skills/new_skill = skills_type
	var/cqc = initial(new_skill.cqc)
	var/melee_weapons = initial(new_skill.melee_weapons)
	var/firearms = initial(new_skill.firearms)
	var/pistols = initial(new_skill.pistols)
	var/shotguns = initial(new_skill.shotguns)
	var/rifles = initial(new_skill.rifles)
	var/smgs = initial(new_skill.smgs)
	var/heavy_weapons = initial(new_skill.heavy_weapons)
	var/smartgun = initial(new_skill.smartgun)
	var/engineer = initial(new_skill.engineer)
	var/construction = initial(new_skill.construction)
	var/leadership = initial(new_skill.leadership)
	var/medical = initial(new_skill.medical)
	var/surgery = initial(new_skill.surgery)
	var/pilot = initial(new_skill.pilot)
	var/police = initial(new_skill.police)
	var/powerloader = initial(new_skill.powerloader)
	var/large_vehicle = initial(new_skill.large_vehicle)
	. = locate(SKILLSID)
	if(!.)
		. = new skills_type

/datum/skills
	datum_flags = DF_USE_TAG
	var/name = "Default/Custom"
	var/cqc = SKILL_CQC_DEFAULT
	var/melee_weapons = SKILL_MELEE_DEFAULT

	var/firearms = SKILL_FIREARMS_DEFAULT
	var/pistols = SKILL_PISTOLS_DEFAULT
	var/shotguns = SKILL_SHOTGUNS_DEFAULT
	var/rifles = SKILL_RIFLES_DEFAULT
	var/smgs = SKILL_SMGS_DEFAULT
	var/heavy_weapons = SKILL_HEAVY_WEAPONS_DEFAULT
	var/smartgun = SKILL_SMART_DEFAULT

	var/engineer = SKILL_ENGINEER_DEFAULT
	var/construction = SKILL_CONSTRUCTION_DEFAULT
	var/leadership = SKILL_LEAD_NOVICE
	var/medical = SKILL_MEDICAL_UNTRAINED
	var/surgery = SKILL_SURGERY_DEFAULT
	var/pilot = SKILL_PILOT_DEFAULT
	var/police = SKILL_POLICE_DEFAULT
	var/powerloader = SKILL_POWERLOADER_DEFAULT
	var/large_vehicle = SKILL_LARGE_VEHICLE_DEFAULT


/datum/skills/New(cqc, melee_weapons,\
firearms, pistols, shotguns, rifles, smgs, heavy_weapons, smartgun,\
engineer, construction, leadership, medical, surgery, pilot, police, powerloader, large_vehicle)
	if(!isnull(cqc))
		src.cqc = cqc
	if(!isnull(melee_weapons))
		src.melee_weapons = melee_weapons
	if(!isnull(firearms))
		src.firearms = firearms
	if(!isnull(pistols))
		src.pistols = pistols
	if(!isnull(shotguns))
		src.shotguns = shotguns
	if(!isnull(rifles))
		src.rifles = rifles
	if(!isnull(smgs))
		src.smgs = smgs
	if(!isnull(heavy_weapons))
		src.heavy_weapons = heavy_weapons
	if(!isnull(smartgun))
		src.smartgun = smartgun
	if(!isnull(engineer))
		src.engineer = engineer
	if(!isnull(construction))
		src.construction = construction
	if(!isnull(leadership))
		src.leadership = leadership
	if(!isnull(medical))
		src.medical = medical
	if(!isnull(surgery))
		src.surgery = surgery
	if(!isnull(pilot))
		src.pilot = pilot
	if(!isnull(police))
		src.police = police
	if(!isnull(powerloader))
		src.powerloader = powerloader
	if(!isnull(large_vehicle))
		src.large_vehicle = large_vehicle
	tag = SKILLSIDSRC(src)

/datum/skills/proc/modifyRating(cqc, melee_weapons,\
firearms, pistols, shotguns, rifles, smgs, heavy_weapons, smartgun,\
engineer, construction, leadership, medical, surgery, pilot, police, powerloader, large_vehicle)
	return getSkills(src.cqc+cqc,\
	src.melee_weapons+melee_weapons,\
	src.firearms+firearms,\
	src.pistols+pistols,\
	src.shotguns+shotguns,\
	src.rifles+rifles,\
	src.smgs+smgs,\
	src.heavy_weapons+heavy_weapons,\
	src.smartgun+smartgun,\
	src.engineer+engineer,\
	src.construction+construction,\
	src.leadership+leadership,\
	src.medical+medical,\
	src.surgery+surgery,\
	src.pilot+pilot,\
	src.police+police,\
	src.powerloader+powerloader,\
	src.large_vehicle+large_vehicle)

/datum/skills/proc/modifyAllRatings(difference)
	return getSkills(src.cqc+difference,\
	src.melee_weapons+difference,\
	src.firearms+difference,\
	src.pistols+difference,\
	src.shotguns+difference,\
	src.rifles+difference,\
	src.smgs+difference,\
	src.heavy_weapons+difference,\
	src.smartgun+difference,\
	src.engineer+difference,\
	src.construction+difference,\
	src.leadership+difference,\
	src.medical+difference,\
	src.surgery+difference,\
	src.pilot+difference,\
	src.police+difference,\
	src.powerloader+difference,\
	src.large_vehicle+difference)

/datum/skills/proc/setRating(cqc, melee_weapons,\
firearms, pistols, shotguns, rifles, smgs, heavy_weapons, smartgun,\
engineer, construction, leadership, medical, surgery, pilot, police, powerloader, large_vehicle)
	return getSkills((isnull(cqc) ? src.cqc : cqc),\
		(isnull(melee_weapons) ? src.melee_weapons : melee_weapons),\
		(isnull(firearms) ? src.firearms : firearms),\
		(isnull(pistols) ? src.pistols : pistols),\
		(isnull(shotguns) ? src.shotguns : shotguns),\
		(isnull(rifles) ? src.rifles : rifles),\
		(isnull(smgs) ? src.smgs : smgs),\
		(isnull(heavy_weapons) ? src.heavy_weapons : heavy_weapons),\
		(isnull(smartgun) ? src.smartgun : smartgun),\
		(isnull(engineer) ? src.engineer : engineer),\
		(isnull(construction) ? src.construction : construction),\
		(isnull(leadership) ? src.leadership : leadership),\
		(isnull(medical) ? src.medical : medical),\
		(isnull(surgery) ? src.surgery : surgery),\
		(isnull(pilot) ? src.pilot : pilot),\
		(isnull(police) ? src.police : police),\
		(isnull(powerloader) ? src.powerloader : powerloader),\
		(isnull(large_vehicle) ? src.large_vehicle : large_vehicle))

/datum/skills/vv_edit_var(var_name, var_value)
	if(var_name == NAMEOF(src, tag))
		return FALSE
	. = ..()
	tag = SKILLSID

#undef SKILLSID

/datum/skills/proc/getPercent(rating, max_rating)
	return CLAMP01(max(vars[rating], 0) * 100 / max_rating * 0.01)

/datum/skills/proc/getRating(rating)
	return vars[rating]

/datum/skills/proc/getList()
	return list("cqc" = cqc,\
		"melee_weapons" = melee_weapons,\
		"firearms" = firearms,\
		"pistols" = pistols,\
		"shotguns" = shotguns,\
		"rifles" = rifles,\
		"smgs" = smgs,\
		"heavy_weapons" = heavy_weapons,\
		"smartgun" = smartgun,\
		"engineer" = engineer,\
		"construction" = construction,\
		"leadership" = leadership,\
		"medical" = medical,\
		"surgery" = surgery,\
		"pilot" = pilot,\
		"police" = police,\
		"powerloader" = powerloader,\
		"large_vehicle" = large_vehicle)

/datum/skills/MP
	name = "Military Police"
	cqc = SKILL_CQC_MP
	police = SKILL_POLICE_MP
	construction = 2
	engineer = SKILL_ENGINEER_ENGI
	medical = SKILL_MEDICAL_PRACTICED
	surgery = SKILL_SURGERY_TRAINED

/datum/skills/CMP
	name = COMMAND_MASTER_AT_ARMS
	cqc = SKILL_CQC_MP
	police = SKILL_POLICE_MP
	medical = SKILL_MEDICAL_EXPERT
	surgery = SKILL_SURGERY_EXPERT
	construction = SKILL_CONSTRUCTION_MASTER
	engineer = SKILL_ENGINEER_MASTER
	powerloader = SKILL_POWERLOADER_MASTER
	leadership = 4

/datum/skills/civilian
	name = "Civilian"
	cqc = SKILL_CQC_WEAK
	firearms = SKILL_FIREARMS_UNTRAINED
	melee_weapons = SKILL_MELEE_WEAK

/datum/skills/civilian/survivor
	name = "Survivor"
	engineer = SKILL_ENGINEER_ENGI //to hack airlocks so they're never stuck in a room.
	firearms = SKILL_FIREARMS_UNTRAINED
	construction = SKILL_CONSTRUCTION_METAL
	medical = SKILL_MEDICAL_PRACTICED

/datum/skills/civilian/survivor/civilian
	name = "Survivor civilian"
	engineer = 2
	medical = 2
	construction = 2
	pistols = 2

/datum/skills/civilian/survivor/liaison
	name = "Survivor Liaison"
	engineer = 1
	medical = 1
	pistols = 2

/datum/skills/civilian/survivor/botanist
	name = "Survivor Botanist"
	engineer = 1
	medical = 1
	pistols = 1
	melee_weapons = 2
	cqc = 1

/datum/skills/civilian/survivor/master
	name = "Survivor"
	firearms = SKILL_FIREARMS_DEFAULT
	medical = SKILL_MEDICAL_EXPERT
	surgery = SKILL_SURGERY_EXPERT
	construction = SKILL_CONSTRUCTION_MASTER
	engineer = SKILL_ENGINEER_MASTER
	powerloader = SKILL_POWERLOADER_MASTER
	police = SKILL_POLICE_FLASH

/datum/skills/civilian/survivor/doctor
	name = "Survivor Doctor"
	medical = SKILL_MEDICAL_COMPETENT
	surgery = SKILL_SURGERY_EXPERT
	engineer = 1
	pistols = 1


/datum/skills/civilian/survivor/scientist
	name = "Survivor Scientist"
	medical = 3
	surgery = SKILL_SURGERY_PROFESSIONAL
	pistols = 1

/datum/skills/civilian/survivor/chef
	name = "Survivor Chef"
	melee_weapons = 4
	cqc = 4
	engineer = 1
	medical = 1
	pistols = 1

/datum/skills/civilian/survivor/chaplain
	name = "Survivor Chaplain"
	shotguns = SKILL_SHOTGUNS_SPECIALIZED
	melee_weapons = 1
	engineer = 1
	medical = 1

/datum/skills/civilian/survivor/miner
	name = "Survivor Miner"

	melee_weapons = 1
	heavy_weapons = SKILL_HEAVY_WEAPONS_SPECIALIZED
	powerloader = SKILL_POWERLOADER_TRAINED
	cqc = 1
	medical = 1

/datum/skills/civilian/survivor/atmos
	name = "Survivor Atmos Tech"
	engineer = SKILL_ENGINEER_MASTER
	construction = SKILL_CONSTRUCTION_MASTER
	pistols = 1
	medical = 1

/datum/skills/civilian/survivor/security
	name = "Survivor Security"
	cqc = SKILL_CQC_MP
	firearms = SKILL_FIREARMS_DEFAULT
	melee_weapons = 1
	police = SKILL_POLICE_MP
	engineer = 1
	medical = 1

/datum/skills/civilian/survivor/marshal
	name = "Survivor Marshal"
	cqc = 3
	firearms = SKILL_FIREARMS_DEFAULT
	melee_weapons = 2
	pistols = 2
	police = SKILL_POLICE_MP
	leadership = SKILL_LEAD_MASTER
	engineer = 1

/datum/skills/civilian/survivor/marshal/deputy
	leadership = SKILL_LEAD_EXPERT
	pistols = 1
	melee_weapons = 1
	cqc = 2
	engineer = 1

/datum/skills/civilian/survivor/director
	name = "Colony Director"
	leadership = SKILL_LEAD_OVERBOARD
	pistols = SKILL_PISTOLS_SPECIALIZED
	firearms = SKILL_FIREARMS_UNTRAINED
	melee_weapons = SKILL_MELEE_DEFAULT
	police = SKILL_POLICE_MP
	engineer = 2


/datum/skills/civilian/survivor/prisoner
	name = "Survivor Prisoner"
	cqc = SKILL_CQC_DEFAULT
	firearms = SKILL_FIREARMS_DEFAULT
	melee_weapons = SKILL_MELEE_DEFAULT
	pistols = SKILL_PISTOLS_DEFAULT

/datum/skills/combat_engineer
	name = "Combat Engineer"
	engineer = SKILL_ENGINEER_ENGI
	construction = SKILL_CONSTRUCTION_ADVANCED
	leadership = SKILL_LEAD_BEGINNER
	powerloader = SKILL_POWERLOADER_DABBLING
	heavy_weapons = SKILL_HEAVY_WEAPONS_TRAINED

/datum/skills/combat_medic
	name = "Combat Medic"
	leadership = SKILL_LEAD_BEGINNER
	medical = SKILL_MEDICAL_COMPETENT
	engineer = SKILL_ENGINEER_METAL
	surgery = SKILL_SURGERY_PROFESSIONAL
	pistols = SKILL_PISTOLS_TRAINED
	smgs = SKILL_SMGS_TRAINED

/datum/skills/combat_medic/crafty
	name = "Crafty Combat Medic"
	construction = SKILL_CONSTRUCTION_METAL
	engineer = SKILL_ENGINEER_METAL

/datum/skills/doctor
	name = "Doctor"
	cqc = SKILL_CQC_WEAK
	firearms = SKILL_FIREARMS_UNTRAINED
	medical = SKILL_MEDICAL_MASTER
	surgery = SKILL_SURGERY_MASTER
	melee_weapons = SKILL_MELEE_WEAK

/datum/skills/cmo
	name = "CMO"
	cqc = SKILL_CQC_WEAK
	firearms = SKILL_FIREARMS_UNTRAINED
	leadership = SKILL_LEAD_TRAINED
	medical = SKILL_MEDICAL_MASTER
	surgery = SKILL_SURGERY_MASTER
	melee_weapons = SKILL_MELEE_WEAK
	police = SKILL_POLICE_MP

/datum/skills/ai
	name = "AI"
	engineer = SKILL_ENGINEER_MASTER
	construction = SKILL_CONSTRUCTION_MASTER
	firearms = SKILL_FIREARMS_UNTRAINED
	medical = SKILL_MEDICAL_EXPERT
	leadership = SKILL_LEAD_MASTER
	surgery = SKILL_SURGERY_EXPERT
	pilot = SKILL_PILOT_TRAINED
	police = SKILL_POLICE_MP
	powerloader = SKILL_POWERLOADER_MASTER

/datum/skills/synthetic
	name = SYNTHETIC
	engineer = SKILL_ENGINEER_MASTER
	construction = SKILL_CONSTRUCTION_MASTER
	firearms = SKILL_FIREARMS_UNTRAINED
	medical = SKILL_MEDICAL_EXPERT
	cqc = SKILL_CQC_MASTER
	surgery = SKILL_SURGERY_EXPERT
	pilot = SKILL_PILOT_TRAINED
	melee_weapons = SKILL_MELEE_DEFAULT
	pistols = SKILL_PISTOLS_TRAINED
	police = SKILL_POLICE_MP
	powerloader = SKILL_POWERLOADER_MASTER

/datum/skills/early_synthetic
	name = "Early Synthetic"
	engineer = SKILL_ENGINEER_INHUMAN
	construction = SKILL_CONSTRUCTION_INHUMAN
	firearms = SKILL_FIREARMS_UNTRAINED
	medical = SKILL_SURGERY_PROFESSIONAL
	cqc = SKILL_CQC_MASTER
	surgery = SKILL_SURGERY_PROFESSIONAL
	pilot = SKILL_PILOT_TRAINED
	melee_weapons = SKILL_MELEE_DEFAULT
	pistols = SKILL_PISTOLS_TRAINED
	police = SKILL_POLICE_MP
	powerloader = SKILL_POWERLOADER_MASTER

/datum/skills/captain
	name = CAPTAIN
	leadership = SKILL_LEAD_MASTER
	police = SKILL_POLICE_MP
	medical = SKILL_SURGERY_PROFESSIONAL
	surgery = SKILL_SURGERY_PROFESSIONAL
	engineer = SKILL_ENGINEER_ENGI
	construction = SKILL_CONSTRUCTION_ADVANCED
	powerloader = SKILL_POWERLOADER_MASTER
	cqc = SKILL_CQC_DEFAULT
	melee_weapons = SKILL_MELEE_DEFAULT
	firearms = SKILL_FIREARMS_TRAINED
	pistols = SKILL_PISTOLS_TRAINED
	shotguns = SKILL_SHOTGUNS_TRAINED
	rifles = SKILL_RIFLES_TRAINED
	smgs = SKILL_SMGS_TRAINED
	heavy_weapons = SKILL_HEAVY_WEAPONS_TRAINED
	smartgun = SKILL_SMART_TRAINED


/datum/skills/fo
	name = FIELD_COMMANDER
	engineer = SKILL_ENGINEER_ENGI //to fix CIC apc.
	construction = SKILL_CONSTRUCTION_PLASTEEL
	leadership = SKILL_LEAD_MASTER
	medical = SKILL_MEDICAL_PRACTICED
	surgery = SKILL_SURGERY_PROFESSIONAL
	police = SKILL_POLICE_MP
	powerloader = SKILL_POWERLOADER_TRAINED
	cqc = SKILL_CQC_TRAINED

/datum/skills/so
	name = STAFF_OFFICER
	construction = SKILL_CONSTRUCTION_PLASTEEL
	leadership = SKILL_LEAD_EXPERT
	engineer = SKILL_ENGINEER_ENGI //to fix CIC apc.
	construction = SKILL_CONSTRUCTION_PLASTEEL
//	leadership = SKILL_LEAD_MASTER
	medical = SKILL_MEDICAL_PRACTICED
	surgery = SKILL_SURGERY_PROFESSIONAL
	police = SKILL_POLICE_MP
	powerloader = SKILL_POWERLOADER_TRAINED
	cqc = SKILL_CQC_TRAINED

/datum/skills/pilot
	name = PILOT_OFFICER
	engineer = SKILL_ENGINEER_ENGI //to fix CIC apc.
	construction = SKILL_CONSTRUCTION_PLASTEEL
	leadership = SKILL_LEAD_MASTER
	medical = SKILL_MEDICAL_PRACTICED
	surgery = SKILL_SURGERY_AMATEUR
	police = SKILL_POLICE_MP
	powerloader = SKILL_POWERLOADER_TRAINED
	cqc = SKILL_CQC_TRAINED

/datum/skills/mech_pilot
	name = MECH_PILOT
	engineer = 3
	construction = 3
	medical = 2
	surgery = 2
	powerloader = SKILL_POWERLOADER_PRO
	large_vehicle = SKILL_LARGE_VEHICLE_TRAINED

/datum/skills/ce
	name = CHIEF_SHIP_ENGINEER
	engineer = SKILL_ENGINEER_MASTER
	construction = SKILL_CONSTRUCTION_MASTER
	leadership = SKILL_LEAD_MASTER
	police = SKILL_POLICE_MP
	powerloader = SKILL_POWERLOADER_MASTER

/datum/skills/ro
	name = "Requisition Officer"
	engineer = SKILL_ENGINEER_ENGI //to fix CIC apc.
	construction = SKILL_CONSTRUCTION_PLASTEEL
	leadership = SKILL_LEAD_MASTER
	medical = SKILL_MEDICAL_PRACTICED
	surgery = SKILL_SURGERY_AMATEUR
	police = SKILL_POLICE_MP
	powerloader = SKILL_POWERLOADER_TRAINED
	cqc = SKILL_CQC_TRAINED

/datum/skills/st
	name = SHIP_TECH
	engineer = SKILL_ENGINEER_MASTER
	construction = SKILL_CONSTRUCTION_MASTER
	powerloader = SKILL_POWERLOADER_MASTER
	medical = SKILL_MEDICAL_PRACTICED // Allows use of chem dispenser, needed for Ordnance.

/datum/skills/pmc
	name = "PMC Private"
	cqc = 2
	melee_weapons = 1
	firearms = 2
	construction = 2
	engineer = 2
	medical = 2
	surgery = 1
	police = 2

/datum/skills/ert
	name = "ERT Grunt"
	cqc = 5
	melee_weapons = 2
	firearms = 2
	engineer = 2
	construction = 2
	leadership = 1
	medical = 2
	surgery = 2
	pilot = 0
	police = 2
	powerloader = 2

/datum/skills/ert/leader
	name = "ERT Leader"
	leadership = 5
	pilot = 1
	medical = 4

/datum/skills/ert/medic
	name = "ERT Medic"
	medical = 5
	surgery = 5

/datum/skills/ert/engi
	name = "ERT Engineer"
	engineer = 5
	construction = 5

/datum/skills/crafty
	name = "Crafty Private"
	construction = SKILL_CONSTRUCTION_METAL
	engineer = SKILL_ENGINEER_METAL
	medical = SKILL_MEDICAL_PRACTICED
	surgery = SKILL_SURGERY_TRAINED

/datum/skills/special_forces_standard
	name = "Special Force Standard"
	construction = SKILL_CONSTRUCTION_METAL
	engineer = SKILL_ENGINEER_METAL
	police = SKILL_POLICE_MP

/datum/skills/sl
	name = SQUAD_LEADER
	cqc = SKILL_CQC_TRAINED
	construction = SKILL_CONSTRUCTION_PLASTEEL
	engineer = SKILL_ENGINEER_PLASTEEL
	leadership = SKILL_LEAD_EXPERT
	medical = SKILL_MEDICAL_PRACTICED
	surgery = SKILL_SURGERY_TRAINED

/datum/skills/sl/clf
	name = "CLF leader"
	construction = SKILL_CONSTRUCTION_METAL
	engineer = SKILL_ENGINEER_METAL
	leadership = SKILL_LEAD_TRAINED

/datum/skills/sl/upp
	name = "UPP Leader"
	firearms = SKILL_FIREARMS_TRAINED
	medical = SKILL_MEDICAL_PRACTICED
	surgery = SKILL_SURGERY_AMATEUR
	pistols = SKILL_PISTOLS_TRAINED
	smgs = SKILL_SMGS_TRAINED
	rifles = SKILL_RIFLES_TRAINED
	shotguns = SKILL_SHOTGUNS_TRAINED
	heavy_weapons = SKILL_HEAVY_WEAPONS_TRAINED

/datum/skills/sl/pmc
	name = "PMC Leader"
	cqc = 4
	melee_weapons = 1
	firearms = SKILL_FIREARMS_TRAINED
	pistols = SKILL_PISTOLS_TRAINED
	smgs = SKILL_SMGS_TRAINED
	rifles = SKILL_RIFLES_TRAINED
	shotguns = SKILL_SHOTGUNS_TRAINED
	heavy_weapons = SKILL_HEAVY_WEAPONS_TRAINED
	leadership = 5
	medical = 4
	surgery = 3
	construction = 4
	engineer = 4
	police = 2

/datum/skills/sl/pmc/special_forces
	name = "Special Force Leader"
	police = SKILL_POLICE_MP

/datum/skills/specialist
	name = SQUAD_SPECIALIST
	cqc = SKILL_CQC_TRAINED
	construction = SKILL_CONSTRUCTION_METAL
	engineer = SKILL_ENGINEER_METAL //to use c4 in scout set.
	smartgun = SKILL_SMART_TRAINED
	leadership = SKILL_LEAD_BEGINNER
	melee_weapons = SKILL_MELEE_TRAINED

/datum/skills/specialist/pmc
	name = "PMC Specialist"
	cqc = 4
	melee_weapons = 1
	firearms = SKILL_FIREARMS_TRAINED
	pistols = SKILL_PISTOLS_TRAINED
	smgs = SKILL_SMGS_TRAINED
	rifles = SKILL_RIFLES_TRAINED
	shotguns = SKILL_SHOTGUNS_TRAINED
	heavy_weapons = SKILL_HEAVY_WEAPONS_TRAINED
	engineer = 3
	construction = 3
	medical = 3
	surgery = 2
	police = 2

/datum/skills/specialist/upp
	name = "UPP Specialist"
	firearms = SKILL_FIREARMS_TRAINED
	pistols = SKILL_PISTOLS_TRAINED
	smgs = SKILL_SMGS_TRAINED
	rifles = SKILL_RIFLES_TRAINED
	shotguns = SKILL_SHOTGUNS_TRAINED
	heavy_weapons = SKILL_HEAVY_WEAPONS_TRAINED

/datum/skills/smartgunner
	name = SQUAD_SMARTGUNNER
	construction = SKILL_CONSTRUCTION_METAL
	engineer = SKILL_ENGINEER_METAL
	medical = SKILL_MEDICAL_PRACTICED
	surgery = SKILL_SURGERY_TRAINED
	smartgun = SKILL_SMART_TRAINED
	leadership = SKILL_LEAD_BEGINNER

/datum/skills/smartgunner/pmc
	name = "PMC Smartgunner"
	cqc = 3
	engineer = 2
	construction = 2
	firearms = SKILL_FIREARMS_TRAINED
	smartgun = SKILL_SMART_TRAINED
	leadership = SKILL_LEAD_BEGINNER
	melee_weapons = SKILL_MELEE_TRAINED
	pistols = SKILL_PISTOLS_TRAINED
	smgs = SKILL_SMGS_TRAINED
	rifles = SKILL_RIFLES_TRAINED
	shotguns = SKILL_SHOTGUNS_TRAINED
	heavy_weapons = SKILL_HEAVY_WEAPONS_TRAINED
	medical = 3
	police = 2

/datum/skills/commando
	name = "Commando"
	cqc = 3
	engineer = SKILL_ENGINEER_ENGI
	construction = SKILL_CONSTRUCTION_PLASTEEL
	firearms = SKILL_FIREARMS_TRAINED
	leadership = SKILL_LEAD_BEGINNER
	medical = SKILL_MEDICAL_NOVICE
	surgery = SKILL_SURGERY_AMATEUR
	melee_weapons = SKILL_MELEE_TRAINED
	pistols = SKILL_PISTOLS_TRAINED
	smgs = SKILL_SMGS_TRAINED
	rifles = SKILL_RIFLES_TRAINED
	shotguns = SKILL_SHOTGUNS_TRAINED
	heavy_weapons = SKILL_HEAVY_WEAPONS_TRAINED

/datum/skills/commando/medic
	name = "Commando Medic"
	medical = SKILL_MEDICAL_PRACTICED
	surgery = SKILL_SURGERY_TRAINED

/datum/skills/commando/leader
	name ="Commando Leader"
	leadership = SKILL_LEAD_TRAINED

/datum/skills/commando/deathsquad
	name = "Deathsquad"
	cqc = SKILL_CQC_MASTER
	smartgun = SKILL_SMART_TRAINED
	medical = SKILL_MEDICAL_PRACTICED
	surgery = SKILL_SURGERY_TRAINED

/datum/skills/mercenary
	name = "Mercenary"
	cqc = SKILL_CQC_MP
	engineer = SKILL_ENGINEER_ENGI
	construction = SKILL_CONSTRUCTION_PLASTEEL
	firearms = SKILL_FIREARMS_TRAINED
	leadership = SKILL_LEAD_BEGINNER
	medical = SKILL_MEDICAL_NOVICE
	surgery = SKILL_SURGERY_AMATEUR
	melee_weapons = SKILL_MELEE_TRAINED
	pistols = SKILL_PISTOLS_TRAINED
	smgs = SKILL_SMGS_TRAINED
	rifles = SKILL_RIFLES_TRAINED
	shotguns = SKILL_SHOTGUNS_TRAINED
	heavy_weapons = SKILL_HEAVY_WEAPONS_TRAINED

/datum/skills/spy
	name = "Spy"
	cqc = SKILL_CQC_TRAINED
	firearms = SKILL_FIREARMS_TRAINED
	pistols = SKILL_PISTOLS_TRAINED
	smgs = SKILL_SMGS_TRAINED
	rifles = SKILL_RIFLES_TRAINED
	shotguns = SKILL_SHOTGUNS_TRAINED
	heavy_weapons = SKILL_HEAVY_WEAPONS_TRAINED
	engineer = SKILL_ENGINEER_MASTER
	construction = SKILL_CONSTRUCTION_ADVANCED
	leadership = SKILL_LEAD_BEGINNER
	medical = SKILL_MEDICAL_NOVICE
	surgery = SKILL_SURGERY_AMATEUR
	powerloader = SKILL_POWERLOADER_TRAINED

/datum/skills/admiral
	name = "admiral"
	engineer = SKILL_ENGINEER_MASTER
	construction = SKILL_CONSTRUCTION_MASTER
	firearms = SKILL_FIREARMS_TRAINED
	smartgun = SKILL_SMART_TRAINED
	medical = SKILL_MEDICAL_MASTER
	cqc = SKILL_CQC_MASTER
	surgery = SKILL_SURGERY_EXPERT
	melee_weapons = SKILL_MELEE_SUPER
	leadership = SKILL_LEAD_MASTER
	pilot = SKILL_PILOT_TRAINED
	pistols = SKILL_PISTOLS_TRAINED
	smgs = SKILL_SMGS_TRAINED
	rifles = SKILL_RIFLES_TRAINED
	shotguns = SKILL_SHOTGUNS_TRAINED
	heavy_weapons = SKILL_HEAVY_WEAPONS_TRAINED
	police = SKILL_POLICE_MP
	powerloader = SKILL_POWERLOADER_MASTER
	large_vehicle = SKILL_LARGE_VEHICLE_TRAINED

/datum/skills/ninja
	name = "Ninja"
	cqc = SKILL_CQC_MASTER
	construction = SKILL_CONSTRUCTION_METAL
	leadership = SKILL_LEAD_BEGINNER
	medical = SKILL_MEDICAL_NOVICE
	surgery = SKILL_SURGERY_AMATEUR
	melee_weapons = SKILL_MELEE_SUPER

/datum/skills/spatial_agent
	name = "Spatial Agent"
	engineer = SKILL_ENGINEER_MASTER
	construction = SKILL_CONSTRUCTION_MASTER
	firearms = SKILL_FIREARMS_TRAINED
	smartgun = SKILL_SMART_TRAINED
	medical = SKILL_MEDICAL_MASTER
	cqc = SKILL_CQC_MASTER
	surgery = SKILL_SURGERY_EXPERT
	melee_weapons = SKILL_MELEE_SUPER
	leadership = SKILL_LEAD_MASTER
	pilot = SKILL_PILOT_TRAINED
	pistols = SKILL_PISTOLS_TRAINED
	smgs = SKILL_SMGS_TRAINED
	rifles = SKILL_RIFLES_TRAINED
	shotguns = SKILL_SHOTGUNS_TRAINED
	heavy_weapons = SKILL_HEAVY_WEAPONS_TRAINED
	police = SKILL_POLICE_MP
	powerloader = SKILL_POWERLOADER_MASTER
	large_vehicle = SKILL_LARGE_VEHICLE_TRAINED

/datum/skills/marsoc
	name = "MARSOC Member"
	engineer = 3
	construction = 3
	firearms = 2
	smartgun = 0
	medical = 5
	cqc = 5
	surgery = 2
	melee_weapons = 3
	leadership = 1
	pilot = 0
	pistols = 0
	smgs = 0
	rifles = 0
	shotguns = 0
	heavy_weapons = 0
	police = 2
	powerloader = 1
	large_vehicle = 0

/datum/skills/marsoc/officer
	name = "MARSOC Officer"
	engineer = 4
	construction = 4
	firearms = 2
	smartgun = 0
	medical = 5
	cqc = 5
	surgery = 5
	melee_weapons = 3
	leadership = 6
	pilot = 0
	pistols = 0
	smgs = 0
	rifles = 0
	shotguns = 0
	heavy_weapons = 0
	police = 2
	powerloader = 2
	large_vehicle = 1

/*======  I.o.M.  ======*/

/datum/skills/imperial
	name = "Guardsman"
	cqc = SKILL_CQC_TRAINED
	melee_weapons = SKILL_MELEE_TRAINED

	// guardsmen don't use pistol, so he doesn't have experience with them, unless they use boltpistols
	// shotguns too
	firearms = SKILL_FIREARMS_TRAINED
	rifles = SKILL_RIFLES_TRAINED
	// smgs too

/datum/skills/imperial/sl
	name = "Guardsman Sergeant" // veteran guardsman, practically better in all

	heavy_weapons = SKILL_HEAVY_WEAPONS_TRAINED
	smartgun = SKILL_SMART_USE // can use smartgun

	// higher SL skills
	engineer = SKILL_ENGINEER_ENGI
	construction = SKILL_CONSTRUCTION_ADVANCED
	leadership = SKILL_LEAD_EXPERT
	medical = SKILL_MEDICAL_PRACTICED
	surgery = SKILL_SURGERY_TRAINED

/datum/skills/imperial/medicae
	name = "Guardsman Medicae" // medic
	leadership = SKILL_LEAD_BEGINNER // normal medics have it
	medical = SKILL_MEDICAL_COMPETENT // was told to add skills
	surgery = SKILL_SURGERY_PROFESSIONAL

/datum/skills/imperial/astartes
	name = "Space Marine" // practically a god
	cqc = SKILL_CQC_MASTER
	melee_weapons = SKILL_MELEE_SUPER // chainswords are literally used about the same or more than their boltpistols

	firearms = SKILL_FIREARMS_TRAINED
	pistols = SKILL_PISTOLS_TRAINED
	shotguns = SKILL_SHOTGUNS_TRAINED
	rifles = SKILL_RIFLES_TRAINED
	smgs = SKILL_SMGS_TRAINED
	heavy_weapons = SKILL_HEAVY_WEAPONS_TRAINED
	smartgun = SKILL_SMART_TRAINED

	//endurance = 0 - does nothing
	engineer = SKILL_ENGINEER_PLASTEEL
	construction = SKILL_CONSTRUCTION_PLASTEEL
	leadership = SKILL_LEAD_TRAINED
	medical = SKILL_MEDICAL_NOVICE
	surgery = SKILL_SURGERY_AMATEUR
	powerloader = SKILL_POWERLOADER_DABBLING

/datum/skills/imperial/astartes/apothecary
	name = "Space Marine Apothecary" // a slightly less stronger space marine with medical skills
	cqc = 4 // below SKILL_CQC_MASTER, no define for it
	melee_weapons = SKILL_MELEE_TRAINED

	medical = SKILL_MEDICAL_EXPERT
	surgery = SKILL_SURGERY_EXPERT

/* Vat growns */
/datum/skills/vatgrown
	name = "Vat Grown"
	// default skills

/datum/skills/vatgrown/early
	name = "Vat Grown"
	cqc = SKILL_CQC_WEAK
	firearms = SKILL_FIREARMS_UNTRAINED
	melee_weapons = SKILL_MELEE_WEAK

/datum/skills/sectoid
	name = "Sectoid"

	cqc = SKILL_CQC_TRAINED
	engineer = SKILL_ENGINEER_ENGI
	construction = SKILL_CONSTRUCTION_PLASTEEL
	firearms = SKILL_FIREARMS_TRAINED
	medical = SKILL_MEDICAL_COMPETENT
	surgery = SKILL_SURGERY_EXPERT//how else will they probe marines?
	melee_weapons = SKILL_MELEE_TRAINED
	pistols = SKILL_PISTOLS_TRAINED
	smgs = SKILL_SMGS_TRAINED
	rifles = SKILL_RIFLES_TRAINED
	shotguns = SKILL_SHOTGUNS_TRAINED
	heavy_weapons = SKILL_HEAVY_WEAPONS_TRAINED

/datum/skills/skeleton
	name = "Skeleton"
	cqc = SKILL_CQC_TRAINED
	melee_weapons = SKILL_MELEE_TRAINED
