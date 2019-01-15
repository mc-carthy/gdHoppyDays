extends KinematicBody2D

const SPEED = 750
const GRAVITY = 3000
const UP = Vector2(0, -1)
const JUMP_SPEED = -1500

var motion = Vector2()
export var world_limit = 3000

func _ready():
	global.player = self

func _physics_process(delta):
    update_motion(delta)

func _process(delta):
    update_animation(motion)

func update_motion(delta):
    fall(delta)
    run()
    jump()
    move_and_slide(motion, UP)


func update_animation(motion):
    $AnimatedSprite.update(motion)

func run():
    motion.x = 0
    if Input.is_action_pressed("ui_right"):
        motion.x += SPEED
    if Input.is_action_pressed("ui_left"):
        motion.x -= SPEED

func fall(delta):
    if is_on_floor() or is_on_ceiling():
        motion.y = 0
    else:
        motion.y += GRAVITY * delta

    if position.y > world_limit:
        global.gameState.end_game()

func jump():
    if is_on_floor() and Input.is_action_pressed("ui_up"):
            motion.y = JUMP_SPEED