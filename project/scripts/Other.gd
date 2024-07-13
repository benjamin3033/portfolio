extends Control


@export var title_label : Label
@export var back_button : Button
@export var main_menu_control : Control

@export var title_end_position : Vector2
@export var back_button_end_position : Vector2

var active = false

func show_screen():
	title_label.text = "Other"
	active = true
	var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(title_label, "position", title_end_position, 0.2)
	tween.parallel().tween_property(back_button, "position", back_button_end_position, 0.2)
	await get_tree().create_timer(0.2).timeout


func _on_back_button_pressed():
	
	if !active: return
	
	await hide_screen()
	active = false
	main_menu_control.show_screen() 


func hide_screen():
	var tween = get_tree().create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(title_label, "position", Vector2(0, -120), 0.2)
	tween.parallel().tween_property(back_button, "position", Vector2(70, 1121), 0.2)
	await get_tree().create_timer(0.2).timeout
