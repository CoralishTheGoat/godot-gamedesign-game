extends Node2D

var wheat

func _ready() -> void:
	wheat = 0

func _process(delta: float) -> void:
	$WheatLabel.text = "Wheat: " + str(wheat)



func _on_wheat_harvest() -> void:
	await get_tree().create_timer(.8).timeout
	wheat += (randi() % 4 + 4)
