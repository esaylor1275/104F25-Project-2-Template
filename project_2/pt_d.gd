extends RichTextLabel

# Dialogue lines
@export var dialogue = [
	"Hello [b]hero[/b]!",
	"Welcome to the [color=blue]village[/color].",
	"This is [i]very important[/i].",
	"Watch out for the [color=red]danger[/color] ahead.",
	"You should take a [i][b][color=yellow] sword [/color][/b][/i].",
	"You must stay [b][color=yellow]strong[/color][/b].",
	"Good luck on your journey!"
]


var images = []

# Current dialogue
var index = 0

func _ready():
	# Directly reference images in scene
	
	images = [
		$Hello,     # Image for line 0
		$Welcome,   # Image for line 1
		$Important, # Image for line 2
		$Danger,    # Image for line 3
		$Sword,     # Image for line 4
		$Strong,    # Image for line 5
		$Luck       # Image for line 6
	]
	
	# Hide all images at the start
	for img in images:
		if img:
			img.visible = false

	# Show the first dialogue line and its image
	show_text(dialogue[index])
	if images[index]:
		images[index].visible = true

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		next_line()
	if event.is_action_pressed("ui_accept"):
		next_line()

func next_line():
	# Hide the current image
	if images[index]:
		images[index].visible = false

	# Continue to the next dialogue line
	index += 1
	if index >= dialogue.size():
		index = 0

	# Show the next line of dialogue and its image
	show_text(dialogue[index])
	if images[index]:
		images[index].visible = true

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
