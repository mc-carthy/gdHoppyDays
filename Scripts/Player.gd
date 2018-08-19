extends KinematicBody2D

const SPEED = 750
const GRAVITY = 3000
const UP = Vector2(0, -1)
const JUMP_SPEED = -1500

var motion = Vector2()

func _ready():
	pass

func _physics_process(delta):
    fall(delta)
    run()
    jump()
    move_and_slide(motion, UP)

func run():
    motion.x = 0
    $AnimatedSprite.flip_h = false
    if Input.is_action_pressed("ui_right"):
        motion.x += SPEED
        if is_on_floor():
            $AnimatedSprite.play('run')
    if Input.is_action_pressed("ui_left"):
        motion.x -= SPEED
        if is_on_floor():
            $AnimatedSprite.play('run')
        $AnimatedSprite.flip_h = true
    if motion.x == 0 and motion.y == 0:
        $AnimatedSprite.play('idle')

func fall(delta):
    if is_on_floor():
        motion.y = 0
    else:
        motion.y += GRAVITY * delta

func jump():
    if is_on_floor() and Input.is_action_pressed("ui_up"):
            motion.y = JUMP_SPEED