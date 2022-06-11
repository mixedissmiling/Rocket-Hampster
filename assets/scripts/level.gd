extends Node2D

const planeScene = preload("res://assets/scenes/characters/plane.tscn")

var skytext = load("res://assets/art/parallax/darkSky.png")
var isAlive = true

onready var sky = $"The 'Lax/ParallaxBackground/ParallaxLayer/Sprite"

func _ready():
	#plane.lock(true)
	#Hampster.lock(true)
	pass

func _process(delta):
	if plane.planeGenerated == true and isAlive == true:
		var rand = randi() % 2
		var planeInstance = planeScene.instance()
		planeInstance.name = 'plane'
		self.add_child(planeInstance, true)
		if rand == 0:
			planeInstance.position = Vector2(PlayerInfo.posx, PlayerInfo.posit)
			print(planeInstance.position)
		elif rand == 1:
			planeInstance.position = Vector2(PlayerInfo.posx, PlayerInfo.posit)
			print(planeInstance.position)
		
		print(isAlive)
	elif isAlive == false and plane.planeGenerated == false:
		pass

	if HUD.height > 1000:
		#sky.texture = skytext
		pass


func _on_hamster_tree_exited():
	isAlive = true


func _on_hamster_tree_entered():
	isAlive = true
