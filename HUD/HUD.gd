extends CanvasLayer

@onready var score = 0
signal item_added

func _on_player_coin_picked():
	score += 5
	var format_string = "%s"
	var actual_string = format_string % score
	$Score.text = actual_string

func _on_player_item_picked_up(weapon):
	item_added.emit(weapon)
