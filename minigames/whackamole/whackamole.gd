extends Node2D


export var Mole: PackedScene

var points := 0
onready var hammer = load('res://minigames/whackamole/hammer.png')
onready var bonk = load('res://minigames/whackamole/hammerbonk.png')
onready var hammer_ent = $hammer

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

func _process(delta):
	if Input.is_mouse_button_pressed(1):
		hammer_ent.texture = hammer
	else:
		hammer_ent.texture = bonk
	hammer_ent.position = get_viewport().get_mouse_position()
