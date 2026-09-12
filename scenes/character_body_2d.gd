extends CharacterBody2D

var rng = RandomNumberGenerator.new()

const speed = 200

var current_movement_duration = 0.0

var min_movement_duration = 1.0

var input_direction

var isMoving = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_direction = Vector2(1.0,0.0)


func process_movement_change() -> void:
	if current_movement_duration > min_movement_duration:
		if(rng.rand_weighted([50, 1]) == 1):
			if(isMoving):
				isMoving = false
				input_direction = Vector2(0.0,0.0)
			else:
				isMoving = true
				input_direction = Vector2(randi_range(-1,1),randi_range(-1,1))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		
	process_movement_change()
	current_movement_duration += delta
	velocity = input_direction * speed
	move_and_slide()
	
	"""
	if(input_direction[0] < 0):
		$WaiterTextures.play("left_walking")
	elif(input_direction[0] > 0):
		$WaiterTextures.play("right_walking")
	elif(input_direction[1] < 0):
		$WaiterTextures.play("up_walking")
	elif(input_direction[1] > 0):
		$WaiterTextures.play("bottom_walking")
	else:
		$WaiterTextures.stop()"""
	
