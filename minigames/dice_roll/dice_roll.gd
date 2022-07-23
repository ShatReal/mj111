extends Control


var points := 0

func debuff() -> void:
	pass


func _on_Timer_timeout() -> void:
	$VBoxContainer/Num.text = str(randi() % 98 + 1)


func _on_Timer2_timeout() -> void:
	$Timer.stop()
	if GameManager.debuff:
		points = randi() % 25 - 5
	else:
		points = randi() % 10 + 1
	$VBoxContainer/Num.text = str(points)
	$Timer3.start()


func _on_Timer3_timeout() -> void:
	GameManager.finish_game(points)
