extends StaticBody2D

var score = 0
var new_position = Vector2.ZERO
var dying = false

func _ready():
	position = new_position
	if score >= 100:
		$ColorRect.color = Color8(224,49,49,255)
	elif score >= 90:
		$ColorRect.color = Color8(253,126,20,255)

func _physics_process(_delta):
	if dying and not $Confetti.emitting:
		queue_free()

func hit():
	die()

func die():
	dying = true
	$Confetti.emitting = true
	collision_layer = 0
	$ColorRect.hide()
	Global.update_score(score)
	get_parent().check_level()
