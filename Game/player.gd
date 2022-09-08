extends KinematicBody

signal change_ui_score(new_total)

# Declare member variables here. Examples:

export var speed = 11.5
var health = 100
var points = 0

var color_change_delay = 3.0
var time_to_color_change = color_change_delay

var bullet_scene = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("hello world")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	do_movement()
	
	do_color_change(delta)
	
	if Input.is_action_just_pressed("fire"):
		# Make a new (disconnected scene instance
		var new_inst = bullet_scene.instance()
	
		# Make the new instance a part of the main scene
		get_tree().get_root().add_child(new_inst)
	
		# rotate / translate the new instance
		new_inst.transform.origin = transform.origin
		new_inst.transform.origin.y = 1
		new_inst.rotation_degrees = Vector3(0,90,0)
		
		# connect the bullet's "bullet_destroyed" signal to our my_bullet_dead method
		new_inst.connect("bullet_killed", self, "my_bullet_is_dead")
		
func my_bullet_is_dead(new_points):
	print("My bullet just hit something")
	
	points += new_points
	
	# Change the UI
	emit_signal("change_ui_score", points)
	
func do_color_change(delta):
	time_to_color_change -= delta
	if time_to_color_change <= 0:
		# Reset the timer
		time_to_color_change += color_change_delay
		
		# Change the color -- the interesting part
		# here is accessing our mesh_instance node
		var mesh_node = $player_mesh
		
		# Change the color of the material
		mesh_node.get_active_material(0).albedo_color = \
			Color(randf(), randf(), randf())
	
func do_movement():
	var velocity = Vector3.ZERO
	var direction_map = {"move_left": Vector3(0,0,-1),
					 "move_right": Vector3(0,0,1),
					 "move_up": Vector3(1,0,0),
					 "move_down": Vector3(-1,0,0)}
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
