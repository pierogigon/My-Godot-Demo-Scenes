extends Node2D

const SPEED: float = 400

func move_spaceship(delta):
	var horizontal_input: float = Input.get_axis("ui_left", "ui_right")
	var vertical_input: float = Input.get_axis("ui_up", "ui_down")
	position += SPEED * delta * Vector2(horizontal_input, vertical_input)

func _process(delta):
	move_spaceship(delta)
