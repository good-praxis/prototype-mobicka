extends Area2D

enum ControlMethod {WASD, ARROW} 
export (ControlMethod) var active_control_method = WASD

enum Attacks {FIRE, AIR, WATER, EARTH}
var active_attack = 0
var attacking = false

export (int) var speed = 400

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	print(active_control_method)

func _process(delta):
	move(delta)
	attack_switch()
	attack()

	
func move(delta):
	var velocity = Vector2()
	match active_control_method:
		WASD:
			if Input.is_key_pressed(KEY_W):
				velocity.y -= 1
			if Input.is_key_pressed(KEY_S):
				velocity.y += 1
			if Input.is_key_pressed(KEY_A):
				velocity.x -= 1
			if Input.is_key_pressed(KEY_D):
				velocity.x += 1
		ARROW:
			if Input.is_key_pressed(KEY_UP):
				velocity.y -= 1
			if Input.is_key_pressed(KEY_DOWN):
				velocity.y += 1
			if Input.is_key_pressed(KEY_LEFT):
				velocity.x -= 1
			if Input.is_key_pressed(KEY_RIGHT):
				velocity.x += 1
				
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta

func attack_switch():
	match active_control_method:
		WASD:
			if Input.is_key_pressed(KEY_1):
				active_attack = FIRE
			if Input.is_key_pressed(KEY_2):
				active_attack = AIR
			if Input.is_key_pressed(KEY_3):
				active_attack = WATER
			if Input.is_key_pressed(KEY_4):
				active_attack = EARTH
		ARROW:
			if Input.is_key_pressed(KEY_6):
				active_attack = FIRE
			if Input.is_key_pressed(KEY_7):
				active_attack = AIR
			if Input.is_key_pressed(KEY_8):
				active_attack = WATER
			if Input.is_key_pressed(KEY_9):
				active_attack = EARTH
				
func attack():
	match active_control_method:
		WASD:
			if not attacking and Input.is_mouse_button_pressed(BUTTON_LEFT):
				attacking = true
				launch_attack()
			if not Input.is_mouse_button_pressed(BUTTON_LEFT):
				attacking = false
		ARROW:
			if not attacking and Input.is_mouse_button_pressed(BUTTON_RIGHT):
				attacking = true
				launch_attack()
			if not Input.is_mouse_button_pressed(BUTTON_RIGHT):
				attacking = false
	