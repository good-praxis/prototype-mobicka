extends Area2D

enum ControlMethod {WASD, ARROW} 
export (ControlMethod) var active_control_method = WASD
export (int) var speed = 400

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	print(active_control_method)

func _process(delta):
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