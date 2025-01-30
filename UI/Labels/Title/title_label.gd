extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func move_title_label(): 
	var tween = get_tree().create_tween()
	match name:
		"G":
			tween.tween_property(self, "position", Vector2(445, 137), 1)
		"U":
			tween.tween_property(self, "position", Vector2(504, 137), 1)
		"I":
			tween.tween_property(self, "position", Vector2(543, 137), 1)
		"L":
			tween.tween_property(self, "position", Vector2(589, 137), 1)
		"D":
			tween.tween_property(self, "position", Vector2(643, 137), 1)
		"Manager":
			tween.tween_property(self, "position", Vector2(380, 241), 1)
