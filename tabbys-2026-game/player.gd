extends CharacterBody2D

var health = 100

const SPEED = 300.0
const JUMP_VELOCITY = -350.0

@export var health_ui: ProgressBar



func ready() -> void:
	health_ui.max_value = health
	health.ui.value = health


func _physics_process(delta: float) -> void:
	
	velocity += get_gravity() * delta
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
	

	move_and_slide()


func _on_spawn_trigger_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
