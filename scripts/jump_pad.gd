extends Area2D


signal body_bounced(body)

func _on_body_entered(body):
	if body.name == "Player":  # Ensure that only player triggers the jump
		body.velocity.y = body.JUMP_VELOCITY * 2  # Directly modify the player's velocity

#func _on_jumpPad_body_entered(body):
	#emit_signal("body_bounced", body)
