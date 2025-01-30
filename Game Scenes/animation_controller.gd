extends Control

@onready var anim: AnimationPlayer = $Anim


func fade_in():
	anim.play("Fade In")
	await anim.animation_finished
	visible = false


func fade_out():
	visible = true
	print("FADE Out")
	anim.play("Fade Out")
	await anim.animation_finished
	fade_in()


func play_publisher():
	visible = true
	print("Play Pie Association")
	anim.play("Publisher")
	await anim.animation_finished
	visible = false


func _on_skip_pressed() -> void:
	visible = false
