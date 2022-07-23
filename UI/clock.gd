extends TextureProgress

export var time = 10

signal timeout

func _ready():
	max_value = time

func _on_Timer_timeout():
	value += 1
	$time.bbcode_text = '[center]%s[/center]' % (time - value)
	if value == time:
		$Timer.stop()
		emit_signal("timeout")

