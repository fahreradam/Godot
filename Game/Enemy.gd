extends KinematicBody

var direction = Vector3(0,0,0)
var speed = 5
var health = 100
var time = 0
var end = Vector3(0,0,0)

var red_eye = preload("res://red_material.tres")
var blue_eye = preload("res://blue_material.tres")


#onready var player = get_tree().get_root().get_node("player")

onready var player = get_tree().get_nodes_in_group("Player")[0]


# Called when the node enters the scene tree for the first time.
func _ready():
	speed = speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	var player_pos = player.global_transform.origin


	if (Vector2(player_pos.x, player_pos.z) - Vector2(self.global_transform.origin.x, self.global_transform.origin.z)).length() <= 20:
		hunt(player_pos)
		
	else:
		wander(delta)
		
	current_health()
	damage(delta)
	
func current_health():
	$health_bar.set_percentage(health)
	if health <= 0:
		queue_free()

func hunt(pos):
	$enemy_mesh.set("material/1", red_eye)
	direction = (pos-self.global_transform.origin).normalized()
	self.look_at(pos, Vector3.UP)
	move_and_slide(direction*speed, Vector3.UP)
	

func wander(delta):
	$enemy_mesh.set("material/1", blue_eye)
	if time <= 0:
		end = Vector3(rand_range(-43, 43), rand_range(0, 1), rand_range(-43,43))
		direction = (end - global_transform.origin).normalized()
		time = 5 + time
		self.look_at(end, Vector3.UP)

	else:
		move_and_slide(direction*speed, Vector3.UP)
		time -= delta
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "obstacle":
			time=0
	
	
func damage(delta):
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "player":
			player.health -= 10*delta

