extends ProgressBar

var gained_rep: bool = true

func change_value(amount):
	match name:
		"Guild_XP_BAR":
			var tween = get_tree().create_tween()
			if gained_rep == true:
				tween.tween_property(self, "value", value + amount, 1)
				$"../../../Audio".fill_up_noise()
			else:
				tween.tween_property(self, "value", value - amount, 1)
				$"../../../Audio".fill_down_noise()
		"Town Reputation BAR":
			var tween = get_tree().create_tween()
			if gained_rep == true:
				tween.tween_property(self, "value", value + amount, 1)
				$"../../../Audio".fill_up_noise()
			else:
				tween.tween_property(self, "value", value - amount, 1)
				$"../../../Audio".fill_down_noise()
