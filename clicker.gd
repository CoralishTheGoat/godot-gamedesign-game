extends Button
var clicks = 0	


func _on_pressed() -> void:
	clicks += 1
	print("you gained 1 click!")
