extends Node2D


export var SortingItem: PackedScene

var items := []
enum Type{RED, BLUE}

func debuff() -> void:
	$Timer.wait_time = 0.3


func _on_Timer_timeout() -> void:
	var s := SortingItem.instance()
	add_child(s)
	items.append(s)
	s.position.x = 1920/2
	s.connect("point", self, "on_item_point")


func _input(event: InputEvent) -> void:
	if items.size() == 0:
		return
		
	var dir = Vector2.ZERO
	if event.is_action_pressed("move_left"):
		dir = Vector2.LEFT
	elif event.is_action_pressed("move_right"):
		dir = Vector2.RIGHT
		
	if dir == Vector2.ZERO:
		return
	
	$PackageNoises.play()
	
	var points = 0	
	if dir == Vector2.LEFT and items[0].type == Type.RED or dir == Vector2.RIGHT and items[0].type == Type.BLUE:
		if GameManager.debuff:
			points = 2
		else:
			points = 1
	else:
		if GameManager.debuff:
			points = 2
		else:
			points = 1
	
	GameManager.earn_points(points)
	items[0].dir = dir
	items.pop_front()
