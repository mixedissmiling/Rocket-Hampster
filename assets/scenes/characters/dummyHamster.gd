extends AnimationPlayer


func _ready():
	pass

func _on_dummyHamster_animation_finished(anim_name:String):
	play()

