extends Area2D


@onready var jump_sound: AudioStreamPlayer2D = $JumpSound

signal body_bounced(body)

func _on_body_entered(body):
	if body.name == "Player":  # Ensure that only player triggers the jump
		body.velocity.y = body.JUMP_VELOCITY * 2  # Directly modify the player's velocity
		$AnimatedSprite2D.play("JumpPad")
		jump_sound.play()
