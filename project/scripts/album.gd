extends Control

@export var time_between: float = 5
@export var images: Array[Texture2D]


func _ready():
	$TextureRect.texture = images[0]
	
	$ProgressBar.max_value = time_between
	
	$Timer.wait_time = time_between
	$Timer.start()
	await $Timer.timeout
	
	next_image()


func _process(_delta):
	$ProgressBar.value = $Timer.time_left


func skip_image():
	$Timer.stop()
	next_image()


func next_image():	
	var current_index = images.find($TextureRect.texture)
	
	if current_index + 1 > images.size() - 1:
		$TextureRect.texture = images[0]
	else:
		$TextureRect.texture = images[current_index + 1]
	
	$Timer.start()
	await $Timer.timeout
	
	next_image()
