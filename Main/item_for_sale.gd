extends Control


var item_name = "temp"
var item_price = 1
var is_buy = false
var is_sell = false
var is_cheaper = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if(GameGlobal.inventory.has(item_name)):
		$HBoxContainer/Owned.text = str(GameGlobal.inventory[item_name])
	else:
		$HBoxContainer/Owned.text = "0"
	
	if(is_cheaper):
		$HBoxContainer/Item_name.add_color_override("font_color", Color(0,1,0))
	else:
		$HBoxContainer/Item_name.add_color_override("font_color", Color(1,0,0))
		
		

func _on_Buy_pressed():
	is_buy = true
	is_sell = false
	
	if(GameGlobal.money - item_price > 0):
		GameGlobal.add_to_inv(item_name)
#		GameGlobal.money -= item_price
		GameGlobal.change_money(-item_price)


func _on_Sell_pressed():
	is_sell = true
	is_buy = false
	if(GameGlobal.inventory.has(item_name)):
		GameGlobal.remove_from_inv(item_name)
		GameGlobal.change_money(item_price)
	
func update_info(name,price):
	$HBoxContainer/Item_name.text = name
	item_name = name
	$HBoxContainer/Price.text = str(price)
	item_price = price
