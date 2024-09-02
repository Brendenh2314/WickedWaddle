extends Control

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

func _on_achievement_btn_pressed():
	print("Achievement signal is being emitted")
	emit_signal("show_achievement_menu")
	
func _on_quit_btn_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/level_menu.tscn")
	
