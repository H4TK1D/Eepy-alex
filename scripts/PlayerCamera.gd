extends Camera2D

@export var Player : Node2D = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	set_position(Player.get_position())
