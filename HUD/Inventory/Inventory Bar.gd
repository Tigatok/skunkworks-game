extends Panel

signal update_active_item

var itemsInInventory = []
var activeItem

func _process(delta):
	if (Input.is_action_just_pressed("1")):
		# Highlight selected square.
		if (0 < itemsInInventory.size()):
			print("Item in 0 index")
			# Highlight first inventory space
			# set active item to 0
			print(itemsInInventory[0].name)
#	if (Input.is_action_just_pressed("2")):
#		print("2")
#		if (1 < itemsInInventory.size()):
#			print("Item 1")

func _on_hud_item_added(item):
	addItemToInventoryArray(item)
	addItemToInventoryBar(item)
#	print(get_tree().get_nodes_in_group('inventory_items'))

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
	inventoryItem.add_to_group('inventory_items')
