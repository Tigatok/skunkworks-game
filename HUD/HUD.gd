extends CanvasLayer

@onready var score = 0

func _on_player_coin_picked():
	print("Coin picked.")
	score += 5
	var format_string = "%s"
	var actual_string = format_string % score
	$Score.text = actual_string
