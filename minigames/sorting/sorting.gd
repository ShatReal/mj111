extends Node2D


export var SortingItem: PackedScene

var items := []
var points := 0


func debuff() -> void:
	$Timer.wait_time = 0.5


func _on_Timer_timeout() -> void:
	var s := SortingItem.instance()
	add_child(s)
	items.append(s)
	s.position.x = 1280/2
	s.connect("point", self, "on_item_point")


func _input(event: InputEvent) -> void:
	if items.size() == 0:
		return
	if event.is_action_pressed("move_left"):
		items[0].dir = Vector2.LEFT
		items.pop_front()
	elif event.is_action_pressed("move_right"):
		items[0].dir = Vector2.RIGHT
		items.pop_front()
	

func on_item_point(item: Sprite, add: bool) -> void:
	if not items.size() == 0 and items[0] == item:
		items.pop_front()
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
	$CanvasLayer/Points.text = str(points)


func _on_Timer2_timeout() -> void:
	GameManager.finish_game(points)
