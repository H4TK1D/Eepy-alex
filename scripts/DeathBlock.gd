extends Area2D

@export var playerx = 0
@export var playery = 0

func _ready():
	monitoring = true


func _on_body_entered(body):
	if body.name == "player":
		body.position  = Vector2(playerx,playery)
