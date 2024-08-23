extends TextureRect


@export var transition_speed: float = 1
@export var time_between: float = 10
@export var next: TextureRect
@export var images: Array[Texture2D]


var currentImage: int = 0

func _ready():
	images.shuffle()
	texture = images[0]
	
	transition_to_next_image()


func transition_to_next_image():
	if currentImage + 1 > images.size() - 1:
		currentImage = 0
	else:
		currentImage += 1
	
	next.texture = images[currentImage]
	
	var tween = create_tween()
	tween.tween_property(self, "self_modulate", Color(1,1,1,0), transition_speed)
	await tween.parallel().tween_property(next, "self_modulate", Color(1,1,1,1), transition_speed).finished
	
	texture = images[currentImage]
	self_modulate = Color(1,1,1,1)
	next.self_modulate = Color(1,1,1,0)
	
	await get_tree().create_timer(time_between).timeout
	
	transition_to_next_image()
