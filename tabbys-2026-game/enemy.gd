extends CharacterBody2D

const enemy_SPEED = 150

@onready var player = get_tree().get_first_node_in_group("Player")

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	move_and_slide()
	
	if player: 
		var diretion = sign(player.global_position.x - global_position.x )
		velocity.x = diretion * enemy_SPEED
		
