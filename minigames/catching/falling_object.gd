extends Area2D


export var speed := 200.0
export var rot_speed := 3.0


func _ready() -> void:
	var num := randi() % 3
	if randi() == 0:
		$Sprite.texture = load("res://minigames/catching/gift1.png")
		$CollisionShape2D.disabled = false
	elif randi() == 1:
		$Sprite.texture = load("res://minigames/catching/gift2.png")
		$CollisionShape2D2.disabled = false
	else:
		$Sprite.texture = load("res://minigames/catching/gift3.png")
		$CollisionShape2D3.disabled = false


func _physics_process(delta: float) -> void:
	position.y += speed * delta
	rotation += rot_speed * delta
