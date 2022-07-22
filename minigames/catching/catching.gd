extends Node2D


const FO_START_Y = -32
const FO_START_X_RANGE = Vector2(32, 1280-32)

export var FallingObject: PackedScene
export var max_obj_dist := 600.0 # Increase this variable for more difficulty!
export var max_obj_dist_debuff := 1280.0

var previous_x := 1280.0/2.0
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


func _on_CatchingPlayer_caught() -> void:
	points += 1
	$CanvasLayer/Points.text = str(points)


func _on_Area2D_area_entered(area: Area2D) -> void:
	area.queue_free()
	points -= 1
	$CanvasLayer/Points.text = str(points)


func _on_Timer2_timeout() -> void:
	GameManager.finish_game(points)
