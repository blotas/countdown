extends Node2D


const MAX_NUMBER_CUSTOMERS = 1
const MIN_DELAY_BETWEEN_CUSTOMERS = 5

var number_customers = 0
var in_spawn_cooldown = false
var scene
var new_customer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scene = preload("res://scenes/customer.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if number_customers < MAX_NUMBER_CUSTOMERS:
		if not in_spawn_cooldown:
			in_spawn_cooldown = true
			$CustomerSpawnTimer.start(MIN_DELAY_BETWEEN_CUSTOMERS)
			new_customer = scene.instantiate()
			add_child(new_customer)
			new_customer.position = Vector2(0,900)
			number_customers += 1


func _on_customer_spawn_timer_timeout() -> void:
	in_spawn_cooldown = false
