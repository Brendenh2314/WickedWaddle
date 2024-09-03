extends Control

@onready var exit_how_to_play_btn: Button = $HowToPlay/ExitHowToPlayBtn
@onready var how_to_play: Control = $HowToPlay

var _is_paused:bool = false:
	set = set_paused
	
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		_is_paused = !_is_paused

func set_paused(value:bool) -> void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused

func _on_resume_btn_pressed():
	_is_paused = false

func _on_how_to_play_btn_pressed():
	how_to_play.visible = true 

func _on_exit_how_to_play_btn_pressed() -> void:
	how_to_play.visible = false 
	
func _on_quit_btn_pressed():
	_is_paused = false
	get_tree().change_scene_to_file("res://scenes/level_menu.tscn")
