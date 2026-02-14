extends Area2D

var is_down:bool = false

var player_on:bool = false

var PlayerCounter:int = 0
var temp:float
var tempIn:float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	temp = position.y
	tempIn = position.y+0.5


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	var sprite = get_child(1)
	if PlayerCounter > 0:
		is_down = true
	else:
		is_down = false
	if is_down:
		sprite.position.y = 5
	else:
		sprite.position.y = 0
		
	

func _on_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		PlayerCounter += 1


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		PlayerCounter -= 1
