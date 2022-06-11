extends Area2D

var posit = get_position().y
var posx = get_position().x

func _ready():
	pass

func _process(delta):
	posit = position.y
	posx = position.x
	#print(str(posit) + "			" + str(posx))
