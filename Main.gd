extends Node

@onready var player = $Player
@onready var inventory_interface:InventoryInterface = $UI/InventoryInterface
@onready var player_inventory = $PlayerInventory

func _ready() ->void:
	inventory_interface.set_player_inventory_data(player.inventory_data)

