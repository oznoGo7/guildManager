extends Control


@onready var window_walk_1: AnimationPlayer = $"Background/Window 1/Window Walk 1"
@onready var window_walk_2: AnimationPlayer = $"Background/Window 2/Window Walk 2"
@onready var chimney: AnimationPlayer = $"Background/Chimney Smoke/Chimney"
@onready var settings_menu: Control = $"Settings Menu"
@onready var animation_controller: Control = $"Animation Controller"

func _ready() -> void:
	Globals.load_data()
	get_node("Game Scene").update_reputation()
	get_node("Game Scene").update_xp()
	if Globals.quests_left > 0 and Globals.guild_members_left != 0:
		get_node("Game Scene").present_scenario()
	elif Globals.quests_left == 0 and Globals.guild_members_left != 0:
		print("END OF DAY")
		get_node("Game Scene").end_of_day()
	else:
		print("No More Adventurers")
		print("No More Adventurers " + str(Globals.guild_members_left))
		get_node("Game Scene").no_more_adventurers()
	chimney.play("Chimney Smoke")
	animation_controller.play_publisher()
	await animation_controller.play_publisher()
	$"Title Labels/G".move_title_label()
	$"Title Labels/U".move_title_label()
	$"Title Labels/I".move_title_label()
	$"Title Labels/L".move_title_label()
	$"Title Labels/D".move_title_label()
	$"Title Labels/Manager".move_title_label()
	$"Main Menu".move_main_menu()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		if Globals.is_paused == false:
			Globals.is_paused = true
			settings_menu.visible = true
			print("Show Settings")
		else:
			Globals.is_paused = false
			settings_menu.visible = false
			print("Hide Settings")



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
