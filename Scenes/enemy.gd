extends CharacterBody2D

var speed = 60
var player_chase = false
var player = null
var health = 100
var player_inattack_zone = false
var can_take_damage = true

func _physics_process(delta):
	deal_with_damage()
	update_health()
	
	if player_chase:
		position += (player.position - position)/speed
		
		$AnimatedSprite2D.play("walk")
		
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("idle")

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func enemy():
	pass


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false

func deal_with_damage():
	if player_inattack_zone and Global.player_current_attack:
		if can_take_damage == true:
			health -= 30
			$take_damage_cooldown.start()
			can_take_damage = false
			print("Slime health = ", health)
			
			if health <= 0:
				$death.start()
				$AnimatedSprite2D.play("death")


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		print("Player entered attack zone!")
		player = body
		player_inattack_zone = false


func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player = body
		player_inattack_zone = true


func _on_take_damage_cooldown_timeout():
	can_take_damage = true

func update_health():
	var healthbar = $healthbar
	
	healthbar.value = health
	
	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true


func _on_death_timeout():
	queue_free()
