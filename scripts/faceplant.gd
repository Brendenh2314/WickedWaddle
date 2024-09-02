extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D

func play_faceplant():
	$AnimatedSprite.animation = "faceplant"
	$AnimatedSprite.play()
	$AnimatedSprite.stop()
	$AnimatedSprite.frame = 3 
