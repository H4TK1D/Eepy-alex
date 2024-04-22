extends MarginContainer

@export var Level1 : PackedScene

func _on_play_button_up():
	get_tree().change_scene_to_packed(Level1)
