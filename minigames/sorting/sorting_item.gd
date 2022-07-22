extends Sprite


signal point(this, add)

enum Type{RED, GREEN}

var type: int
var speed := 400.0
var dir := Vector2.DOWN


func _ready() -> void:
	type = randi() % Type.size()
	if type == Type.RED:
		modulate = Color(1.0, 0.0, 0.0, 1.0)
	else:
		modulate = Color(0.0, 1.0, 0.0, 1.0)


func _physics_process(delta: float) -> void:
	position += speed * dir * delta


func _on_VisibilityNotifier2D_screen_exited() -> void:
	if dir == Vector2.LEFT and type == Type.RED or dir == Vector2.RIGHT and type == Type.GREEN:
		emit_signal("point", self, true)
	else:
		emit_signal("point", self, false)
	queue_free()
