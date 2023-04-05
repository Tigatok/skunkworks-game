extends Sprite2D

var isActive = false
signal deactivate

func setAsActive(active):
	isActive = active
	print("Is active?", active)
	if (active == true && !isActive):
		isActive = true
		$ActiveLabel.position = self.offset
		$ActiveLabel.text = 'Active'

func _on_deactivate():
	setAsActive(false)
