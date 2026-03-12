extends RichTextLabel

@export var dialogue = [
	"Hello there.",
	"Welcome to the village.",
	"It's dangerous outside.",
	"You should take a sword.",
	"Good luck on your journey."
]

var index = 0


func _ready():
	show_text(dialogue[index])


func _input(event):
	if event is InputEventMouseButton and event.pressed:
		next_line()

	if event.is_action_pressed("ui_accept"):
		next_line()


func next_line():
	index += 1

	if index >= dialogue.size():
		index = 0

	show_text(dialogue[index])


func show_text(line):
	var current_text = ""
	
	for char in line:
		current_text += char
		text = current_text
		await get_tree().create_timer(0.02).timeout
