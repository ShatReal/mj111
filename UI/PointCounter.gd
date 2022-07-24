extends ColorRect


var points = 0 setget add

func add(amount):
	points += amount
	$Border.bbcode_text = "[center]%s[/center]" % points
