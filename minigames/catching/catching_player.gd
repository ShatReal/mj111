extends KinematicBody2D


export var speed := 200.0

func _physics_process(delta: float) -> void:
	var input := Input.get_axis("move_left", "move_right")
	move_and_slide(speed * Vector2(input, 0))
