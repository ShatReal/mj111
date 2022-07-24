extends Node

var game_configs = []
var current_config : MiniGame
var current_game_index = -1

var current_points := 0
var add_points := 0
var debuff := false
var intro_done = false
enum end_types {GOOD, BAD, CHEAT}
var ending = null

var bad_scenes_in_a_row = 0

onready var point_counter_scene = load('res://UI/PointCounter.tscn')
onready var clock_scene = load('res://UI/clock.tscn')

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

func finish_game():
	if add_points <= 0:
		bad_scenes_in_a_row += 1
	else:
		bad_scenes_in_a_row = 0
	SceneManager.change_scene('res://UI/podium.tscn', {'pattern_enter': 'scribbles', 'pattern_leave': 'circle'})
	yield(SceneManager, "fade_complete")
	MusicManager.play('')

func earn_points(amount):
	add_points += amount
	get_tree().current_scene.get_node('Border/PointCounter/VSplitContainer/Points').bbcode_text = "[center]%s[/center]" % add_points

func load_new_game():
	current_game_index += 1
	if bad_scenes_in_a_row == 3:
		ending = end_types.GOOD
	if current_points >= 70:
		ending = end_types.CHEAT
	if current_game_index == 5:
		ending = end_types.BAD
		SceneManager.change_scene("res://UI/endscreen.tscn", {'pattern_enter': 'curtains'})
		return
	
	if ending != null:
		SceneManager.change_scene("res://UI/intro.tscn", {'pattern_enter': 'curtains'})
		return
	
	var selected_conf = game_configs[current_game_index % len(game_configs)]
	
	current_config = load("res://minigames/configs/%s" % selected_conf)
	SceneManager.change_scene("res://UI/Debuff.tscn", {'pattern_enter': 'curtains', 'pattern_leave': 'circle'})


func load_game(debuffed):
	debuff = debuffed
	
	SceneManager.change_scene(current_config.scene)

	yield(SceneManager, "scene_loaded")
	
	if debuffed:
		get_tree().current_scene.debuff()
	
	if current_config.timer > 0:
		var clock = clock_scene.instance()
		clock.time = current_config.timer
		get_tree().current_scene.add_child(clock)
		clock.connect("timeout", self, "finish_game")
		
	MusicManager.play(current_config.song)
	get_tree().current_scene.add_child(point_counter_scene.instance())

func restart():
	ending = null
	current_points = 0
	current_game_index = -1
	randomize()
	game_configs.shuffle()
	load_new_game()

func to_menu():
	ending = null
	intro_done = false
	current_points = 0
	current_game_index = -1
	randomize()
	game_configs.shuffle()
	SceneManager.change_scene('res://UI/Menu.tscn')
