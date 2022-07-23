extends Control

func _ready():
	MusicManager.play('dice')

func _on_Dialog_dialogic_signal(value):
	match value:
		'start_game': GameManager.load_new_game()
		'laughter': laugh()
		'gasp': gasp()
		'cheer': cheer()

func laugh():
	$CenterContainer/signs/AnimationPlayer.play("laugh")

func gasp():
	$CenterContainer/signs/AnimationPlayer.play("gasp")

func cheer():
	pass

func _on_Dialog_timeline_end(timeline_name):
	GameManager.load_new_game()
