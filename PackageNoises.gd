extends Node

func play():
	get_node("PackageNoise%d" % (randi() % 3)).play()
