extends CharacterBody2D

class_name Chef

const speed = 600

var has_fish = false

func give_fish() -> void:
	has_fish = false
	$FishInHand.visible = false
	
func pickup_fish() -> void:
	has_fish = true
	$FishInHand.visible = true
	
func put_fish_back() -> void:
	give_fish()
	
	

func get_input():
	var input_direction = Input.get_vector("chef_left", "chef_right", "chef_up", "chef_down")
	velocity = input_direction * speed
	print(has_fish)
	$FishInHand.visible = false
	if(input_direction[0] < 0):
		$ChefTextures.play("left_walking")
	elif(input_direction[0] > 0):
		$ChefTextures.play("right_walking")
	elif(input_direction[1] < 0):
		$ChefTextures.play("up_walking")
	elif(input_direction[1] > 0):
		$ChefTextures.play("bottom_walking")
	else:
		$ChefTextures.stop()

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
