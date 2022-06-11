extends Control

var height = 0
var bestScore = 0
var config = ConfigFile.new()
var highest = 0

onready var label = $CanvasLayer/Label
onready var dLabel = $"CanvasLayer/You Died/Label2"
onready var retry = $"CanvasLayer/You Died/Button"
onready var rMM = $"CanvasLayer/You Died/Button2"
onready var quit = $"CanvasLayer/You Died/Button3"
onready var hs = $"CanvasLayer/You Died/RichTextLabel"
onready var bs = $"CanvasLayer/You Died/RichTextLabel2"
#onready var zone = $CanvasLayer/deathZoneSide
#onready var zone2 = $CanvasLayer/deathZoneSide2

func _ready():
	height = 0
	label.bbcode_text = "[center]%s[/center]" % str(height)
	dLabel.visible = false
	retry.visible = false
	rMM.visible = false
	quit.visible = false
	hs.visible = false
	bs.visible = false

func updateHeight(var up):
	if up == true:
		height += 1
		label.bbcode_text = "[center]%s[/center]" % str(height)
	elif up == false and height != 0:
		height -= 1
		label.bbcode_enabled = true
		label.bbcode_text = "[center]%s[/center]" % str(height)
	

	if height > 500:
		label.bbcode_enabled = true
		label.bbcode_text = "[center][shake rate = 1 level = 5]%s[/shake][/center]" % str(height)
	elif height > 1000:
		label.bbcode_enabled = true
		label.bbcode_text = "[center][shake rate = 2 level = 10]%s[/shake][/center]" % str(height)
	elif height > 1500:
		label.bbcode_enabled = true
		label.bbcode_text = "[center][shake rate = 3 level = 15]%s[/shake][/center]" % str(height)
	elif height > 3000:
		label.bbcode_enabled = true
		label.bbcode_text = "[center][tornado radius = 5 freq = 50]%s[/shake][/center]" % str(height)

func visiblee(var vis, var all):
	if vis == false and all == true:
		label.visible = false
		dLabel.visible = false
		retry.visible = false
		rMM.visible = false
		quit.visible = false
		hs.visible = false
		bs.visible = false
	elif all == false and vis == false:
		dLabel.visible = false
		retry.visible = false
		rMM.visible = false
		quit.visible = false
	elif vis == true and all == false:
		label.visible = true
		dLabel.visible = false
		retry.visible = false
		rMM.visible = false
		quit.visible = false
		hs.visible = false
	elif vis == true and all == true:
		label.visible = true
		dLabel.visible = true
		retry.visible = true
		rMM.visible = true
		quit.visible = true
		hs.visible = true
		bs.visible = true

func _process(delta):
	#if height > height:
	#	bestScore = height
	#	print(bestScore)
	#if bestScore < height:
	#	print("No best score")
	pass

func death():
	bs.visible = true
	label.visible = false
	dLabel.visible = true
	retry.visible = true
	rMM.visible = true
	hs.visible = true
	quit.visible = true
	print(bestScore)
	hs.bbcode_enabled = true
	hs.bbcode_text = "[center][wave = 1 level = 10]Highscore: %s[/wave][/center]" % str(bestScore)
	save()
	loade()


func _on_Button_button_down():
	get_tree().change_scene("res://assets/scenes/level/level.tscn")


func _on_Button3_button_down():
	get_tree().quit()

func _on_Button2_button_down():
	visiblee(false, false)
	get_tree().change_scene("res://assets/scenes/UI/Menu.tscn")


func save():
	config.set_value("Score", "bestScore", str(bestScore))
	config.save("user://scores.cfg")

func loade():
	var err = config.load("user://scores.cfg")
	highest = config.get_value("Score", str("bestScore"))

	bs.bbcode_enabled = true
	bs.bbcode_text = "[center][wave = 1 level = 10]Best Score: %s[/wave][/center]" % str(highest)
