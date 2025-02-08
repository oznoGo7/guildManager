extends Button

var improved_menu: float = .15
var improved_food: float = .1
var improved_service: float = .05
var extra_quest_board: float = .4
var cost: float
var cost_times_amount = .25


func _process(delta: float) -> void:
	match name:
		"Improved Menu":
			cost = Globals.improved_menu_cost
		"Improved Food": 
			cost = Globals.improved_food_cost
		"Improved Service":
			cost = Globals.improved_service_cost
		"Extra Quest Board":
			cost = Globals.extra_quest_board_cost
		"Scout For Adventurers":
			cost = Globals.scout_for_adventurers_cost

func _on_pressed() -> void:
	if Globals.guild_gold >= cost:
		Globals.gained_rep = true
		match name:
			"Improved Menu":
				Globals.town_reputation += improved_menu
				Globals.guild_gold -= Globals.improved_menu_cost
				Globals.improved_menu_cost *= Globals.improved_menu_count + cost_times_amount
				print("NEW COST: " + str(Globals.improved_menu_cost))
				Globals.improved_menu.emit()
				Globals.improved_menu_xp.emit()
			"Improved Food": 
				Globals.town_reputation += improved_food
				Globals.guild_gold -= Globals.improved_food_cost
				Globals.improved_food_cost *= Globals.improved_food_count + cost_times_amount
				print("NEW COST: " + str(Globals.improved_food_cost))
				Globals.improved_food.emit()
				Globals.improved_food_xp.emit()
			"Improved Service":
				Globals.town_reputation += improved_service
				Globals.guild_gold -= Globals.improved_service_cost
				Globals.improved_service_cost *= Globals.improved_service_count + cost_times_amount
				print("NEW COST: " + str(Globals.improved_service_cost))
				Globals.improved_service.emit()
				Globals.improved_service_xp.emit()
			"Extra Quest Board":
				Globals.town_reputation += extra_quest_board
				Globals.guild_gold -= Globals.extra_quest_board_cost
				Globals.extra_quest_board_cost *= Globals.extra_quest_board_count + cost_times_amount
				Globals.extra_quest_board.emit()
				Globals.extra_quest_board_xp.emit()
			"Scout For Adventurers":
				Globals.guild_members_left += 1
				Globals.guild_members_total += 1
				Globals.guild_gold -= Globals.scout_for_adventurers_cost
				Globals.scout_for_adventurers_cost *= Globals.scout_for_adventurers_count + cost_times_amount
				Globals.scout_for_adventurers.emit()
			"Raid Party": 
				var raid_party_node = get_tree().get_first_node_in_group("Raid Party")
				raid_party_node.visible = true
	else:
		print("Insufficient Funds")
	Globals.save()


func _on_mouse_entered() -> void:
	get_child(0).visible = true


func _on_mouse_exited() -> void:
	get_child(0).visible = false
