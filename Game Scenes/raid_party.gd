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
@onready var end_of_raid_vbox: VBoxContainer = $"End Of Raid VBOX"
@onready var success_or_failure_lbl: Label = $"End Of Raid VBOX/Success or Failure LBL"


var raid_scenario_dict = {
	1: {"title" : "Dragons Lair", "description": "The Red Dragon has awoken and needs to be slain before he awakens his herd", "adventurers_needed": 4, "reward": 5000, "xp": 3000}
}

var current_scenario
var adventurers_needed_for_success
var chance_of_success

func raid_boss_present_scenario():
	# Get a random key from scenario_dict
	var keys = raid_scenario_dict.keys()
	var random_key = keys[randi() % keys.size()]
	current_scenario = raid_scenario_dict[random_key]  # Save selected scenario for later reference

	# write in code here for the adventurer slider for required amount
	adventurers_needed_for_success = current_scenario["adventurers_needed"]
	# Update the scenario label with the selected scenario's description
	description_boss_raid_lbl.text = current_scenario["description"]
	set_value_of_slider()

func set_value_of_slider():
	max_adventurers_lbl.text = str(Globals.guild_members_left)
	adventurer_slider.max_value = Globals.guild_members_left


func _on_adventurer_slider_value_changed(value: float) -> void:
	adventurers_sent_lbl.text = "Send :" + str(adventurer_slider.value) + " Adventurers"
	
	if adventurer_slider.value >= adventurers_needed_for_success:
		# Apply a logarithmic scale to success chance
		chance_of_success = 80 + (10 * log(adventurer_slider.value - adventurers_needed_for_success + 1))
	else:
		# Decrease steeply if below the needed amount
		chance_of_success = max(10, 80 * log(adventurer_slider.value + 1) / log(adventurers_needed_for_success + 1))
	
	chance_of_success = min(100, chance_of_success)  # Cap at 100%
	success_rate_lbl.text = "Success Chance of Raid: " + str(round(chance_of_success)) + "%"

func _on_onward_pressed() -> void:
	Globals.guild_members_left -= adventurer_slider.value
	calculate_raid_success()

func calculate_raid_success():
	end_of_raid_vbox.visible = true
	description_boss_raid_lbl.visible = false
	_1_adventurers_lbl.visible = false
	max_adventurers_lbl.visible = false
	slider_vbox.visible = false
	
	var random_chance_of_success = randi() % 100
	if chance_of_success >= random_chance_of_success:
		success_or_failure_lbl.text = "Success! Your adventurers return with the " + str(current_scenario["reward"]) + " and " + str(current_scenario["xp"])
		Globals.guild_members_left += adventurer_slider.value 
		Globals.guild_gold += current_scenario["reward"]
		Globals.guild_xp += current_scenario["xp"]
		Globals.gained_rep = true
		$"..".current_scenario = current_scenario
		$"..".update_xp()
	else:
		success_or_failure_lbl.text = "Failure! Your adventurers return empty-handed, if they returned at all"
		var random_amount_died = int(adventurer_slider.value * (1 - log(chance_of_success + 1) / log(101)))
		Globals.guild_members_left += (adventurer_slider.value - random_amount_died)
		success_or_failure_lbl.text += "\n" + str(random_amount_died) + " adventurers perished in the raid."


func _on_continue_pressed() -> void:
	visible = false
