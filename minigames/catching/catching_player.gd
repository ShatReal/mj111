extends KinematicBody2D


signal caught

export var speed := 300.0

func _physics_process(_delta: float) -> void:
	var input := Input.get_axis("move_left", "move_right")
	move_and_slide(speed * Vector2(input, 0))


func _on_Area2D_area_entered(area: Area2D) -> void:
	area.queue_free()
	emit_signal("caught")
