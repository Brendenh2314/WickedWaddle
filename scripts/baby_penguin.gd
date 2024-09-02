extends Area2D

func _ready():
	pass

func _on_body_entered(body):
	print("+1 penguin!")
	queue_free()
