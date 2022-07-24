extends Node

var playing_sound = null

func cheer():
	playing_sound = $cheer
	$cheer.play()

func boo():
	playing_sound = $boo
	$boo.play()

func gasp():
	playing_sound = $gasp
	$gasp.play()
