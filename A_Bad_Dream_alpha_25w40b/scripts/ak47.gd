extends CharacterBody2D

var bala = preload("res://escenas/bala.tscn")
var jugador: CharacterBody2D
func _ready():
	jugador = get_parent().get_node("../jugador")
func _physics_process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
func shoot():
	var nuevaBala = bala.instantiate()
	nuevaBala.direccion = rotation
	nuevaBala.global_position = $spawnpoint.global_position
	get_tree().current_scene.add_child(nuevaBala)
func _process(delta):
	if jugador:
		self.global_position = jugador.global_position
