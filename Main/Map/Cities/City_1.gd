extends Control

var items = {}
var items_default_prices = {}
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready(): 
		#{itemName: price} MAX 8 items per city
	items_default_prices = {"cat": 70, "key": 10, "panties" : 20, "staff": 30, "armor": 100, "necklace": 60, "@_@ $_$ ^_^": 999}
	items = {"cat": 70, "key": 10, "panties" : 20, "staff": 30, "armor": 100, "necklace": 60, "@_@ $_$ ^_^": 999}
#	print(items)
	randomize_item_costs()
	
	
func _process(delta):
	$HBoxContainer/Money_left.text = str(GameGlobal.money)

func randomize_item_costs():
	for item in items:
		rng.randomize()
		var new_rng_price = floor(rng.randf_range(items[item]-10,items[item]+10))
		items[item] = new_rng_price + 2

	print(items)
	update_gui()
	
	
func update_gui():
	var item_info = preload("res://Main/item_for_sale.tscn")
	var temp = 0
	for item in items:
		var new_item_info = item_info.instance()
		$VBoxContainer/Items.add_child(new_item_info)
		new_item_info.update_info(items.keys()[temp],items[item])
		
		if(items[item] > items_default_prices[item]):
			new_item_info.is_cheaper = false
		else:
			new_item_info.is_cheaper = true
			
		temp += 1
	
	



func _on_Close_hire_mercs_pressed():
	$hire_mercs_popup.hide()


func _on_Hire_pressed():
	$hire_mercs_popup.show()


func _on_Map_pressed():
	get_tree().change_scene("res://Main/Map/Map.tscn")
