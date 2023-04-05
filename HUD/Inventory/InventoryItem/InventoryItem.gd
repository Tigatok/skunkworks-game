extends Sprite2D

signal deactivate

func setAsActive(active):
	print("Is active?", active)
	if (active == true):
		print("S", self.offset, " ", $ActiveLabel.position)
		$ActiveLabel.position = self.offset
		$ActiveLabel.text = 'X'
		$ActiveLabel.show()

func _on_deactivate():
	$ActiveLabel.hide()
