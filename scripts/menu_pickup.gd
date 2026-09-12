extends CollisionShape2D

var waiter_in_area;
@export var waiter:Waiter
@export var menu_pickup_action:Sprite2D
@export var menu_in_hand:Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	waiter_in_area = false


func pickup_menu() -> void:
	waiter.has_menu = true
	menu_in_hand.visible = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if waiter_in_area and Input.is_action_pressed("waiter_action"):
		if not waiter.has_menu:
			pickup_menu()




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Waiter":
		waiter_in_area = true
		if not waiter.has_menu:
			menu_pickup_action.visible = true;


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.get_name() == "Waiter":
		waiter_in_area = false
		menu_pickup_action.visible = false;
