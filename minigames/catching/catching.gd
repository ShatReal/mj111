extends Node2D


const FO_START_Y = -32
const screen_width = 1920
const FO_START_X_RANGE = Vector2(32, screen_width-32)

export var FallingObject: PackedScene
export var max_obj_dist := 600 # Increase this variable for more difficulty!
export var max_obj_dist_debuff := min(900, screen_width)

var previous_x := screen_width/2.0
var points := 0


func _ready() -> void:
	randomize()
	

func debuff() -> void:
	max_obj_dist = max_obj_dist_debuff


func _on_Timer_timeout() -> void:
	var f := FallingObject.instance()
	add_child(f)
	f.position.y = FO_START_Y
	f.position.x = rand_range(
		max(FO_START_X_RANGE[0], previous_x - max_obj_dist / 2),
		min(FO_START_X_RANGE[1], previous_x + max_obj_dist / 2)
	)
	$Timer.wait_time = randf() + .5


func _on_CatchingPlayer_caught() -> void:
	$PackageNoises.play()
	if GameManager.debuff:
		GameManager.earn_points(2)
	else:
		GameManager.earn_points(1)


func _on_Area2D_area_entered(area: Area2D) -> void:
	area.queue_free()
	if GameManager.debuff:
		GameManager.earn_points(-2)
	else:
		GameManager.earn_points(-1)
