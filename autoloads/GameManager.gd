extends Node

var game_configs = []
var current_config : MiniGame
var current_game_index = -1

var current_points := 0
var add_points := 0

func _ready():
	randomize()
	var directory = Directory.new()
	var error = directory.open("res://minigames/configs/")
	if error == OK:
		directory.list_dir_begin()
		var file_name = directory.get_next()
		while (file_name != ""):
			if !directory.current_is_dir() and file_name.ends_with(".tres"):
				game_configs.push_front(file_name)
			file_name = directory.get_next()
	else:
		print("Error opening directory")
	randomize()
	game_configs.shuffle()

func finish_game(points):
	add_points = points
	SceneManager.change_scene('res://UI/podium.tscn', {'pattern_enter': 'scribbles', 'pattern_leave': 'circle'})
	
func load_new_game():
	current_game_index += 1
	if current_game_index == 5:
		SceneManager.change_scene("res://UI/endscreen.tscn", {'pattern_enter': 'curtains'})
		return
		
	var selected_conf = game_configs[current_game_index % len(game_configs)]
	
	current_config = load("res://minigames/configs/%s" % selected_conf)
	SceneManager.change_scene("res://UI/Debuff.tscn", {'pattern_enter': 'curtains', 'pattern_leave': 'circle'})

func load_with_debuff():
	SceneManager.change_scene(current_config.scene)
	yield(SceneManager, "scene_loaded")
	get_tree().current_scene.debuff()
	MusicManager.play(current_config.song)

func load_normal():
	SceneManager.change_scene(current_config.scene)
	MusicManager.play(current_config.song)

func restart():
	SceneManager.change_scene("res://UI/Menu.tscn")
	current_points = 0
	current_game_index = -1
	randomize()
	game_configs.shuffle()
