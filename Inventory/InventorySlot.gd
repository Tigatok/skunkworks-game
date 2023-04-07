# InventorySlot.gd
extends TextureRect

@onready var item: Item

func setItem(item:Item):
	self.item = item
	texture = item.icon
