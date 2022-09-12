extends Area

var time = 10

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time-=delta
	if time <0:
		spawn_portal()
	if visible == true:
		next_level()
func spawn_portal():
	if len(get_tree().get_nodes_in_group("Enemys")) <= 0:
		visible = true
	else:
		visible = false
		
func next_level():
	var player = get_tree().get_nodes_in_group("Player")[0]
	var pos = player.transform.origin
	if (Vector2(pos.x, pos.z) - Vector2(self.transform.origin.x, self.transform.origin.z)).length() <=0.5:
		get_tree().change_scene("res://level_two.tscn")
		
