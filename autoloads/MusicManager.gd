extends Node

func play(song):
	for s in get_children():
		s.playing = false
	
	var player = get_node_or_null(song)
	if player:
		player.playing = true
