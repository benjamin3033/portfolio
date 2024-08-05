extends Control


@export var title_label : Label
@export var back_button : Button
@export var main_menu_control : Control
@export var scroll_container : ScrollContainer

@export var title_hidden_position : Vector2
@export var back_button_hidden_position : Vector2
@export var scroll_container_hidden_position : Vector2

@onready var title_position : Vector2 = title_label.position
var back_button_position = Vector2(70, 985)
@onready var scroll_container_position : Vector2 = scroll_container.position

var active = false

func show_screen():
	title_label.text = "Game Development"
	active = true
	visible = true
	var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(title_label, "position", title_position, 0.2)
	tween.parallel().tween_property(back_button, "position", back_button_position, 0.2)
	tween.parallel().tween_property(scroll_container, "position", scroll_container_position, 0.2)
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
	tween.parallel().tween_property(scroll_container, "position", scroll_container_hidden_position, 0.2)
	await get_tree().create_timer(0.2).timeout
