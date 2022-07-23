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
		t.speed = 300.0
	t.connect("point", self, "on_point")
	
	
func on_point(add: bool) -> void:
	if add:
		if GameManager.debuff:
			GameManager.earn_points(2)
		else:
			GameManager.earn_points(1)
	else:
		if GameManager.debuff:
			GameManager.earn_points(-2)
		else:
			GameManager.earn_points(-1)
