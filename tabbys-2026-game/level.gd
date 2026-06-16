extends Node2D

@export var enemy_scene: PackedScene = preload ("res://Enemy.tscn")

var has_spawned: bool = false

func _on_spawn_trigger_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and not has_spawned:
		enemy_scene 
	
	
