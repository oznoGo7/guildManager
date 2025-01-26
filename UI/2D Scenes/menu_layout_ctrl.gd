extends Control


@onready var window_walk_1: AnimationPlayer = $"Background/Window 1/Window Walk 1"
@onready var window_walk_2: AnimationPlayer = $"Background/Window 2/Window Walk 2"
@onready var chimney: AnimationPlayer = $"Background/Chimney Smoke/Chimney"


func _ready() -> void:
	Globals.load_data()
	get_node("Game Scene").update_reputation()
	get_node("Game Scene").update_xp()
	if Globals.quests_left > 0:
		get_node("Game Scene").present_scenario()
	else:
		print("END OF DAY")
		get_node("Game Scene").end_of_day()
	chimney.play("Chimney Smoke")


func _on_title_timer_timeout() -> void:
	$"Title Labels/G".move_title_label()
	$"Title Labels/U".move_title_label()
	$"Title Labels/I".move_title_label()
	$"Title Labels/L".move_title_label()
	$"Title Labels/D".move_title_label()
	$"Title Labels/Manager".move_title_label()



func _on_window_walking_1_timeout() -> void:
	$"Background/Window 1/Window walking 1".wait_time = randi() % 10 + 5
	var random_anim = randi() % 4 + 1
	match random_anim:
		1:
			window_walk_1.play("First Window Walk 1")
		2:
			window_walk_1.play("First Window Walk 2")


func _on_window_walking_2_timeout() -> void:
	$"Background/Window 2/Window walking 2".wait_time = randi() % 10 + 5
	var random_anim = randi() % 2 + 1
	match random_anim:
		1:
			window_walk_2.play("Second Window Walk 1")
		2:
			window_walk_2.play("Second Window Walk 2")


func _on_cloud_1_timer_timeout() -> void:
	$"Background/Clouds/Cloud 1/Cloud 1 Timer".wait_time = randi_range(70, 100)
	$"Background/Clouds/Cloud 1/Cloud Anim 1".play("Cloud Scroll 1")


func _on_cloud_2_timer_timeout() -> void:
	$"Background/Clouds/Cloud 2/Cloud 2 Timer".wait_time = randi_range(70, 100)
	$"Background/Clouds/Cloud 2/Cloud Anim 2".play("Cloud 2 Scroll")


func _on_cloud_3_timer_timeout() -> void:
	$"Background/Clouds/Cloud 3/Cloud 3 Timer".wait_time = randi_range(70, 100)
	$"Background/Clouds/Cloud 3/Cloud Anim 3".play("Cloud Scroll 3")
