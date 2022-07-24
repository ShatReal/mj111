extends TextureRect

signal done(miss)

func spin():
	$AnimationPlayer.play("spin")

func anim_done():
	emit_signal("done", self)
