extends AnimatedSprite2D

var format_string = "res://sprites/PIPOYA FREE RPG Character Sprites NEKONIN/pipo-nekonin00%d.png"
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_frames = load(format_string % [rng.randi_range(1,4)])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
