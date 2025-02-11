extends Node2D

func _ready():
	if Global.game_first_loadin == true:
		$Player.position.x = Global.player_start_posx
		$Player.position.y = Global.player_start_posy
	else:
		$Player.position.x = Global.player_exit_otherarea_posx
		$Player.position.y = Global.player_exit_otherarea_posy

func _process(delta):
	change_scene()

func change_scene():
	if Global.transition_scene == true:
		get_tree().change_scene_to_file("res://Scenes/otherarea.tscn")
		Global.game_first_loadin = false
		Global.finish_changescenes()


func _on_otherarea_transition_point_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.current_scene = "otherarea"
		


func _on_otherarea_transition_point_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false
