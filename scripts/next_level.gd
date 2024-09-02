extends Area2D

signal level_complete


	
func _on_body_entered(body):
	if body.is_in_group("Player"):
		if body.penguins_collected >= body.total_penguins:
			print("Level complete")
			emit_signal("level_complete")
			print("Level complete signal emitted")
		else:
			print("Collect all penguins before completing the level!")
