extends Control

@onready var anim: AnimationPlayer = $Anim


func fade_in():
	anim.play("Fade In")
	await anim.animation_finished
	$Control/Sprite2D.visible = true
	$Control/Label.visible = true
	$"Control/Day Counter".visible = false
	visible = false
	get_tree().get_first_node_in_group("Day Tracker").text = "Day " + str(Globals.day)

func display_day():
	$"Control/Day Counter".visible = true
	$"Control/Day Counter".text = "Day: " + str((Globals.day))
	anim.play("Day Change")
	await anim.animation_finished
	fade_in()

func fade_out():
	visible = true
	$Control/Sprite2D.visible = false
	$Control/Label.visible = false
	$"Control/Day Counter".visible = false
	anim.play("Fade Out")
	await anim.animation_finished
	if Globals.day != 1 and Globals.day % 14 != 0:
		display_day()
	elif Globals.day == 1:
		intial_day_one()
	elif Globals.day % 14 == 0:
		raid_day()
	else:
		print("PASSED")


func play_publisher():
	visible = true
	print("Play Pie Association")
	anim.play("Publisher")
	await anim.animation_finished
	visible = false

func intial_day_one():
	visible = true
	print("Initial Day 1")
	$"Control/Initial Day".visible = true
	$"Control/Day Counter".visible = true
	$"Control/Day Counter".text = "Day: " + str((Globals.day))
	anim.play("Day Change")
	await anim.animation_finished
	$"Control/Initial Day".visible = false
	$"Control/Day Counter".visible = false
	fade_in()

func raid_day():
	print("Raid Day Anim")
	visible = true
	$"Control/Initial Day".text = "Raid Day \n Use your Adventurers wisely..."
	$"Control/Day Counter".text = "Day: " + str((Globals.day))
	$"Control/Initial Day".visible = true
	$"Control/Day Counter".visible = true
	anim.play("Raid Day")
	await anim.animation_finished
	$"Control/Initial Day".visible = false
	$"Control/Day Counter".visible = false
	fade_in()

func _on_skip_pressed() -> void:
	visible = false
