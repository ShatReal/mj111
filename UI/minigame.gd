extends Resource
class_name MiniGame

export (String) var title = "Game Title"
export (String) var debuff = "Debuff Description"
export (String, MULTILINE) var rules := "Rules"
export (PackedScene) var scene;
export (String) var song = "song"
export (int) var timer = 0
