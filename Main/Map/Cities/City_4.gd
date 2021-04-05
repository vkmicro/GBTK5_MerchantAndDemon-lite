extends Control

var items = {}
var items_default_prices = {}
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready(): 
		#{itemName: price} MAX 8 items per city
	items_default_prices = {"kitty ears": 50, "ROIDS!!!": 1000, "Covid-19 Vaccine": 666666,  "car": 5000, "pants" : 100, "book": 70, "Bullets": 10, "@_@ $_$ ^_^": 100, "staff": 50, "necklace": 80, "cat": 100} 
	
	
	items = {"kitty ears": 50, "ROIDS!!!": 1000, "Covid-19 Vaccine": 666666,  "car": 5000, "pants" : 100, "book": 70, "Bullets": 10, "@_@ $_$ ^_^": 100, "staff": 50, "necklace": 80, "cat": 100}
#	print(items)
	randomize_item_costs()
	
	
func _process(delta):
	$HBoxContainer/Money_left.text = str(GameGlobal.money)

func randomize_item_costs():
	for item in items:
		rng.randomize()
		var new_rng_price = floor(rng.randf_range(items[item]-10,items[item]+10))
		items[item] = new_rng_price + 10   

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
