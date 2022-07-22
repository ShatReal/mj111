extends Area2D


export var speed := 200.0
export var rot_speed := 6.0


func _physics_process(delta: float) -> void:
	position.y += speed * delta
	rotation += rot_speed * delta
