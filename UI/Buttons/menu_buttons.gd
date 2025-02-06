extends Button

@onready var game_scene = get_tree().get_first_node_in_group("Game Scene")
@onready var main_menu = get_tree().get_first_node_in_group("Main Menu")



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		if Globals.is_paused == false:
			Globals.is_paused = true
		else:
			Globals.is_paused = false

func _on_pressed() -> void:
	$"Button Press".play()
	match name:
		"Play":
			await $"../../Animation Controller".fade_out()
			if Globals.quests_left > 0 and Globals.guild_members_left > 0:
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
				game_scene.get_child(9).visible = false # No Adventurers Left
			elif Globals.quests_left == 0 and Globals.guild_members_left > 0:
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
			else:
				game_scene.visible = true
				main_menu.visible = false
				game_scene.get_child(2).visible = true
				game_scene.get_child(2).get_child(1).visible = false
				game_scene.get_child(3).visible = false
				game_scene.get_child(4).visible = false
				game_scene.get_child(5).visible = false
				game_scene.get_child(6).visible = false
				game_scene.get_child(7).visible = true
				game_scene.get_child(8).visible = true
				game_scene.get_child(9).visible = true
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
			Globals.is_paused = true
			get_tree().get_first_node_in_group("Settings Menu").visible = true
		"Back":
			if Globals.is_paused == false:
				Globals.is_paused = true
				get_parent().get_parent().visible = true
			else:
				Globals.is_paused = false
				get_parent().get_parent().visible = false
		"Quit":
			Globals.save()
			get_tree().quit()
		"Quit":
			print("Quit")
			get_tree().quit()
