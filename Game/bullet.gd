extends Area

signal bullet_killed(points)
signal bullet_hit()


export var speed = 80.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate_object_local(Vector3(0,0,speed*delta))


func hit_something(body):
	print("I hit", body)
	emit_signal("bullet_killed", 100)
	queue_free()
