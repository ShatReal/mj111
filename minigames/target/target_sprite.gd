extends TextureButton


signal point(add)

var wander_target
var speed := 200.0


func _ready() -> void:
	rect_position = Vector2(rand_range(32, 1280-32), rand_range(32, 720-32))
	wander_target = Vector2(rand_range(32, 1280-32), rand_range(32, 720-32))


func _physics_process(delta: float) -> void:
	rect_position += rect_position.direction_to(wander_target) * speed * delta
	if rect_position.distance_to(wander_target) <= 5:
		wander_target = Vector2(rand_range(32, 1280-32), rand_range(32, 720-32))


func _on_Timer_timeout() -> void:
	emit_signal("point", false)
	queue_free()


func _on_TargetSprite_pressed() -> void:
	emit_signal("point", true)
	queue_free()
