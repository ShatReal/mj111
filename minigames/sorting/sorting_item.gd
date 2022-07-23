extends Sprite


signal point(this, add)

enum Type{RED, BLUE}

var type: int
var speed := 800.0
var dir := Vector2.DOWN


func _ready() -> void:
	type = randi() % Type.size()
	if type == Type.RED:
		var num := randi() % 3  + 1
		texture = load("res://minigames/sorting/redgift%d.png" % num)
	else:
		var num := randi() % 3 + 1
		texture = load("res://minigames/sorting/bluegift%d.png" % num)

func _physics_process(delta: float) -> void:
	position += speed * dir * delta


func _on_VisibilityNotifier2D_screen_exited() -> void:
	if dir == Vector2.LEFT and type == Type.RED or dir == Vector2.RIGHT and type == Type.BLUE:
		emit_signal("point", self, true)
	else:
		emit_signal("point", self, false)
	queue_free()
