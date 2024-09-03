class_name MainMenu
extends Control

@onready var play_button = $MarginContainer/HBoxContainer/MenuButtonVBox/Play_Button as Button
@onready var quit_button = $MarginContainer/HBoxContainer/MenuButtonVBox/Quit_Button as Button
@onready var credit_button = $MarginContainer/HBoxContainer/MenuButtonVBox/Credit_Button as Button
@onready var mute_button: Button = $MuteButton
@onready var unmute_button: Button = $UnmuteButton

# Called when the node enters the scene tree for the first time.
func _ready():
	play_button.button_down.connect(on_start_pressed)
	quit_button.button_down.connect(on_quit_pressed)
	credit_button.button_down.connect(on_credit_pressed)
	update_buttons()

func on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_menu.tscn")
	
func on_quit_pressed() -> void:
	get_tree().quit()

func on_credit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")

func _on_mute_button_pressed() -> void:
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	toggle_buttons()

func _on_unmute_button_pressed() -> void:
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
	toggle_buttons()

func toggle_buttons() -> void:
	mute_button.visible = !mute_button.visible
	unmute_button.visible = !unmute_button.visible

func update_buttons() -> void:
	var is_muted = AudioServer.is_bus_mute(AudioServer.get_bus_index("Master"))
	mute_button.visible = !is_muted
	unmute_button.visible = is_muted
