extends KinematicBody

var direction = Vector3(0,0,0)
export var speed = 5
var health = 100



#onready var player = get_tree().get_root().get_node("player")

onready var player = get_tree().get_nodes_in_group("Player")[0]


# Called when the node enters the scene tree for the first time.

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	var player_pos = player.global_transform.origin
	direction = (player_pos-self.global_transform.origin).normalized()
	self.look_at(player_pos, Vector3.UP)
	move_and_slide(direction * speed)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "player":
			player.health -= 10*delta
	
	current_health()
	
func current_health():
	$health_bar.set_percentage(health)
	if health <= 0:
		queue_free()
	
#func _on_Timer_timeout():
#	print("changing eyeball color")
#	set("materal/0", red_material)

