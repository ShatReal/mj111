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


func on_point(is_angel: bool, state: String) -> void:
	if (is_angel and state == 'whacked'):
		if GameManager.debuff:
			GameManager.earn_points(2)
		else:
			GameManager.earn_points(1)
	elif (!is_angel and state == 'whacked') or (is_angel and state == 'complete'):
		if GameManager.debuff:
			GameManager.earn_points(-2)
		else:
			GameManager.earn_points(-1)
