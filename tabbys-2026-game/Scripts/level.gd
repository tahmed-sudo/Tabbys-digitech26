extends Node2D

const JUMP = 400

@export var Enemy_scene: PackedScene = preload("res://Scenes/Enemy.tscn")
@export var Spawn: Node2D


var has_spawned: bool = false
var amount: int = 10
# help spawn enemies when player enters a area
func _on_spawn_trigger_body_entered(body):
	if body.is_in_group("Player") and not has_spawned:
		has_spawned = true
		for point in Spawn.get_children():
			call_deferred("spawn_enemy", point)
		
# Helps the player spawn in the right place
func spawn_enemy(spawn_point: Marker2D) -> void:
	var enemy = Enemy_scene.instantiate()
	enemy.global_position = spawn_point.global_position
	add_child(enemy)
