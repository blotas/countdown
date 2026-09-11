extends CharacterBody2D


const CHEF_SPEED = 10.0
const JUMP_VELOCITY = 400.0


func _physics_process(delta: float) -> void:
	if Input.is_key_pressed(KEY_Z):
		self.position.y -= CHEF_SPEED
	if Input.is_key_pressed(KEY_Q):
		self.position.x -= CHEF_SPEED
	if Input.is_key_pressed(KEY_S):
		self.position.y += CHEF_SPEED
	if Input.is_key_pressed(KEY_D):
		self.position.x += CHEF_SPEED
