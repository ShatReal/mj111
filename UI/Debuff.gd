extends Control

onready var debuff_button : Button = get_node("ColorRect/MarginContainer/VSplitContainer/HSplitContainer/MarginContainer/Debuff")
onready var no_debuff_button : Button = get_node("ColorRect/MarginContainer/VSplitContainer/HSplitContainer/MarginContainer/NoDebuff")
onready var title : RichTextLabel = get_node("ColorRect/MarginContainer/VSplitContainer/Title")

func _ready():
	debuff_button.text = GameManager.current_config.debuff
	title.bbcode_text = "[center]%s[/center]" % GameManager.current_config.title


func _on_Debuff_button_up():
	GameManager.load_with_debuff()


func _on_NoDebuff_button_up():
	GameManager.load_normal()
