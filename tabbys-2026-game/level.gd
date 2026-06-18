extends Node2D

const JUMP = 400

@export var Enemy_scene: PackedScene = preload ("res://Enemy.tscn")

var has_spawned: bool = false

func _on_spawn_trigger_body_entered(body):
	if body.is_in_group("Player") and not has_spawned:
		call_deferred("spawn_enemy")
		if body.is_in_group("Player") and !has_spawned:
			has_spawned = true
			call_deferred("spawn_enemy")
		
	
func spawn_enemy() -> void:
	var spawn_points = [ $Spawn_trigger/Marker2D, $Spawn_trigger/Marker2D2, $Spawn_trigger/Marker2D3]
	for point in spawn_points:
		var enemy = Enemy_scene.instantiate()
		enemy.global_position = point.global_position
		get_tree().current_scene.call_deferred("add_child", enemy)
