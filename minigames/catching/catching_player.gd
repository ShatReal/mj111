extends KinematicBody2D


signal caught

export var speed := 400.0
var current_speed = 0
var current_dir = 1

func _physics_process(_delta: float) -> void:
	var input := Input.get_axis("move_left", "move_right")
	current_speed = lerp(current_speed, input, .03)
	move_and_slide(speed * Vector2(current_speed, 0))

func _on_Area2D_area_entered(area: Area2D) -> void:
	area.queue_free()
	emit_signal("caught")
