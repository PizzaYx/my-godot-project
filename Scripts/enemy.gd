extends Area2D

@export var slime_speed : float = - 100

var is_dead : bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not is_dead:
		position += Vector2(slime_speed,0) * delta


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.game_over()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		area.queue_free()
		$AnimatedSprite2D.play("death")
		is_dead = true
		await  get_tree().create_timer(0.6).timeout
		queue_free()
