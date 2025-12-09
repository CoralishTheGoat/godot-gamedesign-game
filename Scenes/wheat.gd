extends AnimatedSprite2D
var grown
signal grow
signal harvest

func _ready() -> void:
	grown = true
	



func _on_grow_button_pressed() -> void:
	if grown == false:
		self.play("Grow")
		await get_tree().create_timer(1.3).timeout
		grow.emit()
		grown = true

func _on_harvest_button_pressed() -> void:
	if grown == true:
		grown = false
		self.play("Harvest")
		await get_tree().create_timer(.5).timeout
		harvest.emit()
