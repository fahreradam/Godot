extends Spatial

var enemy_basic = preload("res://Enemy.tscn")
export var spawn_delay = 3.0
onready var spawntimer = spawn_delay
export var spawn_dist = 1
export var num_enemy = 4
var enemy_radius = (2*PI)/num_enemy


func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawntimer -= delta
	if spawntimer <= 0.0:
		while num_enemy > 0:
			var enemy = enemy_basic.instance()
			var offset = Vector3(cos(enemy_radius * num_enemy), 0, sin(enemy_radius*num_enemy))*Vector3(1,0,1)*spawn_dist
			enemy.transform.origin = offset
			var root = get_parent()
			root = add_child(enemy)
			num_enemy -= 1
