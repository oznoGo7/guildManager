extends HBoxContainer



func move_main_menu():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(0, 500), 1)
