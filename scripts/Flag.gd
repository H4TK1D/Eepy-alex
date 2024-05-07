extends Area2D

@export var nextlevel : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("wave")
	monitoring = true

func _on_body_entered(body):
	if body.name == "player":
		get_tree().change_scene_to_packed(nextlevel)
		#LoadNextScene
