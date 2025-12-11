extends Node2D

var wheat
var mult
var bonus
var wps
var multp
var bonusp
var wpsp
signal second

func _ready() -> void:
	wheat = 0
	mult = 1
	bonus = 0
	wps = 0
	multp = 100
	bonusp = 10
	wpsp = 250
	
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	$WheatLabel.text = "Wheat: " + str(wheat) 
	$MultLabel.text = "Mult: " + str(mult) 
	$BonusLabel.text = "Bonus: " + str(bonus)
	$WpsLabel.text = "W/Sec: " + str(wps) 
	$"Mult Test Button".text = "Mult Upgrade +0.2   Price: " + str(multp)
	$"Bonus Test Button".text = "Bonus Upgrade +1   Price: " + str(bonusp)
	$"WPS Test Button".text = "W/S Upgrade +1   Price: " + str(wpsp)
	

#wheat per second



func _on_wheat_harvest() -> void:
	await get_tree().create_timer(.8).timeout
	wheat += round((((randi() % 4 + 3)+bonus)*mult))

func _on_mult_test_button_pressed() -> void:
	if wheat >= multp:
		wheat -= multp
		mult += 0.2
		multp = round((multp*1.2))


func _on_bonus_test_button_pressed() -> void:
	if wheat >= bonusp:
		wheat -= bonusp
		bonus += 1
		bonusp = round((bonusp*1.2))


func _on_wps_test_button_pressed() -> void:
	if wheat >= wpsp:
		wheat -= wpsp
		wps += 1
		wpsp = round((wpsp*1.2))


func _on_timer_timeout() -> void:
	wheat += wps


func _on_wheat_2_harvest() -> void:
	await get_tree().create_timer(.8).timeout
	wheat += round((((randi() % 4 + 3)+bonus)*mult))

func _on_wheat_3_harvest() -> void:
	await get_tree().create_timer(.8).timeout
	wheat += round((((randi() % 4 + 3)+bonus)*mult))
