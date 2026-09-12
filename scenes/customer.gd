extends Node2D


const speed = 600

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_direction = Input.get_vector("waiter_left", "waiter_right", "waiter_up", "waiter_down")
	velocity = input_direction * speed
	
