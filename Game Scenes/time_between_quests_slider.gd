extends HSlider

var file_path = "user://time_between_quests.save"

@export var time_between_quests: int

func _ready() -> void:
	load_data()


func _on_value_changed(value: float) -> void:
	$"../Time Between Quests".text = "Time Between Quests (Seconds): " + str(value)
	time_between_quests = value
	get_tree().get_first_node_in_group("Audio").get_child(0).wait_time = time_between_quests
	save_data()


func load_data():
	if FileAccess.file_exists(file_path):
		var file = FileAccess.open(file_path, FileAccess.READ)
		time_between_quests = file.get_var(time_between_quests)
		value = time_between_quests
		get_tree().get_first_node_in_group("Audio").get_child(0).wait_time = time_between_quests
		print("Quest timer Value: " + str(value))
		print("Loaded Data")
	else:
		print("No Save data detected")
		value = time_between_quests


func save_data() -> void:
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	file.store_var(time_between_quests)
	file.close()

	print("Saved value Time Between Quest: ", value)
