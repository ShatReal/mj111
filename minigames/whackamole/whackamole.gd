extends Node2D


func _ready():
	yield(SceneManager, "transition_finished")
	GameManager.load_new_game()

func debuff():
	print("debuffed!")
