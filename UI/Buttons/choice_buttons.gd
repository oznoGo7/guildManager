extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match name:
		"Choice 1":
			print("Player Selected Choice 1")
		"Choice 2":
			print("Player Selected Choice 2")
		"Choice 3":
			print("Player Selected Choice 3")



func _on_pressed() -> void:
	pass 
