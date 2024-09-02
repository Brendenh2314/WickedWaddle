class_name MainMenu
extends Control


@onready var play_button = $MarginContainer/HBoxContainer/MenuButtonVBox/Play_Button as Button
@onready var quit_button = $MarginContainer/HBoxContainer/MenuButtonVBox/Quit_Button as Button
@onready var credit_button = $MarginContainer/HBoxContainer/MenuButtonVBox/Credit_Button as Button


# Called when the node enters the scene tree for the first time.
func _ready():
	play_button.button_down.connect(on_start_pressed)
	quit_button.button_down.connect(on_quit_pressed)
	credit_button.button_down.connect(on_credit_pressed)


func on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_menu.tscn")
	
func on_quit_pressed() -> void:
	get_tree().quit()

func on_credit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
