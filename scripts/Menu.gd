extends MarginContainer

@export var Level1 : PackedScene

func _on_play_button_up():
	SceneSwitcher.switch_scene(Level1)
