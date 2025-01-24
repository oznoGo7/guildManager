extends Label

var cost: int
var town_rep: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.connect("improved_menu", update_build_menu)
	Globals.connect("improved_food", update_build_menu)
	Globals.connect("improved_service", update_build_menu)
	Globals.connect("extra_quest_board", update_build_menu)
	Globals.connect("scout_for_adventurers", update_build_menu) 

func _process(delta: float) -> void:
	update_build_menu()


func update_build_menu() -> void:
	match name:
		"Menu Description":
			town_rep = 15
			text = "Cost: " + str(Globals.improved_menu_cost) + "\n" + "Town Reputation + " + str(town_rep) + "%"
		"Food Description":
			town_rep = 10
			text = "Cost: " + str(Globals.improved_food_cost) + "\n" + "Town Reputation + " + str(town_rep) + "%"
		"Service Description":
			town_rep = 5
			text = "Cost: " + str(Globals.improved_service_cost) + "\n" + "Town Reputation + " + str(town_rep) + "%"
		"Quest Board Description":
			town_rep = 20
			text = "Cost: " + str(Globals.extra_quest_board_cost) + "\n" + "Town Reputation + " + str(town_rep) + "%"
		"Scout For Adventurers Description":
			text = "Cost: " + str(Globals.scout_for_adventurers_cost) + "\n" + "Adventurers + " + str(1)
