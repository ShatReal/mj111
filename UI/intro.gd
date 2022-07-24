extends Control

enum end_types {GOOD, BAD, CHEAT}

func _ready():
	var dialog
	
	if !GameManager.intro_done:
		dialog = Dialogic.start('intro')
		GameManager.intro_done = true
	else:
		match GameManager.ending:
			end_types.GOOD: dialog = Dialogic.start('good_ending')
			end_types.CHEAT: dialog = Dialogic.start('cheat_ending')
			
	dialog.connect("dialogic_signal", self, "_on_Dialog_dialogic_signal")
	add_child(dialog)
	
	MusicManager.play('dice')

func _on_Dialog_dialogic_signal(value):
	match value:
		'start_game': GameManager.load_new_game()
		'laughter': laugh()
		'gasp': gasp()
		'cheer': cheer()
		'boo': boo()
		'start_game': GameManager.load_new_game()
		'end_game': SceneManager.change_scene("res://UI/endscreen.tscn")

func laugh():
	$CenterContainer/signs/AnimationPlayer.play("laugh")
	$SignNoise.play()

func gasp():
	$CenterContainer/signs/AnimationPlayer.play("gasp")
	$SignNoise.play()

func boo():
	pass

func cheer():
	pass
