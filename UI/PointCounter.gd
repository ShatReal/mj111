extends ColorRect


var points = 0

func add(amount):
	points += amount
	$PointCounter/VSplitContainer/Points.bbcode_text = "[center]%s[/center]" % points
	if amount > 0:
		$AnimationPlayer.play("earn")
		$good_sound.play()
	else:
		$AnimationPlayer.play("wiggle")
		$bad_sound.play()
