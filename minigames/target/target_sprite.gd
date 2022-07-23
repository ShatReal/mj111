extends TextureButton


signal point(add)

var wander_target
var speed := 200.0

const screen_width = 1920
const screen_height = 1080

func _ready() -> void:
	rect_position = Vector2(rand_range(rect_size.x, screen_width-rect_size.x), rand_range(rect_size.y, screen_height-rect_size.y))
	wander_target = Vector2(rand_range(rect_size.x, screen_width-rect_size.x), rand_range(rect_size.y, screen_height-rect_size.y))


func _physics_process(delta: float) -> void:
	rect_position += rect_position.direction_to(wander_target) * speed * delta
	if rect_position.distance_to(wander_target) <= 5:
		wander_target = Vector2(rand_range(rect_size.x, screen_width-rect_size.x), rand_range(rect_size.y, screen_height-rect_size.y))


func _on_Timer_timeout() -> void:
	emit_signal("point", false)
	queue_free()


func _on_TargetSprite_pressed() -> void:
	emit_signal("point", true)
	queue_free()


func _on_fliptimer_timeout():
	flip_h = !flip_h
