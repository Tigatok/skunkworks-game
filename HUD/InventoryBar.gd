class_name InventoryBar extends PanelContainer

@onready var inventory:Inventory
@onready var slot_container: HBoxContainer = $SlotContainer
@onready var slot_scene = preload("res://Inventory/InventorySlot.tscn")

@export var num_slots: int = 5

func _ready() -> void:
	_initialize_slots()

func _initialize_slots() -> void:
	for _i in range(num_slots):
		var slot = slot_scene.instantiate()
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
