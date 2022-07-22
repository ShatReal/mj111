extends Control

func _ready():
	$AnimationPlayer.play("New Anim")
	MusicManager.play("gameover")


func _on_Button_button_up():
	GameManager.restart()
