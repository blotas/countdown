extends CharacterBody2D

class_name Waiter

const speed = 600

var has_menu = false


func get_input():
	var input_direction = Input.get_vector("waiter_left", "waiter_right", "waiter_up", "waiter_down")
	velocity = input_direction * speed
	if(input_direction[0] < 0):
		$WaiterTextures.play("left_walking")
	elif(input_direction[0] > 0):
		$WaiterTextures.play("right_walking")
	elif(input_direction[1] < 0):
		$WaiterTextures.play("up_walking")
	elif(input_direction[1] > 0):
		$WaiterTextures.play("bottom_walking")
	else:
		$WaiterTextures.stop()

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
