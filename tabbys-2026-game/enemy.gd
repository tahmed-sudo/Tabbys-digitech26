extends CharacterBody2D

const enemy_SPEED = 150
var damage: int = -2

@onready var player = CharacterBody2D

func _ready() -> void:
	for node in get_tree().get_nodes_in_group("Player"):
		player = node

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	
	if not player == null:
		var direction = sign(player.position.x - position.x)
		velocity.x = direction * enemy_SPEED
	
	move_and_slide()
	
func _damage_player(body: Node2D) -> void:
	if body == player:
		player.take_damage()
		
