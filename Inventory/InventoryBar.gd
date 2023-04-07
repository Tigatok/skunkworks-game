class_name InventoryBar extends PanelContainer

@onready var inventory:Inventory
@onready var slot_container: HBoxContainer = $SlotContainer

@export var num_slots: int = 5

func _ready() -> void:
	_initialize_slots()

func _initialize_slots() -> void:
	for _i in range(num_slots):
		var slot_scene = preload("res://Inventory/InventorySlot.tscn")
		var slot = slot_scene.instantiate()
		slot_container.add_child(slot)

func add_item_to_slot(item: Item) -> bool:
	print("Slot", slot_container)
	for slot in slot_container.get_children():
		if not slot.item:
			slot.setItem(item)
			return true
	return false

func _on_inventory_inventory_updated(item:Item, action:String = 'add'):
	print("Slot container", slot_container)
	if (action == 'add'):
		add_item_to_slot(item)
#		inventorySlots.append(item)
#		var sprite = Sprite2D.new()
#		sprite.texture = item.icon
#		sprite.position.x = 500
#		sprite.position.y = 500
#		print(sprite)
#		add_child(sprite)
