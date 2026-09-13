extends CollisionShape2D

var chef_in_area;
@export var chef:Chef
@export var fish_pickup_action:Sprite2D
@export var fish_in_hand:Sprite2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	chef_in_area = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if chef_in_area and Input.is_action_just_pressed("chef_action"):
		if not chef.has_fish:
			chef.pickup_fish()
		else:
			chef.put_fish_back()
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "chef":
		chef_in_area = true
		if not chef.has_fish:
			fish_pickup_action.visible = true;


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.get_name() == "chef":
		chef_in_area = false
		fish_pickup_action.visible = false;
