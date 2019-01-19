extends Area2D

const SPEED = 200

func _ready():
    set_as_toplevel(true)


func _physics_process(delta):
    move_down_screen(delta)
    manage_collision()
    if not $VisibilityNotifier2D.is_on_screen() and global_position.y > 10000:
        queue_free()

func move_down_screen(delta):
    global_position.y += SPEED * delta

func manage_collision():
    var cols = get_overlapping_bodies()
    for col in cols:
        if col == global.player:
            global.gameState.hurt()
        queue_free()