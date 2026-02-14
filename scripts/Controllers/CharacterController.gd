extends Node2D

var clone_amount:int = 1
@export var spider:PackedScene
var one


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	one = get_child(0)
	one.focus = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#clonner condition
	if Input.is_action_just_pressed("clone") and clone_amount > (get_child_count()-1):
		characterClonner(spider,one)
	
	if Input.is_action_just_pressed("switch_fucos"):
		switchFucos()

func characterClonner(clone:PackedScene,player):
	var new_player = clone.instantiate()
	add_child(new_player)
	new_player.global_position = player.global_position + Vector2(20,0)

func switchFucos():
	var index:int
	for i in range(get_child_count()):
		if get_child(i-1).focus:
			index = i
			get_child(i-1).focus = false
	if index == get_child_count():
		get_child(0).focus = true
	else:
		get_child(index).focus = true
