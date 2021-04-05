extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Glb_time_left = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Glb_time_left = $Global_timer.time_left


func _on_Global_timer_timeout():
	GameGlobal.is_time_up = true
