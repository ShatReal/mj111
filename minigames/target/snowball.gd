extends Node2D

func hit():
	get_parent().get_parent().hit()
	queue_free()
