extends ProgressBar



func change_value(amount):
	match name:
		"Guild_XP_BAR":
			var tween = get_tree().create_tween()
			if Globals.gained_rep == true:
				tween.tween_property(self, "value", value + amount, 1.75)
				$"../../../Audio".guild_xp_gain()
			else:
				tween.tween_property(self, "value", value - amount, 1.75)
				$"../../../Audio".fill_down_noise()
		"Town Reputation BAR":
			if amount != 0: #Set from the Game Scene update town reputation
				var tween = get_tree().create_tween()
				if Globals.gained_rep == true:
					tween.tween_property(self, "value", value + amount, 1.75)
					$"../../../Audio".fill_up_noise()
				else:
					tween.tween_property(self, "value", value - amount, 1.75)
					$"../../../Audio".fill_down_noise()
