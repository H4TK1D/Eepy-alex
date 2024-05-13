extends Node

var currentScene = null
func _ready():
	var root = get_tree().root
	currentScene = root.get_child(root.get_child_count() - 1)
	
func switch_scene(packedScene):
	call_deferred("_deferred_scene_switch",packedScene)

func _deferred_scene_switch(packedScene):
	currentScene.queue_free()
	var newScene = load(packedScene.resource_path)
	currentScene = newScene.instantiate()
	get_tree().root.add_child(currentScene)
	get_tree().current_scene = currentScene
