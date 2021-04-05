extends Node

var money = 300
var has_paid_debt = true
var time_left
var has_escaped = false
var inventory = {}
var fighting_power = 0
var is_over_9000 = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#
func _process(delta):
	if(fighting_power >= 9000):
		if(!is_over_9000):
			print("IT'S OVER 9000!!!!!")
			get_tree().change_scene("res://Main/Map/Dragon_battle_ending.tscn")
			is_over_9000 = true
	if(has_escaped):
		get_tree().change_scene("res://Main/Map/Escaped_ending.tscn")
		has_escaped = false
		

func change_money(amount):
#	if(len(inventory.keys()) > 0):
	if(amount < 0 and money - amount > 0):
#		print("buying")
		money += amount
	else:
#		print("selling")
		money += amount
			
	print("Money left: ", money)
	
	
func add_to_inv(item_name):
	if(!inventory.has(item_name)):
		inventory[item_name] = 1
	else:
		inventory[item_name] += 1
	
#	print(inventory)
	

func remove_from_inv(item_name):
	if(inventory.has(item_name)):
		if(inventory[item_name] > 0):
			inventory[item_name] -= 1
			
	if(inventory.has(item_name)):
		if(inventory[item_name] == 0):
			inventory.erase(item_name)
	
#	print(inventory)
	
