extends RigidBody2D

var velocity = Vector2(0, 0)
var screen_size
var isFlying = false
var posit = get_position().y
var lastPos
var posx = get_position().x

const SPEED = 15
const FLYSPEED = 7
const GRAVITYSCALE = 5

const planeScene = preload("res://assets/scenes/characters/plane.tscn")

onready var aSprite = $AnimatedSprite
onready var rayCast = $RayCast2D
onready var particles = $Particles2D
onready var area = $Area2D

func _ready():
	print("It's HAMPSTER Time Baby!")
	#aSprite.play("doingNothing")
	screen_size = get_viewport_rect().size
	HUD.visiblee(true, false)
	HUD.height = 0
	particles.emitting = false
	

func _physics_process(_delta):
	if Input.is_action_pressed("right"):
		apply_central_impulse(Vector2(SPEED, 0))
		aSprite.flip_h = false
		#aSprite.play("walking")
	elif Input.is_action_pressed("left"):
		apply_central_impulse(Vector2(-SPEED, 0))
		aSprite.flip_h = true
		#aSprite.play("walking")
	if Input.is_action_pressed("fly"):
		gravity_scale = -FLYSPEED
		aSprite.play("isFlying")
		isFlying = true
	else:
		gravity_scale = GRAVITYSCALE
		isFlying = false
		velocity.y = gravity_scale

	if abs(gravity_scale) == 7:
		aSprite.play("isFlying")
	elif abs(gravity_scale) == 5:
		aSprite.play("isFalling")

	if Input.is_action_pressed("fly") and Input.is_action_pressed("right"):
		aSprite.flip_h = false
		aSprite.play("isFlying")
		isFlying = true
	elif Input.is_action_pressed("fly") and Input.is_action_pressed("left"):
		aSprite.flip_h = true
		aSprite.play("isFlying")
		isFlying = true
	else:
		isFlying = false

func _process(delta):
	lastPos = posit
	posit = get_position().y
	area.position.y = lastPos
	area.position.x = posx
	#print(pos, "    ", lastPos)
	if posit > lastPos:
		HUD.updateHeight(false)
	elif posit < lastPos:
		HUD.updateHeight(true)
		HUD.bestScore = HUD.height
		#print(HUD.bestScore)
		#print(HUD.height)

	#if isFlying == true:
	#	particles.emitting = true
	#elif isFlying == false:
	#	particles.emitting == false
	#else:
	#	print("Non-Existent")
	
	#zone.set_po
	

func _integrate_forces(state):
	rotation_degrees = 0


func _on_DeathZone_body_entered(body:Node):
	if body.get_name() == "hamster":
		print("HAMPER")
		HUD.death()
		queue_free()

func lock(var truueee):
	if truueee == true:
		$AnimatedSprite.visible = true

func fre(var fal):
	if fal == false:
		$AnimatedSprite.visible = false

func die():
	HUD.death()
	queue_free()



func _on_deathZoneSide1_body_entered(body:Node):
	pass # Replace with function body.
	#Not using this lol, mistake
