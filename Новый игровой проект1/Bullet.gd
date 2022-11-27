extends KinematicBody2D

var MOVE_SPEED=500
var papa=null
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var move_vec=Vector2(cos(global_rotation),sin(global_rotation))
	move_and_collide(move_vec*MOVE_SPEED*delta)
	
func _on_Area2D_body_entered(body):
	if body.has_method("die"):
		body.die()
	print(body)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
