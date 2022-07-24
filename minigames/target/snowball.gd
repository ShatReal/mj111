extends Node2D

func hit():
	get_parent().get_parent().hit(position)
	$HitSound.play()
	queue_free()
