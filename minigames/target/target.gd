extends Node2D


export var TargetSprite: PackedScene

var points := 0
var debuffed := false


func debuff() -> void:
	debuffed = true


func _on_Timer_timeout() -> void:
	var t := TargetSprite.instance()
	add_child(t)
	if debuffed:
		t.speed = 400.0
	t.connect("point", self, "on_point")
	
	
func on_point(add: bool) -> void:
	if add:
		points += 1
	else:
		points -= 1
	$Points.text = str(points)


func _on_Timer2_timeout() -> void:
	GameManager.load_new_game()
