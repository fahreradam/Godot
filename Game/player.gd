extends KinematicBody

signal change_ui_score(new_total)

# Declare member variables here. Examples:

export var speed = 10
var health = 100
var points = 0
var time = 0.52

var color_change_delay = 3.0
var time_to_color_change = color_change_delay

var bullet_scene = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

#	do_color_change(delta)
	current_health(delta)
	do_movement()
	controller_rotate(delta)
	
	
	time -= delta
	if time <= 0: 
		$gun_sound.stop()
		
		
	
		
func controller_rotate(delta):		
	if Input.is_action_pressed("turn_left"):
		rotate(Vector3.UP, delta* 2.5)
	if Input.is_action_pressed("turn_right"):
		rotate(Vector3.UP, -delta* 2.5)
	
	

func current_health(delta):
	var prev_health = $health_bar.get_percentage()
	$health_bar.set_percentage(health)
#
#	if prev_health > health:
#		$player_mesh.get_active_material(0).albedo_color = Color(1,0,0)
#	else:
#		$player_mesh.get_active_material(0).albedo_color = Color(0,0,1)

	
	

		
func my_bullet_is_dead(new_points):
	print("My bullet just hit something")
	
	points += new_points
	
	# Change the UI
	emit_signal("change_ui_score", points)
	
func do_movement():
	var velocity = Vector3.ZERO
	var direction_map = {"move_left": -transform.basis.z,
					 "move_right": transform.basis.z,
					 "move_up": transform.basis.x,
					 "move_down": -transform.basis.x}
	# Look through all the keys in our direction
	# map and see if that action is pressed atm
	for action in direction_map:
		if Input.is_action_pressed(action):
			# It is presssed -- add that value
			# to our total
			velocity += direction_map[action]
	velocity = velocity.normalized()
	
	# Move this object and correctly hit obsticles

	move_and_slide(velocity * speed, Vector3.UP)

func _input(event):
	if event is InputEventMouseMotion:
		var delta = -event.relative.x
		rotate(Vector3.UP, delta * 0.005)
		
	if Input.is_action_just_pressed("fire"):
		# Make a new (disconnected scene instance
		var new_inst = bullet_scene.instance()
		
		$gun_sound.play()
		time = 0.52

		
		var pointer = transform.origin + -transform.basis.x
		# Make the new instance a part of the main scene
		get_tree().get_root().add_child(new_inst)
	
		# rotate / translate the new instance

		new_inst.transform.origin = transform.origin
	

		new_inst.look_at(pointer, Vector3.UP)

		
		# connect the bullet's "bullet_destroyed" signal to our my_bullet_dead method
		new_inst.connect("bullet_killed", self, "my_bullet_is_dead")


