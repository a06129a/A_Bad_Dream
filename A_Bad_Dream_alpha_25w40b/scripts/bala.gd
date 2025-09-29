extends CharacterBody2D

var direccion: float = 0.0
var velocidad: float = 250.0
var velocidad_minima: float = 10.0  # velocidad mínima a la que se mantendrá
var tiempo_vida: float = 5.0
var tiempo_transcurrido: float = 0.0

func _ready():
	rotation = direccion
	# Empieza la cuenta regresiva para destruir la bala
	await get_tree().create_timer(tiempo_vida).timeout
	queue_free()

func _physics_process(delta):
	tiempo_transcurrido += delta

	# Interpolamos la velocidad hacia la mínima usando lerp (lineal)
	var factor = tiempo_transcurrido / tiempo_vida
	velocidad = lerp(1000.0, velocidad_minima, clamp(factor, 0, 1))

	velocity = Vector2(velocidad, 0).rotated(direccion)
	move_and_slide()
