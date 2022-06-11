extends Area2D

var planeGenerated = true
var velocity = Vector2.DOWN

const speed = 50
var pos = position

func _ready():
	print("Plane flying")

func _process(delta):
	var rand = randi() % 900 + 1

	if rand == 50:
		print("Plane generated")
		planeGenerated = true
	else:
		planeGenerated = false

	
func _physics_process(delta):
	#print((plane.get_position().y))
	pass

func _on_Timer_timeout():
	pass


func _on_deathChecker_body_entered(body:Node):
	print("Dead plane")

#func lock(var truueee):
#	if truueee == true:
#		$AnimatedSprite.visible = true
#
#func fre(var fal):
#	if fal == false:
#		$AnimatedSprite.visible = false
