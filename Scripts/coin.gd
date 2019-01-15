extends AnimatedSprite


func _on_body_entered(body):
    global.gameState.coin_up()
    $AnimationPlayer.play('die')

func die():
    queue_free()
