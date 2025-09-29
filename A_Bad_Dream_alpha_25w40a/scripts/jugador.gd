extends CharacterBody2D

@export var speed = 50
var moveDirection = Vector2.ZERO
@onready var animationTree = $AnimationTree

func _ready():
	animationTree.active = true

func validateInput():
	moveDirection = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		moveDirection.x -= 1
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		moveDirection.x += 1
	if Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W):
		moveDirection.y -= 1
	if Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_S):
		moveDirection.y += 1
	
	moveDirection = moveDirection.normalized()
	velocity = moveDirection * speed

func animatePlayer():
	animationTree["parameters/caminar/blend_position"] = moveDirection

func _physics_process(_delta):
	validateInput()
	animatePlayer()
	move_and_slide()
