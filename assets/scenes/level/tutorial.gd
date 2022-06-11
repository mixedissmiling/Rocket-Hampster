extends Node2D

onready var aStream = $AudioStreamPlayer2D

func _ready():
	aStream.play()

func _input(event):
	if Input.is_action_pressed("ready"):
		get_tree().change_scene("res://assets/scenes/UI/Menu.tscn")
