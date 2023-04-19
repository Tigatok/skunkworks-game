class_name InventoryData extends Resource

@export var slot_datas:Array[SlotData]

signal inventory_updated(inventory_data:InventoryData)
signal inventory_active_slot_updated(slot_index:int)

# An inventory can only have one active slot.
var active_slot = null

func pick_up_slot_data(slot_data:SlotData) -> bool:
	for index in slot_datas.size():
		if (not slot_datas[index]):
			slot_datas[index] = slot_data
			inventory_updated.emit(self)
			return true
	return false

func set_active_slot_data(slot_index: int) -> void:
	print(slot_datas[slot_index])
	if not slot_datas[slot_index]:
		return
	if active_slot:
		active_slot.isActive = false
	slot_datas[slot_index].isActive = true
	active_slot = slot_datas[slot_index]
	inventory_active_slot_updated.emit(slot_index)
