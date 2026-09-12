extends Node2D

enum target_areas {NONE, TOP, BOTTOM}
enum table_goals {NONE, MENU_AWAITING, MENU_CHECKING, MENU_FINISH, DISH_AWAITING, DISH_EATING}

var in_top_area = false
var in_bottom_area = false

@export var waiter:Waiter

var target_area = target_areas.NONE
var top_table_goal = table_goals.NONE
var bottom_table_goal = table_goals.NONE

var is_one_chaired_table = false

func set_one_chair_table() -> void:
	is_one_chaired_table = true
	$TableForOne.visible = true
	$TableForTwo.visible = false

func set_two_chair_table() -> void:
	is_one_chaired_table = false
	$TableForOne.visible = false
	$TableForTwo.visible = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	top_table_goal = table_goals.MENU_AWAITING
	bottom_table_goal = table_goals.MENU_AWAITING


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target_area != target_areas.NONE and Input.is_action_pressed("waiter_action"):
		if (target_area == target_areas.TOP):
			if(top_table_goal == table_goals.MENU_AWAITING and waiter.has_menu):
				waiter.give_menu()
				$MenuTop.visible = true
				top_table_goal = table_goals.MENU_CHECKING;
				$TopTimer.start(5.0)
			if(top_table_goal == table_goals.MENU_FINISH and not waiter.has_menu):
				$MenuTop.visible = false
				waiter.pickup_menu()
				top_table_goal = table_goals.DISH_AWAITING
				
		elif (target_area == target_areas.BOTTOM):
			if(bottom_table_goal == table_goals.MENU_AWAITING and waiter.has_menu):
				waiter.give_menu()
				$MenuBottom.visible = true
				bottom_table_goal = table_goals.MENU_CHECKING;
				$BottomTimer.start(5.0)
			if(bottom_table_goal == table_goals.MENU_FINISH and not waiter.has_menu):
				$MenuBottom.visible = false
				waiter.pickup_menu()
				bottom_table_goal = table_goals.DISH_AWAITING



func enable_top_notification() -> void:
	$TopNotification.visible = true;
	
func enable_bottom_notification() -> void:
	$BottomNotification.visible = true;
	
func disable_top_notification() -> void:
	$TopNotification.visible = false;
	
func disable_bottom_notification() -> void:
	$BottomNotification.visible = false;

func _on_top_area_body_entered(body: Node2D) -> void:
	if body.get_name() == "Waiter":
		in_top_area = true;
		target_area = target_areas.TOP
		$ActionLabel.visible = true
		$ActionLabel.position.y = -40


func _on_top_area_body_exited(body: Node2D) -> void:
	if body.get_name() == "Waiter":
		in_top_area = false
		if not in_bottom_area:
			target_area = target_areas.NONE
			$ActionLabel.visible = false


func _on_bottom_area_body_entered(body: Node2D) -> void:
	if body.get_name() == "Waiter":
		in_bottom_area = true;
		target_area = target_areas.BOTTOM
		$ActionLabel.visible = true
		$ActionLabel.position.y = 40


func _on_bottom_area_body_exited(body: Node2D) -> void:
	if body.get_name() == "Waiter":
		in_bottom_area = false;
		if not in_top_area:
			target_area = target_areas.NONE
			$ActionLabel.visible = false


func _on_top_timer_timeout() -> void:
	if top_table_goal == table_goals.MENU_CHECKING:
		top_table_goal = table_goals.MENU_FINISH
		enable_top_notification()


func _on_bottom_timer_timeout() -> void:
	if bottom_table_goal == table_goals.MENU_CHECKING:
		bottom_table_goal = table_goals.MENU_FINISH
		enable_bottom_notification()
