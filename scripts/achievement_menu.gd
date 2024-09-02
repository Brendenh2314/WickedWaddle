extends Control


func _ready():
	hide()

func _on_close_button_pressed():
	hide()
	

func show_achievement_menu():
	show()


func _on_next_level_menu_show_achievement_menu():
	print("Achievement menu signal received")
	show()


func _on_exit_button_pressed():
	print("Exit button pressed")
	hide()


func _on_levels_show_achievement_menu():
	print("Achievement menu signal received")
	show()
