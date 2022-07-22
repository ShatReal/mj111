extends Control


func _on_Play_button_up():
	$ButtonClick.play()
	SceneManager.change_scene("res://UI/intro.tscn")

func _ready():
	$Background/Play.grab_focus()
	MusicManager.play("title")
