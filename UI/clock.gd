extends CanvasLayer

export var time = 10

signal timeout

func _ready():
	$clock.max_value = time

func _on_Timer_timeout():
	$clock.value += 1
	$clock/time.bbcode_text = '[center]%s[/center]' % (time - $clock.value)
	if $clock.value == time:
		$clock/Timer.stop()
		emit_signal("timeout")

