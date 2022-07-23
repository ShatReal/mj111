extends Control

func _ready():
	MusicManager.play('')

func _on_Dialog_dialogic_signal(value):
	match value:
		'cue_music': MusicManager.play('dice')
		'laugh': pass
		'gasp': pass


func _on_Dialog_timeline_end(timeline_name):
	GameManager.load_new_game()
