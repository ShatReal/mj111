extends Control


func _on_Play_button_up():
	$ButtonClick.play()
	#SceneManager.change_scene("res://UI/intro.tscn", {'pattern_leave': 'circle'})
	GameManager.load_new_game()

func _ready():
	$Background/Play.grab_focus()
	MusicManager.play("title")


func _on_About_pressed() -> void:
	SceneManager.change_scene("res://UI/about.tscn")
