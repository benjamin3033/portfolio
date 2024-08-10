extends Control


@export var title_label : Label
@export var back_button : Button
@export var main_menu_control : Control
@export var scroll_container: ScrollContainer

@export var title_end_position : Vector2
@export var container_hidden_position: Vector2

@onready var back_button_hidden_position : Vector2 = back_button.position
@onready var container_shown_posiiton: Vector2 = scroll_container.position

var back_button_position = Vector2(70, 985)

var active = false

func show_screen():
	title_label.text = "Game Modding"
	visible = true
	active = true
	
	scroll_container.position = container_hidden_position
	
	var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(title_label, "position", title_end_position, 0.2)
	
	tween.parallel().tween_property(back_button, "position", back_button_position, 0.2)
	
	tween.parallel().tween_property(scroll_container, "position", container_shown_posiiton, 0.2)
	
	await get_tree().create_timer(0.2).timeout


func _on_back_button_pressed():
	
	if !active: return
	
	await hide_screen()
	active = false
	visible = false
	main_menu_control.show_screen() 


func hide_screen():
	var tween = get_tree().create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(title_label, "position", Vector2(0, -120), 0.2)
	tween.parallel().tween_property(back_button, "position", back_button_hidden_position, 0.2)
	await get_tree().create_timer(0.2).timeout
