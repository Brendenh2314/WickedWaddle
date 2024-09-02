extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	pass

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.penguins_collected += 1
		print("Penguins collected: ", body.penguins_collected)
		animation_player.play("pickup")
