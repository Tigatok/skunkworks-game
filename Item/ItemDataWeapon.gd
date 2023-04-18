class_name ItemDataWeapon extends ItemData

enum WeaponType {
	RANGED,
	MELEE
}

@export var damage:int = 5
@export var weapon_type: WeaponType
@export var test:Resource
var missile_scene = preload("res://Missile/missile.tscn")

func use(target)->void:
	print("Weapon use!")
	if not weapon_type == WeaponType.RANGED:
		return
	# If its a ranged weapon, shoot a missle.
	var visibility_notifier = VisibleOnScreenNotifier2D.new()
	var instance = missile_scene.instantiate()
	instance.get_node("Sprite2D").texture = test.texture
	instance.position = target.position
	instance.position.y -= 50
	instance.add_child(visibility_notifier)
	visibility_notifier.connect("screen_exited", Callable(self,"_on_projectile_screen_exited").bind(instance))
	instance.linear_velocity = Vector2(0, -1 * instance.speed)
	target.get_node("/root").add_child(instance)

func _on_projectile_screen_exited(instance):
	instance.queue_free()
