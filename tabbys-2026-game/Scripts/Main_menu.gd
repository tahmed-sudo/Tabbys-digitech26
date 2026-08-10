extends Node2D

func _ready () -> void:
	pass
	
	
func _process(delta:float):
		pass

func _on_button_pressed():
	print ("pressed")
	
# causes player to be able to enter the game once button has been pressed
func _play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level.tscn")


func _on_button_2_pressed() -> void:
	pass # Replace with function body.

# causes player to quit from the main menu 
func _on_button_3_pressed() -> void:
	get_tree().quit()
