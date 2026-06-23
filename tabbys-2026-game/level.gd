extends Node2D

const JUMP = 400

@export var Enemy_scene: PackedScene = preload ("res://Enemy.tscn")
@export var Spawn: = Marker2D
@export var cooldown: = Timer

var has_spawned: bool = false
var amount: int = 10

func _on_spawn_trigger_body_entered(body):
	if body.is_in_group("Player") and not has_spawned:
		has_spawned = true
		call_deferred("spawn_enemy")
		
	
func spawn_enemy() -> void:
	var spawn_points = Spawn
	var enemy = Enemy_scene.instantiate()
	enemy.global_position = spawn_points.global_position
	add_child(enemy)


func _on_timer_timeout() -> void:
	print("x")
