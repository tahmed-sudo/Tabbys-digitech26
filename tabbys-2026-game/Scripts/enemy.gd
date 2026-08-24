class_name Enemy
extends CharacterBody2D

const enemy_SPEED = 150
const knockback_DECELARATION = 450
var damage: int = -2
var enemy_health = 100
var is_knock_back = false


@onready var player = CharacterBody2D

func _ready() -> void:
	for node in get_tree().get_nodes_in_group("Player"):
		player = node
# creates the basic physics for enemies
func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	
	if not player == null:
		var direction = sign(player.position.x - position.x)
		velocity.x = direction * enemy_SPEED

	
	move_and_slide()
	# causes enemy to die and take damage and helps player with health siphon
func take_damage() -> bool:
	var dead: bool = false
	if enemy_health > 0:
		enemy_health -= 25
	else:
		dead = true
		queue_free()
	return dead
 

# causes player to take damaage when enemy collides with player
func _damage_player(body: Node2D) -> void:
	if body == player:
		player.take_damage()
		
