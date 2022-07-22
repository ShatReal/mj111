extends TextureButton



func _on_Play_mouse_entered():
	$AnimationPlayer.play("hover")

func _on_Play_focus_entered():
	$AnimationPlayer.play("hover")	

func _on_Play_mouse_exited():
	$AnimationPlayer.play_backwards("hover")

func _on_Play_focus_exited():
	$AnimationPlayer.play_backwards("hover")
