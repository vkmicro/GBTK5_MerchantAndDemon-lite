extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if(GameGlobal.has_paid_debt):
		$Panel/VBoxContainer/Paid.show()
		$Panel/VBoxContainer/Not_paid.hide()
		$Ending_paid.play()
	else:
		$Panel/VBoxContainer/Paid.hide()
		$Panel/VBoxContainer/Not_paid.show()
		$Ending_not_paid.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Credits_pressed():
	$Credits.show()


func _on_Exit_credits_pressed():
	get_tree().quit()


func _on_Exit_pressed():
	get_tree().quit()

