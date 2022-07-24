extends Node2D


export var TargetSprite: PackedScene
onready var snowball_scene = load("res://minigames/target/snowball.tscn")

var points := 0
var debuffed := false


func debuff() -> void:
	debuffed = true


func _on_Timer_timeout() -> void:
	var t := TargetSprite.instance()
	if debuffed:
		t.speed = 15000.0
	t.connect("point", self, "on_point")
	$targets.add_child(t)

func hit(pos):
	for target in $targets.get_children():
		if target.position.distance_to(pos) < 100:
			target.hit()

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

func _unhandled_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		var snowball = snowball_scene.instance()
		snowball.position = event.position
		snowball.get_node("Sprite/AnimationPlayer").play("throw")
		$snowballs.add_child(snowball)
