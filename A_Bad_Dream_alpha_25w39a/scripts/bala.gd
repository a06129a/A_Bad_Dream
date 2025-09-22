extends CharacterBody2D

var direccion: float =0.0
var velocidad: float =1000.0

func _ready():
	rotation=direccion
	
func _physics_process(delta):
	velocity= Vector2(velocidad,0).rotated(direccion)
	move_and_slide()
