extends Area2D


@onready var timer = $Timer

func _on_body_entered(body):
	var jumps = body.get_jump_counter()
	var wall_hits = body.get_wall_hit_counter()
	print("Walls Hit: ", wall_hits)
	print("Jumps: " , jumps)
	print("you died")
	timer.start()

func _on_timer_timeout():
	get_tree().reload_current_scene()
