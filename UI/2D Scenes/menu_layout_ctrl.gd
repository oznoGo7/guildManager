extends Control

func _ready() -> void:
	Globals.load_data()
	get_node("Game Scene").update_reputation()
	get_node("Game Scene").update_xp()
	if Globals.quests_left > 0:
		get_node("Game Scene").present_scenario()
	else:
		print("END OF DAY")
		get_node("Game Scene").end_of_day()


func _on_title_timer_timeout() -> void:
	$"Title Labels/G".move_title_label()
	$"Title Labels/U".move_title_label()
	$"Title Labels/I".move_title_label()
	$"Title Labels/L".move_title_label()
	$"Title Labels/D".move_title_label()
	$"Title Labels/Manager".move_title_label()
