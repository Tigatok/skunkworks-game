extends Panel

var itemsInInventory = []

func _on_hud_item_added(item):
	addItemToInventoryArray(item)
	addItemToInventoryBar(item)

func addItemToInventoryArray(item):
	itemsInInventory.append(item)

# Creates an inventory item, and sets the icon.
func addItemToInventoryBar(item):
	var inventoryItem = preload("res://HUD/Inventory/InventoryItem/InventoryItem.tscn")
	inventoryItem = inventoryItem.instantiate()
	inventoryItem.set_texture(item.weaponIcon)
	self.add_child(inventoryItem)
	var index = itemsInInventory.find(item) + 1
	if (index == 1):
		inventoryItem.offset.x += 32
	else:	
		inventoryItem.offset.x += (index * 64) - 32
	inventoryItem.offset.y += 32
