extends KinematicBody

var direction = Vector3(0,0,0)
export var speed = 5
#onready var player = get_tree().get_root().get_node("player")

onready var player = get_tree().get_nodes_in_group("Player")[0]


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var player_pos = player.global_transform.origin
	direction = (player_pos-self.global_transform.origin).normalized()
	#self.global_transform.origin += direction * delta
	move_and_slide(direction*speed)


