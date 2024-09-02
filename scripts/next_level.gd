extends Area2D

signal level_complete

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("collide")
		emit_signal("level_complete")
		print("Level complete signal emitted")
