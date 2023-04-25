extends Node

@onready var player = $Player
@onready var inventory_interface:InventoryInterface = $UI/InventoryInterface
@onready var monster = preload("res://Monster/monster.tscn")
@export var safe_range = 800
@export var monsters_size = 10

var monsters = []

func _ready() ->void:
	inventory_interface.set_player_inventory_data(player.inventory_data)

func _on_game_timer_timeout():
	if  monsters.size() > monsters_size:
		return
	var new_monster:Monster = monster.instantiate()

	new_monster.position = player.position + Vector2(safe_range, 0).rotated(randf_range(0, 2*PI))
	new_monster.monster_id = 'blob'
	new_monster.connect("monster_died", Callable(self, '_on_monster_died'))
	monsters.append(new_monster)
	add_child(new_monster)

func _on_monster_died(mob:Node):
	var index = monsters.find(mob)
	monsters.remove_at(index)
