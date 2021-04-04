extends HBoxContainer

export var merc_name = "hi"
export var cost = 10
export var fighting_power = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	$Fighting_power_amnt.text = str(fighting_power)
	$Merc_name.text = merc_name
	$Cost_lbl/Cost.text = str(cost)


func _on_Hire_pressed():
	if(GameGlobal.money > cost and GameGlobal.money - cost > 0) :
		GameGlobal.fighting_power += fighting_power
		GameGlobal.change_money(-cost)
	
#	print("merc hired")
#	print("Fighting power: ", GameGlobal.fighting_power)
