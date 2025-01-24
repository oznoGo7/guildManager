extends Control


func drop_menu():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(2, 0),.75)

func up_menu():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(2, -600),.75)
