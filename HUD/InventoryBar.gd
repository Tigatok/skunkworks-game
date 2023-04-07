class_name InventoryBar extends PanelContainer

signal update_active_item(item)
signal update_active_slot(slot_id)

@export var num_slots: int = 5

@onready var inventory:Inventory
@onready var slot_container: HBoxContainer = $SlotContainer
@onready var slot_scene = preload("res://Inventory/InventorySlot.tscn")
@onready var slot_ids = ["1", "2", "3", "4", "5"]

var active_item:Item

func _ready() -> void:
	_initialize_slots()

func _unhandled_key_input(event):
	var key_pressed:String = event.as_text()
	if (!slot_ids.has(key_pressed)):
		return
	if (!event.is_action_pressed(key_pressed)):
		return
	# Index of slots starts at 0.
	var slot_index = key_pressed.to_int() - 1
	if(!item_exists_in_slot(slot_index)):
		return
	set_active_item(slot_index)


# Checks if an item exists in the provided slot
func item_exists_in_slot(slot_index: int) -> bool:
	var slot = slot_container.get_child(slot_index)
	if (!slot.item):
		return false
	return true

# Sets the active item
func set_active_item(slot_index: int) -> void:
	var item_slot = slot_container.get_child(slot_index)
	active_item = item_slot.item
	emit_signal('update_active_item', active_item)
	emit_signal('update_active_slot', item_slot)

	
func _initialize_slots() -> void:
	for _i in range(num_slots):
		var slot = slot_scene.instantiate()
		connect("update_active_slot", Callable(slot, "_on_update_active_slot"))
		slot_container.add_child(slot)

func add_item_to_slot(item: Item) -> bool:
	for slot in slot_container.get_children():
		if not slot.item:
			slot.set_item(item)
			return true
	return false

func _on_inventory_inventory_updated(item:Item, action:String = 'add'):
	if (action == 'add'):
		add_item_to_slot(item)
