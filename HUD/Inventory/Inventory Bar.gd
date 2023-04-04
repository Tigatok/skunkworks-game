extends Panel

var itemsInInventory = []

func _on_hud_item_added(item):
	addItemToArray(item)
	addItemToInventoryBar(item)

func addItemToArray(item):
	itemsInInventory.append(item)

func addItemToInventoryBar(item):
	var inventoryItem = preload("res://HUD/Inventory/InventoryItem/InventoryItem.tscn")
	inventoryItem = inventoryItem.instantiate()
	inventoryItem.set_texture(item.weaponIcon)
	self.add_child(inventoryItem)
	var index = itemsInInventory.find(item) + 1
	if (index == 1):
		inventoryItem.offset.x += 32
	else:	
		inventoryItem.offset.x += (index * 64)
	print(inventoryItem.offset.x)
	inventoryItem.offset.y += 32
