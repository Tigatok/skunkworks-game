class_name Inventory

const ItemType = Item.ItemType

signal inventory_updated(Item, String)
var items:Dictionary = {}

func add_item(item:Item, quantity: int = 1):
	if items.has(item.id):
		items[item.id]["quantity"] += quantity
	else:
		items[item.id] = {"item": item, "quantity": quantity}
	emit_signal("inventory_updated", item, "add")

func remove_item(item: Item, quantity: int = 1):
	if items.has(item.id):
		items[item.id]["quantity"] -= quantity

		if items[item.id]["quantity"] <= 0:
			items.erase(item.id)
		emit_signal("inventory_updated", item, "remove")
	else:
		print("Item not found in inventory")
