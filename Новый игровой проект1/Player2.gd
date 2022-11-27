extends KinematicBody2D

const MOVE_SPEED=300

const bulletPath = preload("res://Bullet.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	var move_vec=Vector2()
	if Input.is_action_pressed("2p_move_up"):
		move_vec.y-=1
	if Input.is_action_pressed("2p_move_down"):
		move_vec.y+=1
	if Input.is_action_pressed("2p_move_left"):
		move_vec.x-=1
	if Input.is_action_pressed("2p_move_right"):
		move_vec.x+=1
	move_vec=move_vec.normalized()
	if(move_vec.x == 0 and move_vec.y==0):
		$AnimatedSprite.playing=false;
		$AnimatedSprite.frame = 0;
	else:
		$AnimatedSprite.playing=true;
		global_rotation=atan2(move_vec.y, move_vec.x)
	move_and_collide(move_vec*MOVE_SPEED*delta)
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
func shoot():
	var bullet = bulletPath.instance()
	get_parent().add_child(bullet)
	bullet.position=global_position
	bullet.rotation=global_rotation
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
