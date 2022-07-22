extends Control


func _on_Play_button_up():
	SceneManager.change_scene("res://UI/intro.tscn")

func _ready():
	$Background/Play.grab_focus()
