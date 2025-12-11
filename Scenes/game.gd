extends Node2D

var wheat
var mult
var bonus
var wps
var multp

func _ready() -> void:
	wheat = 0
	mult = 1
	bonus = 0
	multp = 10
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	$WheatLabel.text = "Wheat: " + str(wheat) 
	$MultLabel.text = "Mult: " + str(mult) 
	$BonusLabel.text = "Bonus: " + str(bonus)
	$WpsLabel.text = "W/Sec: " + str(wps) 
	$"Mult Test Button".text = "Mult Upgrade +0.1   Price: " + str(multp)

func _on_wheat_harvest() -> void:
	await get_tree().create_timer(.8).timeout
	wheat += round((((randi() % 4 + 3)+bonus)*mult))

func _on_mult_test_button_pressed() -> void:
	if wheat >= multp:
		wheat -= multp
		mult += 0.1
		multp = (multp*1.2)

func _on_bonus_test_button_button_down() -> void:
	if wheat >= 10:
		wheat -= 10
		bonus += 1
