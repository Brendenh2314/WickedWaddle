extends Control

@onready var home_button = $HomeButton as Button
signal show_achievement_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	home_button.button_down.connect(on_home_pressed)
	# Make sure to adjust the path according to your actual scene structure.
	var container = get_node("MarginContainer/MarginContainer/LevelVBox/GridContainer")  # Adjust if the name of your VBoxContainer is different.
	for level in range(1, 11):  # Adjust the range based on your number of levels
		var button_path = "Level" + str(level) + "Button"
		if container.has_node(button_path):
			var button = container.get_node(button_path)
			button.pressed.connect(_on_LevelButton_pressed.bind(level))
		else:
			print("Button not found: ", button_path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_LevelButton_pressed(level):
	print("Level " + str(level) + " was selected.")
	# Load the level using a PackedScene. Ensure the path and level numbering match your project setup
	var scene_path = "res://levels/level_" + str(level) + ".tscn"
	get_tree().change_scene_to_file(scene_path)

func on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_achievement_button_pressed():
	print("Achievement signal is being emitted")
	emit_signal("show_achievement_menu")
