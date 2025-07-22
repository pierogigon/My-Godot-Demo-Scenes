extends Node2D

const SPEED = -500

func _process(delta):
	position += Vector2(0, SPEED * delta)
