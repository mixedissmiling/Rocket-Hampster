extends Control

onready var dH = $dummyHamster

func _ready():
	HUD.visiblee(false, true)
	dH.play("menuScreen")
	#Hampster.fre(false)
	#plane.fre(false)


func _on_Button_button_down():
	get_tree().change_scene("res://assets/scenes/level/level.tscn")


func _on_Button2_button_down():
	get_tree().change_scene("res://assets/scenes/level/tutorial.tscn")



func _on_Button3_button_down():
	get_tree().quit()

