extends Spatial

var enemy_basic = preload("res://Enemy.tscn")
export var spawn_delay = 3.0
onready var spawntimer = spawn_delay
export var spawn_dist = 1
export var num_enemy = 4
export var max_enemy = 10
var spawn_num = 0



var enemy_radius = (2*PI)/num_enemy


func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawntimer -= delta
	var temp_enemy = num_enemy
	if spawn_num >= max_enemy:
		$Particles.one_shot = true
	if spawntimer <= 0.0:
		while num_enemy > 0 and spawn_num < max_enemy:
			var enemy = enemy_basic.instance()
			var offset = Vector3(cos(enemy_radius * num_enemy), 0, sin(enemy_radius*num_enemy))*Vector3(1,0,1)*spawn_dist
			enemy.transform.origin = offset
			var root = get_parent()
			root = add_child(enemy)
			enemy.transform.origin.y = -3
			enemy.move_lock_y = true
			num_enemy -= 1
			spawn_num += 1
		spawntimer = spawntimer + spawn_delay
		num_enemy = temp_enemy
