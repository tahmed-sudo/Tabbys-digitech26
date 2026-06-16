extends Node2D

const JUMP = 400
@onready var spawn_point = $Spawn_trigge/Markder2d
@export var Enemy_scene: PackedScene = preload ("res://Enemy.tscn")

var has_spawned: bool = false

func _on_spawn_trigger_body_entered(body):
	if body.is_in_group("Player") and not has_spawned:
		call_deferred("spawn_enemy")
		
	
func spawn_enemy() -> void:
	var enemy = Enemy_scene.instantiate()
	var spawn_offset = Marker2D
	enemy.global_position = global_position + spawn_offset
	get_tree().current_scene.add_child(enemy)
	
