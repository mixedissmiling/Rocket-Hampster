extends CanvasLayer

onready var player = $AnimationPlayer
onready var timer = $Timer

func _ready():
	player.play("animation")
	#Hampster.fre(false)
	#plane.fre(false)

func _on_AnimationPlayer_animation_finished(anim_name:String):
	if anim_name == "animation":
		timer.start()


func _on_Timer_timeout():
	get_tree().change_scene("res://assets/scenes/UI/Menu.tscn")
