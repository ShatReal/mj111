extends Node

var game_configs = []
var used_configs = []
var current_config : MiniGame

func _ready():
	var directory = Directory.new()
	var error = directory.open("res://minigames/configs/")
	if error == OK:
		directory.list_dir_begin()
		var file_name = directory.get_next()
		while (file_name != ""):
			if !directory.current_is_dir():
				game_configs.push_front(file_name)
			file_name = directory.get_next()
	else:
		print("Error opening directory")

func load_new_game():
	if len(game_configs) == 0:
		game_configs = used_configs
		
	var selected_conf = RandUtils.from_array(game_configs)[0]
	game_configs.remove(selected_conf)
	used_configs.push_front(selected_conf)
	
	current_config = load("res://minigames/configs/%s" % selected_conf)
	SceneManager.change_scene("res://UI/Debuff.tscn")

func load_with_debuff():
	SceneManager.change_scene(current_config.scene)
	yield(SceneManager, "scene_loaded")
	get_tree().current_scene.debuff()

func load_normal():
	SceneManager.change_scene(current_config.scene)	
