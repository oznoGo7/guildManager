extends Node

# List of audio files for the playlist
var playlist: Array = []
var current_track_index: int = -1  # Initialize to -1 since the first track will be random

# Node for playing audio
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var bell_ding: AudioStreamPlayer = $"Bell Ding"
@onready var present_scenario_timer: Timer = $"Present Scenario Timer"

# Load playlist (this could be paths to .ogg, .wav, or other audio files)
func _ready():
	playlist = [
		load("res://Audio/Music/analog-dreams-lofi-vibes-216040.mp3"),
		load("res://Audio/Music/autumn-mist-vibes-lofi-beats-281198.mp3"),
		load("res://Audio/Music/cozy-lofi-beat-split-memmories-248205.mp3"),
		load("res://Audio/Music/dreaming-through-dusk-lofi-beats-281206.mp3"),
		load("res://Audio/Music/fading-neon-lights-lofi-beats-281197.mp3"),
		load("res://Audio/Music/melancholy-moon-vibes-lofi-beats-281210.mp3"),
		load("res://Audio/Music/waves-of-solitude-lofi-beats-281203.mp3"),
		load("res://Audio/Music/whispering-vinyl-loops-lofi-beats-281193.mp3"),
		load("res://Audio/Music/chill-lofi-160893.mp3"),
		load("res://Audio/Music/for-a-dream-lofi-vibes-216038.mp3"),
		load("res://Audio/Music/lofi-boy-night-waves-lofi-relax-instrumental-278248.mp3"),
		load("res://Audio/Music/lonely-skyline-reflections-lofi-beats-281207.mp3")
	]
	if playlist.size() > 0:
		play_random_track()

# Play a specific track by index
func play_track(index: int):
	if index >= 0 and index < playlist.size():
		current_track_index = index
		audio_player.stream = playlist[current_track_index]
		audio_player.play()
		print("Playing: " + str(playlist[current_track_index]))

# Play a random track
func play_random_track():
	var new_track_index = current_track_index
	while new_track_index == current_track_index and playlist.size() > 1:
		new_track_index = randi() % playlist.size()
	play_track(new_track_index)

# Pause or resume the current track
func toggle_pause():
	if audio_player.playing:
		audio_player.stop()
		print("Paused")
	else:
		audio_player.play()
		print("Resumed")

# Stop playback
func stop():
	audio_player.stop()
	print("Stopped playback")

# Called when the current track finishes playing
func _on_audio_stream_player_finished() -> void:
	play_random_track()


#Button Noise
func play_button_noise() -> void:
	get_node("Button Press").playing = true

func _on_back_pressed() -> void:
	play_button_noise()

func _on_improved_menu_pressed() -> void:
	play_button_noise()

func _on_improved_food_pressed() -> void:
	play_button_noise()

func _on_improved_service_pressed() -> void:
	play_button_noise()

func _on_extra_quest_board_pressed() -> void:
	play_button_noise()

func _on_ws_continue_btn_pressed() -> void:
	play_button_noise()

func _on_ws_quit_btn_pressed() -> void:
	play_button_noise()

func _on_adventurers_btn_pressed() -> void:
	play_button_noise()

func _on_increase_rep_btn_pressed() -> void:
	play_button_noise()

func _on_increase_quest_count_btn_pressed() -> void:
	play_button_noise()

func _on_main_menu_pressed() -> void:
	play_button_noise()

func _on_go_quit_btn_pressed() -> void:
	play_button_noise()

func _on_continue_btn_pressed() -> void:
	play_button_noise()

func _on_quit_btn_pressed() -> void:
	play_button_noise()

func _on_choice_1_btn_pressed() -> void:
	play_button_noise()

func _on_choice_2_btn_pressed() -> void:
	play_button_noise()

func _on_choice_3_btn_pressed() -> void:
	play_button_noise()

func _on_quit_pressed() -> void:
	play_button_noise()


func bell_dinging() -> void:
	bell_ding.play()



func _on_bell_ding_finished() -> void:
	get_tree().get_first_node_in_group("Game Scene").present_scenario()
	get_tree().get_first_node_in_group("Game Scene").visible = true
	get_tree().get_first_node_in_group("Quest Details List Vbox").visible = true
	get_tree().get_first_node_in_group("Quest Details List").drop_menu()
	get_tree().get_first_node_in_group("Guild Stats").drop_menu()
	get_tree().get_first_node_in_group("Build Stats").drop_menu()




func _on_present_scenario_timer_timeout() -> void:
	bell_dinging()
	present_scenario_timer.wait_time = randi() % 5 + 3

func guild_xp_gain():
	$"Guild XP Gain".pitch_scale = randf_range(.9, 1.1)
	$"Guild XP Gain".play()

func fill_up_noise():
	$"Fill Up Noise".pitch_scale = randf_range(.9, 1.1)
	$"Fill Up Noise".play()

func fill_down_noise():
	$"Fill Up Noise".pitch_scale = randf_range(.9, 1.1)
	$"Fill Down Noise".play()
