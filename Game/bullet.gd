extends Area

signal bullet_killed(points)



export var speed = 80.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate_object_local(Vector3(0,0,speed*delta))


func hit_something(body):
	print("I hit", body)
	for e in get_tree().get_nodes_in_group("Enemys"):
		if body == e:
			e.health -= 50
	queue_free()
	

