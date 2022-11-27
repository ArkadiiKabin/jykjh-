extends KinematicBody2D

const MOVE_SPEED=300


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	var move_vec=Vector2()
	if Input.is_action_pressed("move_up"):
		move_vec.y-=1
	if Input.is_action_pressed("move_down"):
		move_vec.y+=1
	if Input.is_action_pressed("move_left"):
		move_vec.x-=1
	if Input.is_action_pressed("move_right"):
		move_vec.x+=1
	move_vec=move_vec.normalized()
	if(move_vec.x == 0 and move_vec.y==0):
		$AnimatedSprite.playing=false;
		$AnimatedSprite.frame = 0;
	else:
		$AnimatedSprite.playing=true;
		global_rotation=atan2(move_vec.y, move_vec.x)
	move_and_collide(move_vec*MOVE_SPEED*delta)
	
func die():
	print("i died")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
