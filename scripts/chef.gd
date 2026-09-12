extends CharacterBody2D


const speed = 600

func get_input():
	var input_direction = Input.get_vector("chef_left", "chef_right", "chef_up", "chef_down")
	velocity = input_direction * speed
	if(input_direction[0] != 0 or input_direction[1] != 0):
		$ChefTextures.play("Walking")
	else:
		$ChefTextures.stop()

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
