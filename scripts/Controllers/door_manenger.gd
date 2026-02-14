extends Node2D

@export var door:Area2D
@export var plate:Area2D

var timer: Timer
var timer_has_started:bool = false

var door_state:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = $Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if plate.is_down and not timer_has_started:
		timer.start(-1)
		timer_has_started = true
	elif not plate.is_down:
		timer.wait_time = 3
		timer.stop()
		timer_has_started = false
		door.is_open = false
		door.state = 1
	print(timer.time_left)
	if timer.time_left <=2 and timer_has_started and timer.time_left != 0:
		door.state = 2

func _on_timer_timeout() -> void:
	door.is_open = true
	door.state = 3
