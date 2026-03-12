extends RichTextLabel

@export var dialogue = [
	"Hello [b]hero[/b]!",
	"Welcome to the [color=blue]village[/color].",
	"This is [i]very important[/i].",
	"Watch out for the [color=red]danger[/color] ahead.",
	"You should take a [i][b][color=yellow] sword [/color][/b][/i].",
	"You must stay [b][color=yellow]strong[/color][/b].",
	"Good luck on your journey!"
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
	var reading_tag = false

	text = ""

	for char in line:

		if char == "[":
			reading_tag = true

		current_text += char
		text = current_text

		if char == "]":
			reading_tag = false

		if not reading_tag:
			await get_tree().create_timer(0.02).timeout
