extends AnimatedSprite2D
var grown
signal grow
signal harvest
var growbutton
var harvestbutton

func _ready() -> void:
	grown = true


@warning_ignore("unused_parameter")
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
			if grown == false && growbutton == 1:
				self.play("Grow")
				await get_tree().create_timer(1.3).timeout
				grow.emit()
				grown = true
			else:
				if grown == true && harvestbutton == 1:
					grown = false
					self.play("Harvest")
					await get_tree().create_timer(.5).timeout
					harvest.emit()


func _on_grow_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		growbutton = 1
	else:
		growbutton= 0


func _on_harvest_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		harvestbutton = 1
	else:
		harvestbutton = 0
