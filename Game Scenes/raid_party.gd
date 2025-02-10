extends Control

@onready var title_boss_raid_lbl: Label = $"Title Boss Raid LBL"
@onready var description_boss_raid_lbl: Label = $"Description Boss Raid LBL"
@onready var _1_adventurers_lbl: Label = $"1 Adventurers LBL"
@onready var max_adventurers_lbl: Label = $"Max Adventurers LBL"
@onready var slider_vbox: VBoxContainer = $"Slider VBOX"
@onready var adventurer_slider: HSlider = $"Slider VBOX/Adventurer Slider"
@onready var adventurers_sent_lbl: Label = $"Slider VBOX/Adventurers Sent LBL"
@onready var success_rate_lbl: Label = $"Slider VBOX/Success Rate LBL"
@onready var casualty_rate_lbl: Label = $"Slider VBOX/Casualty Rate LBL"
@onready var end_of_raid: Control = $"../End Of Raid"
@onready var end_of_raid_vbox: VBoxContainer = $"../End Of Raid/End Of Raid VBOX"
@onready var success_or_failure_lbl: Label = $"../End Of Raid/End Of Raid VBOX/Success or Failure LBL"

var raid_scenario_dict = {
	1: {
		"title" : "Dragons Lair", 
		"description": "The Red Dragon has awoken and needs to be slain before he awakens his herd", 
		"adventurers_needed": 8, 
		"casualty_rate": 0.8,  # Base casualty rate on failure
		"success_casualty_rate": 0.25,  # Small chance of deaths on success
		"reward": 5000, 
		"xp": 300
	},
	2: {
		"title": "The Cursed Tomb",
		"description": "A powerful necromancer has risen and must be put to rest before he spreads his plague.",
		"adventurers_needed": 10,
		"casualty_rate": 0.7,
		"success_casualty_rate": 0.25,
		"reward": 4000,
		"xp": 2500
	},
	3: {
		"title": "Goblin Siege",
		"description": "A goblin warlord has gathered a horde and is preparing to attack the nearby village.",
		"adventurers_needed": 12,
		"casualty_rate": 0.6,
		"success_casualty_rate": 0.25,
		"reward": 3500,
		"xp": 2000
	},
	4: {
		"title": "The Lost Expedition",
		"description": "A group of explorers vanished in the jungle—find them and bring them back alive.",
		"adventurers_needed": 7,
		"casualty_rate": 0.6,
		"success_casualty_rate": 0.25,
		"reward": 2500,
		"xp": 1800
	},
	5: {
		"title": "Demon’s Rift",
		"description": "A rift to the underworld has opened, and demons are pouring out.",
		"adventurers_needed": 15,
		"casualty_rate": 0.85,
		"success_casualty_rate": 0.25,
		"reward": 7000,
		"xp": 4000
	},
	6: {
		"title": "Bandit King’s Hideout",
		"description": "The Bandit King is terrorizing trade routes—track him down and bring him to justice.",
		"adventurers_needed": 9,
		"casualty_rate": 0.6,
		"success_casualty_rate": 0.25,
		"reward": 3200,
		"xp": 2200
	},
	7: {
		"title": "Titan’s Awakening",
		"description": "A sleeping titan stirs beneath the mountains—stop it before it fully wakes.",
		"adventurers_needed": 13,
		"casualty_rate": 0.9,
		"success_casualty_rate": 0.4,
		"reward": 10000,
		"xp": 6000
	},
	8: {
		"title": "The Silver Serpent",
		"description": "A massive sea serpent is sinking merchant ships—hunt it before it claims more lives.",
		"adventurers_needed": 10,
		"casualty_rate": 0.75,
		"success_casualty_rate": 0.2,
		"reward": 5500,
		"xp": 3500
	},
	9: {
		"title": "The Forsaken Tower",
		"description": "A wizard’s tower is leaking chaotic magic, twisting the land around it.",
		"adventurers_needed": 9,
		"casualty_rate": 0.6,
		"success_casualty_rate": 0.25,
		"reward": 3000,
		"xp": 2000
	},
	10: {
		"title": "Vampire’s Masquerade",
		"description": "A nobleman is hosting a grand feast, but the guests keep disappearing.",
		"adventurers_needed": 9,
		"casualty_rate": 0.6,
		"success_casualty_rate": 0.2,
		"reward": 4500,
		"xp": 2800
	},
	11: {
		"title": "The Phoenix Rebirth",
		"description": "A rare phoenix egg is about to hatch—protect it from those who wish to steal it.",
		"adventurers_needed": 10,
		"casualty_rate": 0.6,
		"success_casualty_rate": 0.2,
		"reward": 2800,
		"xp": 1700
	},
	12: {
		"title": "The Iron Colossus",
		"description": "A massive golem is rampaging through the countryside—disable it before it reaches the capital.",
		"adventurers_needed": 10,
		"casualty_rate": 0.8,
		"success_casualty_rate": 0.2,
		"reward": 6000,
		"xp": 4200
	},
	13: {
		"title": "Shadows in the Fog",
		"description": "People are vanishing in the mist—some say it's the work of ancient spirits.",
		"adventurers_needed": 12,
		"casualty_rate": 0.55,
		"success_casualty_rate": 0.25,
		"reward": 3300,
		"xp": 2400
	},
	14: {
		"title": "The Kraken’s Wrath",
		"description": "A monstrous kraken is pulling ships into the depths—put an end to its reign of terror.",
		"adventurers_needed": 18,
		"casualty_rate": 0.85,
		"success_casualty_rate": 0.3,
		"reward": 7500,
		"xp": 5000
	},
	15: {
		"title": "Echoes of the Ancients",
		"description": "Ruins have begun speaking in forgotten tongues, calling forth something ancient.",
		"adventurers_needed": 12,
		"casualty_rate": 0.7,
		"success_casualty_rate": 0.2,
		"reward": 5000,
		"xp": 3200
	},
	16: {
		"title": "The Ice Queen’s Curse",
		"description": "An eternal winter is spreading—defeat the Ice Queen before the land is lost in frost.",
		"adventurers_needed": 11,
		"casualty_rate": 0.75,
		"success_casualty_rate": 0.25,
		"reward": 5800,
		"xp": 3500
	}
}

var raid_rep = .25
var current_scenario
var adventurers_needed_for_success
var chance_of_success

func raid_boss_present_scenario():
	var keys = raid_scenario_dict.keys()
	var random_key = keys[randi() % keys.size()]
	current_scenario = raid_scenario_dict[random_key]

	adventurers_needed_for_success = current_scenario["adventurers_needed"]
	description_boss_raid_lbl.text = current_scenario["description"]
	set_value_of_slider()

func set_value_of_slider():
	max_adventurers_lbl.text = str(Globals.guild_members_left)
	adventurer_slider.max_value = Globals.guild_members_left

func _on_adventurer_slider_value_changed(value: float) -> void:
	adventurers_sent_lbl.text = "Send: " + str(adventurer_slider.value) + " Adventurers"
	
	if adventurer_slider.value >= adventurers_needed_for_success:
		chance_of_success = 80 + (10 * log(adventurer_slider.value - adventurers_needed_for_success + 1))
	else:
		chance_of_success = max(10, 80 * log(adventurer_slider.value + 1) / log(adventurers_needed_for_success + 1))
	
	chance_of_success = min(100, chance_of_success)  
	success_rate_lbl.text = "Success Chance of Raid: " + str(round(chance_of_success)) + "%"

func _on_onward_pressed() -> void:
	Globals.guild_members_left -= adventurer_slider.value
	visible = false
	calculate_raid_success()

func calculate_raid_success():
	var random_chance_of_success = randi() % 100
	var adventurers_sent = adventurer_slider.value
	var random_amount_died: int

	if chance_of_success >= random_chance_of_success:
		# SUCCESS
		success_or_failure_lbl.text = "Success! Your adventurers return with " + str(current_scenario["reward"]) + " gold and " + str(current_scenario["xp"]) + " xp."
		
		# Apply small success casualty rate
		random_amount_died = int(adventurers_sent * current_scenario["success_casualty_rate"])
		random_amount_died = min(adventurers_sent, random_amount_died)

		# Update resources
		Globals.guild_members_left += (adventurers_sent - random_amount_died)
		Globals.guild_gold += current_scenario["reward"]
		Globals.guild_xp += current_scenario["xp"]
		
		if random_amount_died == 0:
			success_or_failure_lbl.text += "\n No Adventurers were lost in battle"
		else:
			success_or_failure_lbl.text += "\nHowever, " + str(random_amount_died) + " adventurers were lost in battle."
		
		Globals.town_reputation += raid_rep
		Globals.gained_rep = true
		$"..".update_xp()
	else:
		# FAILURE
		success_or_failure_lbl.text = "Failure! Your adventurers return empty-handed, \nif they returned at all."
		
		if chance_of_success < 50:
			# Apply full casualty rate if success chance was below 50%
			random_amount_died = int(adventurers_sent * current_scenario["casualty_rate"])
		else:
			# Apply logarithmic scaling if above 50% success chance
			random_amount_died = int(adventurers_sent * (1 - log(chance_of_success + 1) / log(101)))
		
		random_amount_died = min(adventurers_sent, random_amount_died)
		
		Globals.guild_members_left += (adventurers_sent - random_amount_died)
		
		success_or_failure_lbl.text += "\n" + str(random_amount_died) + " adventurers perished in the raid."
		
		Globals.town_reputation -= raid_rep
		Globals.gained_rep = false
	print("Adventurers died: " + str(random_amount_died))
	$"..".amount_of_rep = raid_rep
	end_of_raid.visible = true
	await $"..".update_reputation()

func _on_eor_continue_pressed() -> void:
	visible = false
	end_of_raid.visible = false
	$"..".in_raid = false
	$".."._on_continue_btn_pressed()
	Globals.day -= 1
	#Globals.save()
