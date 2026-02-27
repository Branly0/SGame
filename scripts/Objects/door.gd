extends Area2D

var is_open:bool = false

var state_sprite:Array[Sprite2D]
var state:int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_sprite = [$Icon2, $Icon3, $Icon4]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_open:
		openColorSwap()
	else:
		closeColorSwap()
	
	if state == 1:
		state_sprite[0].modulate.a = 0.5
		state_sprite[1].modulate.a = 1
		state_sprite[2].modulate.a = 1	
	elif state == 2:
		state_sprite[0].modulate.a = 1
		state_sprite[1].modulate.a = 0.5
		state_sprite[2].modulate.a = 1
	elif state == 3:
		state_sprite[0].modulate.a = 1
		state_sprite[1].modulate.a = 1
		state_sprite[2].modulate.a = 0.5


func openColorSwap():
	var sprite:Sprite2D = get_child(1)
	sprite.modulate.a = 0.5
func closeColorSwap():
	var sprite:Sprite2D = get_child(1)
	sprite.modulate.a = 1

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and is_open:
		print("game won")
