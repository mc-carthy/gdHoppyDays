extends AnimatedSprite

var taken = false

func _on_body_entered(body):
    if not taken:
        taken = true
        global.gameState.coin_up()
        $AnimationPlayer.play('die')
        global.coin_sfx.play()

func die():
    queue_free()
