extends CharacterBody2D  # 继承自CharacterBody2D节点

# 导出变量，用于在编辑器中设置移动速度
@export var move_speed: float = 50

# 导出变量，用于引用动画精灵节点
@export var animator: AnimatedSprite2D

# 物理处理函数，每帧调用
# 参数 _delta 表示距离上一帧的时间间隔
func _physics_process(_delta: float) -> void:
	# 获取输入向量并计算速度
	velocity = Input.get_vector("left", "right", "up", "down") * move_speed
	
	# 根据速度判断播放哪个动画
	if velocity == Vector2.ZERO:
		animator.play("idle")  # 静止时播放待机动画
	else:
		animator.play("run")   # 移动时播放跑步动画
	
	# 执行移动
	move_and_slide()
