extends Node

var current_song = ''

func play(song):
	if song == current_song:
		return
		
	for s in get_children():
		s.playing = false
	
	var player = get_node_or_null(song)
	if player:
		player.playing = true
	current_song = song
