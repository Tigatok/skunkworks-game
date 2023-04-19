class_name ItemPickup extends Area2D

@export var slot_data:SlotData

@onready var item_sprite = $ItemSprite

func _ready():
	item_sprite.texture = slot_data.item_data.texture


func _on_body_entered(body):
	if not body.name == 'Player':
		return
	body.inventory_data.pick_up_slot_data(slot_data)
	queue_free()
