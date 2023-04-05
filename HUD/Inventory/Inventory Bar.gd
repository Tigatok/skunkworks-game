extends Panel

signal update_active_item

var itemsInInventory = []
var activeItem

const KEY_INVENTORY_1 = "1"
const KEY_INVENTORY_2 = "2"
const KEY_INVENTORY_3 = "3"

func _process(delta):
	if (Input.is_action_just_pressed(KEY_INVENTORY_1)):
		set_active_inventory_item(0)
	if (Input.is_action_just_pressed(KEY_INVENTORY_2)):
		set_active_inventory_item(1)
	if (Input.is_action_just_pressed(KEY_INVENTORY_3)):
		set_active_inventory_item(2)

func set_active_inventory_item(index):
	var inventory_items = get_tree().get_nodes_in_group('inventory_items')
	if index < inventory_items.size():
		activeItem = index
		inventory_items[index].setAsActive(true)
		for item in inventory_items:
			print("self", self, " item:", item)
			item.emit_signal('deactivate')
		
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
