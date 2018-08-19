extends KinematicBody2D

const SPEED = 750

var motion = Vector2()

func _ready():
	pass

func _physics_process(delta):
    motion.x = 0
    if Input.is_action_pressed("ui_right"):
        motion.x += SPEED
        $AnimatedSprite.play('run')
        $AnimatedSprite.flip_h = false
        if Input.is_action_pressed("ui_left"):
            motion.x -= SPEED
            $AnimatedSprite.play('run')
            $AnimatedSprite.flip_h = true
        if motion.x == 0:
            $AnimatedSprite.play('idle')
            $AnimatedSprite.flip_h = false
    
    if Input.is_action_pressed("ui_up"):
        $AnimatedSprite.play('jump')
        $AnimatedSprite.flip_h = false
    move_and_slide(motion)