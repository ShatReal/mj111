extends Node2D

func hit():
	get_parent().get_parent().hit(position)
	$HitSound.play()
	visible = false


func _on_HitSound_finished():
	queue_free()
