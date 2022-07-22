extends Control

func _ready():
	$AnimationPlayer.play("New Anim")
	if GameManager.current_points >= 50:
		MusicManager.play("victory")
		$CenterContainer/MarginContainer/Lose.hide()
		$CenterContainer/MarginContainer/Win.show()
	else:
		MusicManager.play("gameover")
		$CenterContainer/MarginContainer/Lose.show()
		$CenterContainer/MarginContainer/Win.hide()


func _on_Button_button_up():
	GameManager.restart()
