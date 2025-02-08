extends Control

@onready var title_boss_raid_lbl: Label = $"Title Boss Raid LBL"
@onready var description_boss_raid_lbl: Label = $"Description Boss Raid LBL"
@onready var _1_adventurers_lbl: Label = $"1 Adventurers LBL"
@onready var max_adventurers_lbl: Label = $"Max Adventurers LBL"
@onready var slider_vbox: VBoxContainer = $"Slider VBOX"
@onready var adventurer_slider: HSlider = $"Slider VBOX/Adventurer Slider"

var raid_scenario_dict = {
	1: {"title" : "Dragons Lair", "description": "The Red Dragon has awoken and needs to be slain before he awakens his herd", "adventurers_needed": 8, "reward": 5000, "xp": 3000}
}

var current_scenario



func raid_boss_present_scenario():
	# Get a random key from scenario_dict
	var keys = raid_scenario_dict.keys()
	var random_key = keys[randi() % keys.size()]
	current_scenario = raid_scenario_dict[random_key]  # Save selected scenario for later reference

	# write in code here for the adventurer slider for required amount

	# Update the scenario label with the selected scenario's description
	description_boss_raid_lbl.text = current_scenario["description"]

	# Update option labels as an example
	option_1_lbl.text = "Choice 1: Send Adventurers (" + str(Globals.guild_members_needed) + " needed)"
	option_2_lbl.text = "Choice 2: Negotiate a higher price (50% Success Rate)"
	option_3_lbl.text = "Choice 3: Ignore the request"
	reward_lbl.text = "Reward: " + str(round(current_scenario["reward"])) + " gold and " + str(current_scenario["xp"]) + " XP."
	choice_control_box.visible = true
