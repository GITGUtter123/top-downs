extends Node

var current_scene = "world"
var player_current_attack = false
var transition_scene = false

var player_exit_otherarea_posx = 558
var player_exit_otherarea_posy = 157
var player_start_posx = 26
var player_start_posy = 33

var game_first_loadin = true
func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
