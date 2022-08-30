extends Spatial

var enemy_basic = preload("res://Enemy.tscn")
export var spawn_delay = 3.0
onready var spawntimer = spawn_delay
var num_enemy = 4


func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawntimer -= delta
	if spawntimer <= 0.0:
		while num_enemy > 0:
			var enemy = enemy_basic.instance()
			enemy.transform.origin = self.transform.origin
			var root = get_parent()
			root = add_child(enemy)
			num_enemy -= 1
