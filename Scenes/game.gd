extends Node2D

var wheat
var mult
var bonus
var wps

func _ready() -> void:
	wheat = 0
	mult = 1
	bonus = 0

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	$WheatLabel.text = "Wheat: " + str(wheat) 
	$MultLabel.text = "Mult: " + str(mult) 
	$BonusLabel.text = "Bonus: " + str(bonus)
	$WpsLabel.text = "W/Sec: " + str(wps) 

func _on_wheat_harvest() -> void:
	await get_tree().create_timer(.8).timeout
	wheat += round((((randi() % 4 + 3)+bonus)*mult))



func _on_mult_test_button_pressed() -> void:
	if wheat >= 10:
		wheat -= 10
		mult += 0.1

func _on_bonus_test_button_button_down() -> void:
	if wheat >= 10:
		wheat -= 10
		bonus += 1
