extends Sprite


signal point(this, add)

enum Type{RED, BLUE}

var type: int
var speed := 400.0
var dir := Vector2.DOWN


func _ready() -> void:
	type = randi() % Type.size()
	if type == Type.RED:
		var num := randi() % 3
		if num == 0:
			texture = load("res://minigames/sorting/redgift1.png")
		elif num == 1:
			texture = load("res://minigames/sorting/redgift2.png")
		else:
			texture = load("res://minigames/sorting/redgift3.png")
	else:
		var num := randi() % 3
		if num == 0:
			texture = load("res://minigames/sorting/bluegift1.png")
		elif num == 1:
			texture = load("res://minigames/sorting/bluegift2.png")
		else:
			texture = load("res://minigames/sorting/bluegift3.png")


func _physics_process(delta: float) -> void:
	position += speed * dir * delta


func _on_VisibilityNotifier2D_screen_exited() -> void:
	if dir == Vector2.LEFT and type == Type.RED or dir == Vector2.RIGHT and type == Type.BLUE:
		emit_signal("point", self, true)
	else:
		emit_signal("point", self, false)
	queue_free()
