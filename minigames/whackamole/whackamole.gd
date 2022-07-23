extends Node2D


export var Mole: PackedScene

var points := 0


func debuff():
	pass


func _on_MoleTimer_timeout() -> void:
	var m := Mole.instance()
	$Spots.get_child(randi() % $Spots.get_child_count()).add_child(m)
	m.connect("point", self, "on_point")
	m.pop()


func on_point(add: bool) -> void:
	if add:
		if GameManager.debuff:
			points += 2
		else:
			points += 1
	else:
		if GameManager.debuff:
			points -= 2
		else:
			points -= 1


func _on_GameTimer_timeout() -> void:
	GameManager.finish_game(points)
