extends TextureButton


signal point(angel, whacked)

var is_angel := true


func _ready() -> void:
	rect_position = Vector2(-100, -100)
	if randi() % 10 < 3:
		is_angel = false
		texture_normal = load("res://minigames/whackamole/krampuspuppet.png")


func pop() -> void:
	var speed := 0.5 if GameManager.debuff else 1.0
	$Tween.interpolate_property(self, "rect_position:y", rect_position.y, rect_position.y - 100, speed)
	$Tween.interpolate_property(self, "rect_position:y", rect_position.y - 100, rect_position.y, speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, speed)
	$Tween.start()


func _on_Tween_tween_all_completed() -> void:
	emit_signal("point", is_angel, 'complete')
	queue_free()


func _on_Mole_pressed() -> void:
	emit_signal("point", is_angel, 'whacked')
	$Tween.stop_all()
	if is_angel:
		texture_normal = load("res://minigames/whackamole/nicewhack.png")
	else:
		texture_normal = load("res://minigames/whackamole/badwhack.png")
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	$Timer.start()


func _on_Timer_timeout() -> void:
	queue_free()
