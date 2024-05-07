extends Area2D

const playerx = 241
const playery = 191
# Called when the node enters the scene tree for the first time.
func _ready():
	monitoring = true


func _on_body_entered(body):
	if body.name == "player":
		body.position  = Vector2(playerx,playery)
