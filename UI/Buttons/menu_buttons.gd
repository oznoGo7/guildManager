extends Button

@onready var game_scene = get_tree().get_first_node_in_group("Game Scene")
@onready var main_menu = get_tree().get_first_node_in_group("Main Menu")


func _ready() -> void:
	pass


func _on_pressed() -> void:
	$"Button Press".play()
	match name:
		"Play":
			await $"../../Animation Controller".fade_out()
			if Globals.quests_left > 0:
				game_scene.get_child(1).get_child(0).start() # Present Secnario Timer
				game_scene.visible = false #Game Scene
				main_menu.visible = false #Main Menu
				game_scene.get_child(2).visible = true #Quest Details List Panel
				game_scene.get_child(2).get_child(1).visible = true # Quest Details List
				game_scene.get_child(3).visible = false # EOD
				game_scene.get_child(4).visible = false # Game Over
				game_scene.get_child(5).visible = false # Level up options
				game_scene.get_child(6).visible = false # Weekly Scenario
				game_scene.get_child(7).visible = true # Guild Stats
				game_scene.get_child(8).visible = true # Build Stats
				game_scene.get_child(9).visible = false # Settings
			else:
				game_scene.visible = true
				main_menu.visible = false
				game_scene.get_child(2).visible = true
				game_scene.get_child(2).get_child(1).visible = false
				game_scene.get_child(3).visible = true
				game_scene.get_child(4).visible = false
				game_scene.get_child(5).visible = false
				game_scene.get_child(6).visible = false
				game_scene.get_child(7).visible = true
				game_scene.get_child(8).visible = true
				game_scene.get_child(9).visible = false
			$"../../Title Labels".visible = false
		"New Game":
			Globals.reset_values()
			await $"../../Animation Controller".fade_out()
			game_scene.get_child(1).get_child(0).start() # Present Secnario Timer
			game_scene.visible = false
			main_menu.visible = false
			game_scene.get_child(2).visible = true
			game_scene.get_child(2).get_child(1).visible = true
			game_scene.get_child(3).visible = false
			game_scene.get_child(4).visible = false
			game_scene.get_child(5).visible = false
			game_scene.get_child(6).visible = false
			game_scene.get_child(7).visible = true
			game_scene.get_child(8).visible = true
			game_scene.get_child(9).visible = false
			$"../../Title Labels".visible = false
			
		"Settings":
			game_scene.visible = true
			game_scene.get_child(2).visible = false
			game_scene.get_child(2).get_child(1).visible = false
			game_scene.get_child(3).visible = false
			game_scene.get_child(4).visible = false
			game_scene.get_child(5).visible = false
			game_scene.get_child(6).visible = false
			game_scene.get_child(9).visible = true
		"Back":
			pass
		"Main Menu":
			game_scene.visible = false
			main_menu.visible = true
			game_scene.get_child(2).visible = false
			game_scene.get_child(2).get_child(1).visible = false
			game_scene.get_child(3).visible = false
			game_scene.get_child(4).visible = false
			game_scene.get_child(5).visible = false
			game_scene.get_child(6).visible = false
			game_scene.get_child(7).visible = false
			game_scene.get_child(8).visible = false
			game_scene.get_child(9).visible = false
			get_tree().get_first_node_in_group("Title Labels").visible = true
		"Quit":
			print("Quit")
			get_tree().quit()
