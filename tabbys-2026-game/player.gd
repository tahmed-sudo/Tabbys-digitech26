extends CharacterBody2D

var health = 100
const SPEED = 300.0
const JUMP_VELOCITY = -350.0

@export var health_ui: ProgressBar
@export var animation: AnimationPlayer
@export var pivot: Node2D


func _ready() -> void:
	health_ui.max_value = health
	health_ui.value = health
	
	
func take_damage() -> void:
	
	if health >= 0: 
		health -= 10
		health_ui.value = health
	else:
		get_tree().call_deferred("reload_current_scene")

func ready() -> void:
	health_ui.max_value = health
	health.ui.value = health


func _physics_process(delta: float) -> void:
	
	velocity += get_gravity() * delta
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if not direction == pivot.scale.x:
			pivot.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("attack"):
		animation.play("attack")	
	move_and_slide()
	
	


func _sword_hit(body: Node2D) -> void:
	if body is Enemy:
		if body.take_damage():
			health += 10
			health_ui.value = health
