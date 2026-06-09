extends CharacterBody2D

const SPEED = 300.0
const GRAVITY = 980.0


func _physics_process(delta: float) -> void:
	
	velocity += get_gravity() * delta
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	

	move_and_slide()
