extends AnimatedSprite2D


var rng = RandomNumberGenerator.new()
var skin_index

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	skin_index = rng.randi_range(0,3)
	play("cat%d" % [skin_index])
	stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
