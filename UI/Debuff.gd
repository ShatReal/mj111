extends Control

onready var title := $ColorRect/VSplitContainer/Title
onready var debuff := $ColorRect/VSplitContainer/Debuff
onready var rules := $ColorRect/VSplitContainer/Rules;

func _ready():
	debuff.text = "Debuff: %s" % GameManager.current_config.debuff
	title.bbcode_text = "[center](%d/5)%s[/center]" % [GameManager.current_game_index+1, GameManager.current_config.title]
	rules.text = GameManager.current_config.rules
	MusicManager.play("debuff")

func _on_Debuff_button_up():
	$DebuffNoise.play()
	GameManager.load_game(true)

func _on_NoDebuff_button_up():
	$NoDebuffNoise.play()
	GameManager.load_game(false)


func _on_Debuff_mouse_entered():
	$ColorRect/HSplitContainer/Debuff/wiggle.play("wiggle")


func _on_NoDebuff_mouse_entered():
	$ColorRect/HSplitContainer/NoDebuff/wiggle.play("wiggle")
