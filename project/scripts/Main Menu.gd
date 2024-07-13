extends Control


@export var button_container : VBoxContainer
@export var title_label : Label

@export_category("Pages")
@export var game_development_control : Control
@export var game_modding_control : Control
@export var other_control : Control


func _on_game_development_pressed():
	await hide_main_menu()
	game_development_control.show_screen()


func _on_game_modding_pressed():
	await hide_main_menu()
	game_modding_control.show_screen()


func _on_artstation_pressed():
	OS.shell_open("https://www.artstation.com/benjaminsaddler")


func _on_other_pressed():
	await hide_main_menu()
	other_control.show_screen()


func hide_main_menu():
	var tween = get_tree().create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(button_container, "position", Vector2(765.5, 1200), 0.2)
	tween.parallel().tween_property(title_label, "position", Vector2(0, -120), 0.2)
	await get_tree().create_timer(0.2).timeout


func show_screen():
	title_label.text = "Portfolio"
	var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(button_container, "position", Vector2(765.5, 408), 0.2)
	tween.parallel().tween_property(title_label, "position", Vector2(0, 0), 0.2)
	await get_tree().create_timer(0.2).timeout
