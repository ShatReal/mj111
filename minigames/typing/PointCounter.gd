extends ColorRect


var points = 0 setget add

func add(amount):
	points += amount
	$Points.bbcode_text = "[center]%s[/center]" % points
