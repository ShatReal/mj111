extends Control

onready var debuff_button := $ColorRect/MarginContainer/VSplitContainer/HSplitContainer/MarginContainer/Debuff
onready var no_debuff_button := $ColorRect/MarginContainer/VSplitContainer/HSplitContainer/MarginContainer2/NoDebuff
onready var title : RichTextLabel = get_node("ColorRect/MarginContainer/VSplitContainer/Title")

func _ready():
	debuff_button.text = GameManager.current_config.debuff
	title.bbcode_text = "[center]%s[/center]" % GameManager.current_config.title
	$ColorRect/MarginContainer/VSplitContainer/Rules.text = GameManager.current_config.rules


func _on_Debuff_button_up():
	GameManager.load_with_debuff()


func _on_NoDebuff_button_up():
	GameManager.load_normal()
