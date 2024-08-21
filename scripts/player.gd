extends CharacterBody3D

const WALK_SPEED = 10.0
const SPRINT_SPEED = 18.0
const JUMP_VELOCITY = 6.8
var SENSITIVITY = 0.009

const BOB_FREQ = 2.4
const BOB_AMP = 0.08
var t_bob = 0.0

const BASE_FOV = 75.0
const FOV_CHANGE = 1.5

var gravity = 9.8

var old_vel = 0.0
var fall_damage_thresh = 20.0
var hurt_tween: Tween
var health = 100

@onready var head: Node3D = $head
@onready var camera: Camera3D = $head/Camera3D
@onready var pause: Control = $"../CanvasLayer/Pause"
@onready var hurt_tex: TextureRect = $hurt

var speed = WALK_SPEED

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	print("Game started and mouse mode set to captured.")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("esc"):
		if get_tree().paused:
			resume_game()
		else:
			pause_game()

	if event is InputEventMouseMotion and not get_tree().paused:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -40, 60)

func _physics_process(delta: float) -> void:
	if get_tree().paused:
		return  # Skip processing when paused

	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed("sprint"):
		speed = SPRINT_SPEED
	else:
		speed = WALK_SPEED

	var input_dir = Input.get_vector("left", "right", "up", "down")
	if input_dir != Vector2.ZERO:
		var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

		if is_on_floor():
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 7.0)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 7.0)
		else:
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 3.0)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 3.0)
	else:
		# Stop the player when there is no input
		velocity.x = lerp(velocity.x, 0.0, delta * 10.0)
		velocity.z = lerp(velocity.z, 0.0, delta * 10.0)

		t_bob += delta * velocity.length() * float(is_on_floor())
		camera.position = lerp(camera.position, _headbob(t_bob), delta * 2)
		camera.fov = lerp(camera.fov, BASE_FOV + FOV_CHANGE * clamp(velocity.length(), 0.5, SPRINT_SPEED * 2), delta * 8.0)

	move_and_slide()

	if is_on_floor() and old_vel < -fall_damage_thresh:
		hurt(abs(old_vel) - fall_damage_thresh)

	if not is_on_floor():
		old_vel = velocity.y

	if health <= 0:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene_to_file("res://noEnd.tscn")

func _headbob(time: float) -> Vector3:
	return Vector3(sin(time * BOB_FREQ) * BOB_AMP, cos(time * BOB_FREQ / 2) * BOB_AMP, 0)

func pause_game():
	print("Pausing game.")
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	pause.visible = true

func resume_game():
	print("Resuming game.")
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pause.visible = false

func hurt(damage: float):
	health -= damage
	hurt_tex.modulate = Color.WHITE
	if hurt_tween:
		hurt_tween.kill()
	hurt_tween = create_tween()
	hurt_tween.tween_property(hurt_tex, "modulate", Color.TRANSPARENT, 0.5)
