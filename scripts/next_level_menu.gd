extends Control

@onready var level_complete_sound: AudioStreamPlayer2D = $LevelCompleteSound
@onready var label: Label = $GridContainer/Label
@onready var next_level_btn: Button = $GridContainer2/NextLevelBtn


var _is_level_complete:bool = false:
	set(value):
		_is_level_complete = value
		get_tree().paused = _is_level_complete
		visible = _is_level_complete

var current_scene_file : String
var next_level_number : int
var next_level_path : String
signal show_achievement_menu

func _ready() -> void:
	visible = false
	current_scene_file = get_tree().current_scene.scene_file_path
	next_level_number = current_scene_file.to_int() + 1
	next_level_path = "res://levels/level_" + str(next_level_number) + ".tscn"
	print("Current Scene:", current_scene_file)
	print("Next Level Path:", next_level_path)


func _on_next_level_level_complete():
	print("Next level menu triggered")
	level_complete_sound.play()

	# Update the label based on the current level
	if next_level_number > 10:
		label.text = "Game Complete"
		next_level_btn.visible = false  # Hide the next level button on level 10
	else:
		label.text = "Level " + str(current_scene_file.to_int()) + " Complete"
		next_level_btn.visible = true  # Show the next level button on levels 1-9

	visible = true
	get_tree().paused = true
	
func set_paused(value:bool) -> void:
	_is_level_complete = value
	get_tree().paused = _is_level_complete
	visible = _is_level_complete
	
func _on_next_level_btn_pressed():
	_is_level_complete = false
	get_tree().paused = false
	get_tree().change_scene_to_file(next_level_path)

func _on_restart_btn_pressed():
	_is_level_complete = false
	get_tree().paused = false
	get_tree().change_scene_to_file(current_scene_file)
	
func _on_quit_btn_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/level_menu.tscn")
	
