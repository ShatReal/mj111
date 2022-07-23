extends Node2D


func _ready():
	pass # Replace with function body.

func debuff():
	$sled.gravity_scale += 1
	$sled.reward = 20
