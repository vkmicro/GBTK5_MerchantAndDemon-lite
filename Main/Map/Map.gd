extends Control

var map_width
var map_height
onready var color_picker = $ColorPicker
#onready var time_left = $Timer
onready var money = $Top_gui/HBoxContainer3/GUI_currency/currency_amnt

# Called when the node enters the scene tree for the first time.
func _ready():
	map_width = get_viewport().size.x
	map_height = get_viewport().size.y
	print(map_height)
	print(map_width)


func _process(delta):
	map_width = get_viewport().size.x
	map_height = get_viewport().size.y
	update()
	$Top_gui/HBoxContainer3/HBoxContainer/time_left.text = str(floor(GlobalTimer.Glb_time_left))
	GameGlobal.time_left = floor(GlobalTimer.Glb_time_left)
	money.text = str(GameGlobal.money)
	
	$Top_gui/HBoxContainer3/HBoxContainer2/Fighting_power_amnt.text = str(GameGlobal.fighting_power)
	
	if(GlobalTimer.Glb_time_left <= 0 or GameGlobal.is_time_up):
		time_up()
	
	var mouse_vector = get_viewport().get_mouse_position()
	$ViewportContainer/Mouse.position = mouse_vector

func _draw(): 
	#draw grid
	for x in range (map_width):
		draw_line(Vector2(x * 32, 0), Vector2(x * 32,map_height), Color(color_picker.color)) #draw from startingPos, endPos, color)
		
	for y in range (map_height):
		draw_line(Vector2(0, y * 32), Vector2(map_width, y * 32), Color(color_picker.color)) #draw from startingPos, endPos, color)



func _on_ColorPicker_color_changed(color):
	update()


#func _on_Timer_timeout(): #GAME ENDED
#	$pay_debt_popup.show()
#	if(GameGlobal.money < 5000):
#		GameGlobal.money += 5000


func _on_accelerate_coin_rotation_pressed():
	print("coin pressed")
	$Top_gui/HBoxContainer3/GUI_currency/currency_sprt.speed_scale += .5

func time_up():
	if(GameGlobal.money < 5000):
		GameGlobal.money += 5000
	$pay_debt_popup.show()

func game_over():
	print("game ended")
	get_tree().change_scene("res://Main/Game_over_scene.tscn")


func _on_Decline_pressed():
	GameGlobal.has_paid_debt = false
	game_over()

func _on_Pay_pressed():
	GameGlobal.money -= 5000
	GameGlobal.has_paid_debt = true
	game_over()

func _on_Pay2_pressed():
	GameGlobal.money -= 5000
	GameGlobal.has_paid_debt = true
	game_over()


func _on_City5_escape_pressed():
	GameGlobal.has_escaped = true


func _on_City1_pressed():
	get_tree().change_scene("res://Main/Map/Cities/City_1.tscn")


func _on_City2_pressed():
	get_tree().change_scene("res://Main/Map/Cities/City_2.tscn")

func _on_City3_modern_pressed():
	get_tree().change_scene("res://Main/Map/Cities/City_3.tscn")


func _on_City4_pressed():
	get_tree().change_scene("res://Main/Map/Cities/City_4.tscn")
