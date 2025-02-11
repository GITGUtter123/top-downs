extends Node2D

func _process(delta):
	change_scenes()


func _on_otherarea_exitpoint_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene = true
		Global.current_scene = "world"


func _on_otherarea_exitpoint_body_exited(body):
	if body.has_method("player"):
		Global.transition_scene = false

func change_scenes():
	if Global.transition_scene == true:
		get_tree().change_scene_to_file("res://Scenes/world.tscn")
		Global.finish_changescenes()
