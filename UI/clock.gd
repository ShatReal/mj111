extends CanvasLayer

export var time = 10

signal timeout

onready var clock = $center/clock

func _ready():
	clock.max_value = time

func _on_Timer_timeout():
	clock.value += 1
	clock.get_node('time').bbcode_text = '[center]%s[/center]' % (time - clock.value)
	if clock.value == time:
		clock.get_node('Timer').stop()
		emit_signal("timeout")

