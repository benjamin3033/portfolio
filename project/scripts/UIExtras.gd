extends Control

@export var should_hover_scale: bool = false
@export var hover_scale_value: Vector2 = Vector2(1.1,1.1)
var start_scale: Vector2



func _ready():
	if should_hover_scale:
		start_scale = scale
		mouse_entered.connect(mouse_hover)
		mouse_exited.connect(mouse_unhover)


func open_website(url: String):
	OS.shell_open(url)


func mouse_hover():
	var tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.tween_property(self, "scale", hover_scale_value, 0.2)


func mouse_unhover():
	var tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_BACK)
	tween.tween_property(self, "scale", start_scale, 0.2)
