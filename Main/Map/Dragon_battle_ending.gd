extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Ending_narration.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Close_pressed():
	get_tree().quit()

func _on_Credits_pressed():
	$Credits.show()

func _on_Timer_timeout():
	$you_win.show()
	$HBoxContainer.show()
	pass # Replace with function body.
