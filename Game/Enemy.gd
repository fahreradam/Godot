extends KinematicBody

var direction = Vector3(0,0,0)
#onready var player = get_tree().get_root().get_node("player")

onready var player = get_tree().get_nodes_in_group("Player")[0]


# Called when the node enters the scene tree for the first time.
func _ready():
	print("herer")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var player_pos = player.global_transform.origin
	direction = (player_pos - self.global_transform.origin).normalized()
	self.global_transform.origin += direction * delta
