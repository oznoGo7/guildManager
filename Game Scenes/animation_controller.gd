extends Control

@onready var anim: AnimationPlayer = $Anim


func fade_in():
	anim.play("Fade In")
	await anim.animation_finished
	$Control/Sprite2D.visible = true
	$Control/Label.visible = true
	$"Control/Day Counter".visible = false
	visible = false

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
	print("FADE Out")
	anim.play("Fade Out")
	await anim.animation_finished
	display_day()


func play_publisher():
	visible = true
	print("Play Pie Association")
	anim.play("Publisher")
	await anim.animation_finished
	visible = false


func _on_skip_pressed() -> void:
	visible = false
