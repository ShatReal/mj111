extends Control

enum end_types {GOOD, BAD, CHEAT}

func _ready():
	if GameManager.ending != end_types.GOOD:
		$AnimationPlayer.play("New Anim")
	if GameManager.ending == end_types.BAD:
		MusicManager.play("gameover")
		$CenterContainer/MarginContainer/Lose.show()
		$CenterContainer/MarginContainer/Win.hide()
	elif GameManager.ending == end_types.GOOD:
		MusicManager.play("victory")
		$backtomenu.start()
	elif GameManager.ending == end_types.CHEAT:
		MusicManager.play("gameover")
		$CenterContainer/MarginContainer/Cheat.show()
		$CenterContainer/MarginContainer/Win.hide()


func _on_Button_button_up():
	$buttonclick.play()
	GameManager.restart()


func _on_backtomenu_timeout():
	GameManager.to_menu()
