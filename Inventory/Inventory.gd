class_name Inventory extends PanelContainer

const Slot = preload("res://Inventory/Slot.tscn")

signal inventory_set_active(index:int)

@onready var item_grid:GridContainer = $MarginContainer/ItemGrid

func _unhandled_key_input(event: InputEvent):
	if not event.is_pressed():
		return
	if range(KEY_1, KEY_7).has(event.keycode):
		var index = event.keycode - KEY_1
#		item_grid.get_child(index).get_node('ActiveBorder').visible = true
		for child in item_grid.get_children():
			child.get_node('ActiveBorder').visible = false
		inventory_set_active.emit(index)
		
func set_inventory_data(inventory_data:InventoryData) -> void:
	inventory_data.inventory_updated.connect(populate_item_grid)
	inventory_set_active.connect(inventory_data.set_active_slot_data)
	inventory_data.connect('inventory_data_updated', Callable(self, '_on_inventory_data_updated'))
	populate_item_grid(inventory_data)

func _on_inventory_data_updated(slot_index:int):
	item_grid.get_child(slot_index).get_node('ActiveBorder').visible = true

func populate_item_grid(inventory_data:InventoryData) -> void:
	for child in item_grid.get_children():
		child.queue_free()
	
	for slot_data in inventory_data.slot_datas:
		var slot = Slot.instantiate()
		item_grid.add_child(slot)
		
		if slot_data:
			slot.set_slot_data(slot_data)
