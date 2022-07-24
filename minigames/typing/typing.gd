extends Control

var words = ["Christmas","Merry","Festive","Santa","Nicholas","Kringle","Elves","Jolly","Reindeer","Carols","Carolling","Carolers","Mistletoe","Frankincense","Myrrh","Nativity","Xmas","Yuletide","Tinsel","Stocking","Presents","Fruitcake","Chimney","Family","Candy","Pinecone","Spirit","Tidings","Tradition","Rudolph","Sleigh","Holiday","Holly","Ornaments","Scrooge","Sledge","Snowball","Nick","Snowman","Christmas","Frost","helpers","workshop","carol","card","Frosty","bells","Gingerbread","Plum","Season","Celebrate","tree","Chestnuts","Angel","Elf","Feast","Goose"]
var MAX_WORD_LENGTH = 5
var current_word = ""
var current_letter = 0
var points = 0

onready var word = $ColorRect/CenterContainer/word
onready var typed = $ColorRect/CenterContainer/typed
onready var miss_playing = $miss_playing
onready var misses = $misses

func debuff():
	MAX_WORD_LENGTH = 100

func _ready():
	for miss in misses.get_children():
		miss.connect("done", self, "move_miss")
	next_word()

func gen_word():
	return RandUtils.from_array(words)[0].to_upper()

func next_word():
	current_word = gen_word()
	while len(current_word) > MAX_WORD_LENGTH:
		current_word = gen_word()
	var styled_word = "[center]%s[/center]"% current_word;
	
	word.bbcode_text = styled_word
	typed.bbcode_text = styled_word
	current_letter = 0
	typed.visible_characters = 0

func move_miss(miss):
	miss.get_parent().remove_child(miss)
	misses.add_child(miss)

func _unhandled_key_input(event):
	if !event.pressed:
		return
	if OS.get_scancode_string(event.scancode) == current_word[current_letter]:
		current_letter += 1
		if current_letter == len(current_word):
			GameManager.earn_points(len(current_word)-2)
			next_word()
		else:
			typed.visible_characters = current_letter
	else:
		GameManager.earn_points(-1)
		if misses.get_child_count() > 0:
			var miss = misses.get_child(randi() % misses.get_child_count())
			misses.remove_child(miss)
			miss_playing.add_child(miss)
			miss.spin()
		else:
			RandUtils.from_array(miss_playing.get_children())[0].spin()
		$MissShake.play("missed")
