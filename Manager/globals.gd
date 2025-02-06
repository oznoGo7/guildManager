extends Node

var save_path = "user://variable.save"
var is_paused = false


#GameVars
var guild_xp = 0
var guild_level = 1
var guild_gold: int = 0
var guild_members_left = 5
var guild_members_total = 5
var guild_members_needed: int
var quests_total = 3
var quests_left = 3
var town_reputation = .80
var day = 1
var new_day_reputation_decrease = 0.0
var guild_xp_bar_max_value = 1300
var adventurer_upgrade = 1
var reputation_upgrade = 1
var quest_count_upgrade = 1
var improved_menu_cost: int = 1000
var improved_food_cost: int = 800
var improved_service_cost: int = 400
var extra_quest_board_cost: int = 1500
var scout_for_adventurers_cost: int = 2000
var improved_menu_count = 1
var improved_food_count = 1
var improved_service_count = 1
var extra_quest_board_count = 1
var scout_for_adventurers_count = 1 
var gained_rep: bool = true
var time_between_quests: int


#GameSignals
signal improved_menu
signal improved_food
signal improved_service
signal extra_quest_board
signal scout_for_adventurers
signal improved_menu_xp
signal improved_food_xp
signal improved_service_xp
signal extra_quest_board_xp



func reset_values() -> void:
	print("Values Reset")
	guild_xp = 0
	get_tree().get_first_node_in_group("Guild XP Bar").value = 0
	get_tree().get_first_node_in_group("Town Reputation Bar").value = .80
	guild_level = 1
	guild_gold = 100
	guild_members_left = 5
	guild_members_total = 5
	quests_total = 3
	quests_left = 3
	town_reputation = .80
	day = 1
	new_day_reputation_decrease = 0.0
	guild_xp_bar_max_value = 1300
	adventurer_upgrade = 1
	reputation_upgrade = 1
	quest_count_upgrade = 1
	improved_menu_cost = 1000
	improved_food_cost = 800
	improved_service_cost = 400
	extra_quest_board_cost = 2500
	scout_for_adventurers_cost = 2000
	improved_menu_count = 1
	improved_food_count = 1
	improved_service_count = 1
	extra_quest_board_count = 1
	scout_for_adventurers_count = 1 
	gained_rep = true

func save() -> void:
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(guild_xp)
	file.store_var(guild_level)
	file.store_var(guild_gold)
	file.store_var(guild_members_left)
	file.store_var(guild_members_total)
	file.store_var(quests_total)
	file.store_var(quests_left)
	file.store_var(town_reputation)
	file.store_var(day)
	file.store_var(new_day_reputation_decrease)
	file.store_var(guild_xp_bar_max_value)
	file.store_var(adventurer_upgrade)
	file.store_var(reputation_upgrade)
	file.store_var(quest_count_upgrade)
	file.store_var(improved_menu_cost)
	file.store_var(improved_food_cost)
	file.store_var(improved_service_cost)
	file.store_var(extra_quest_board_cost)
	file.store_var(scout_for_adventurers_cost)
	file.store_var(improved_menu_count)
	file.store_var(improved_food_count)
	file.store_var(improved_service_count)
	file.store_var(extra_quest_board_count)
	file.store_var(scout_for_adventurers_count)
	file.store_var(gained_rep)

func load_data():
	if FileAccess.file_exists(save_path):
		get_tree().get_first_node_in_group("Play Button").text = "Continue?"
		get_tree().get_first_node_in_group("Main Menu").get_child(1).visible = true
		var file = FileAccess.open(save_path, FileAccess.READ)
		guild_xp = file.get_var(guild_xp)
		guild_level = file.get_var(guild_level)
		guild_gold = file.get_var(guild_gold)
		guild_members_left = file.get_var(guild_members_left)
		guild_members_total = file.get_var(guild_members_total)
		quests_total = file.get_var(quests_total)
		quests_left = file.get_var(quests_left)
		town_reputation = file.get_var(town_reputation)
		day = file.get_var(day)
		new_day_reputation_decrease = file.get_var(new_day_reputation_decrease)
		guild_xp_bar_max_value = file.get_var(guild_xp_bar_max_value)
		adventurer_upgrade = file.get_var(adventurer_upgrade)
		reputation_upgrade = file.get_var(reputation_upgrade)
		quest_count_upgrade = file.get_var(quest_count_upgrade)
		improved_menu_cost = file.get_var(improved_menu_cost)
		improved_food_cost = file.get_var(improved_food_cost)
		improved_service_cost = file.get_var(improved_service_cost)
		extra_quest_board_cost = file.get_var(extra_quest_board_cost)
		scout_for_adventurers_cost = file.get_var(scout_for_adventurers_cost)
		improved_menu_count = file.get_var(improved_menu_count)
		improved_food_count = file.get_var(improved_food_count)
		improved_service_count = file.get_var(improved_service_count)
		extra_quest_board_count = file.get_var(extra_quest_board_count)
		scout_for_adventurers_count = file.get_var(scout_for_adventurers_count)
		gained_rep = file.get_var(gained_rep)
	else:
		print("No Data Saved")
		guild_xp = 0
		get_tree().get_first_node_in_group("Guild XP Bar").value = 0
		get_tree().get_first_node_in_group("Town Reputation Bar").value = .75
		guild_level = 1
		guild_gold = 100
		guild_members_left = 5
		guild_members_total = 5
		quests_total = 3
		quests_left = 3
		town_reputation = .75
		day = 1
		new_day_reputation_decrease = .08
		guild_xp_bar_max_value = 1300
		adventurer_upgrade = 1
		reputation_upgrade = 1
		quest_count_upgrade = 1
		improved_menu_cost = 1000
		improved_food_cost = 800
		improved_service_cost = 400
		extra_quest_board_cost = 1500
		scout_for_adventurers_cost = 2000
		improved_menu_count = 1
		improved_food_count = 1
		improved_service_count = 1
		extra_quest_board_count = 1
		scout_for_adventurers_count = 1
		gained_rep = true
