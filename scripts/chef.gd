extends CharacterBody2D


const CHEF_SPEED = 10.0
const JUMP_VELOCITY = 400.0


func _physics_process(delta: float) -> void:
	if Input.is_key_pressed(KEY_UP):
		self.position.y -= CHEF_SPEED
	if Input.is_key_pressed(KEY_LEFT):
		self.position.x -= CHEF_SPEED
	if Input.is_key_pressed(KEY_DOWN):
		self.position.y += CHEF_SPEED
	if Input.is_key_pressed(KEY_RIGHT):
		self.position.x += CHEF_SPEED
