extends Control


@onready var window_walk_1: AnimationPlayer = $"Background/Window 1/Window Walk 1"
@onready var window_walk_2: AnimationPlayer = $"Background/Window 2/Window Walk 2"


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



func _on_window_walking_1_timeout() -> void:
	$"Background/Window 1/Window walking 1".wait_time = randi() % 60 + 20
	window_walk_1.play("Window Walk 1")


func _on_window_walking_2_timeout() -> void:
	$"Background/Window 2/Window walking 2".wait_time = randi() % 60 + 30
	window_walk_2.play("Window Walk 2")
