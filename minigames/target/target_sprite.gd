extends KinematicBody2D


signal point(add)

var wander_target
var speed := 10000.0

const screen_width = 1920
const screen_height = 1080
const rect_size = Vector2(350, 550) / 2
onready var crying = load("res://images/MiniGameJam - Colors/Targetfight/hitelf.png")
var is_crying = false
var disappearing = false

func _ready() -> void:
	position = Vector2(rand_range(rect_size.x, screen_width-rect_size.x), rand_range(rect_size.y, screen_height-rect_size.y))
	wander_target = Vector2(rand_range(rect_size.x, screen_width-rect_size.x), rand_range(rect_size.y, screen_height-rect_size.y))


func _physics_process(delta: float) -> void:
	if is_crying or disappearing:
		return
	move_and_slide(position.direction_to(wander_target) * speed * delta)
	if position.distance_to(wander_target) <= 5:
		wander_target = Vector2(rand_range(rect_size.x, screen_width-rect_size.x), rand_range(rect_size.y, screen_height-rect_size.y))


func _on_Timer_timeout() -> void:
	if is_crying:
		return
	emit_signal("point", false)
	$Sprite.visible = false
	disappearing = true
	$disappear.emitting = true
	$disappeartimer.start()

func _on_fliptimer_timeout():
	if is_crying or disappearing:
		return
	scale.x *= -1

func hit():
	if is_crying or disappearing:
		return
	emit_signal("point", true)
	$Sprite.texture = crying
	is_crying = true
	$crytimer.start()


func _on_crytimer_timeout():
	queue_free()


func _on_diappeartimer_timeout():
	queue_free()
