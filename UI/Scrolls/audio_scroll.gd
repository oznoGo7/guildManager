extends HSlider

var master_save_file = "user://master_volume.save"
var music_save_file = "user://music_volume.save"
var sfx_save_file = "user://sfx_volume.save"

var master_save_value: float = 1.0
var music_save_value: float = 0.5
var sfx_save_value: float = 0.5

@export
var bus_name: String

var bus_index: int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_value_changed)
	load_data()

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	save_data()

func load_data() -> void:
	# Load individual files for each bus
	if bus_index == 0 and FileAccess.file_exists(master_save_file):
		var file = FileAccess.open(master_save_file, FileAccess.READ)
		master_save_value = file.get_float()
		file.close()
	elif bus_index == 1 and FileAccess.file_exists(music_save_file):
		var file = FileAccess.open(music_save_file, FileAccess.READ)
		music_save_value = file.get_float()
		file.close()
	elif bus_index == 2 and FileAccess.file_exists(sfx_save_file):
		var file = FileAccess.open(sfx_save_file, FileAccess.READ)
		sfx_save_value = file.get_float()
		file.close()

	# Set the slider value based on the loaded data
	match bus_index:
		0:
			value = master_save_value
			AudioServer.set_bus_volume_db(0, linear_to_db(value))
		1:
			value = music_save_value
			AudioServer.set_bus_volume_db(1, linear_to_db(value))
		2:
			value = sfx_save_value
			AudioServer.set_bus_volume_db(2, linear_to_db(value))

	print("Loaded value for bus index ", bus_index, ": ", value)

func save_data() -> void:
	# Save the slider value to the respective file
	var file_path: String
	match bus_index:
		0:
			file_path = master_save_file
		1:
			file_path = music_save_file
		2:
			file_path = sfx_save_file
	
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	file.store_float(value)
	file.close()

	print("Saved value for bus index ", bus_index, ": ", value)
