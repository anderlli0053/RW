extends Node

@onready var this = self
@onready var lbl = $PanelContainer/Panel/Label

const content = "This is some sample content, written to a file !!!"

func _on_wf_pressed() -> void:
	
	
	var f = FileAccess.open("user://test.txt",FileAccess.WRITE)
	f.store_string(content)
	f.flush()
	f.close()
	
	if FileAccess.file_exists("user://test.txt"):
		print("File was written successfully and exists!")
		#OS.move_to_trash(ProjectSettings.globalize_path("user://test.txt"))
	else:
		print("File doesn't exists or was not written properly!")
	
	
	

func _on_rf_pressed() -> void:
	
	var file = FileAccess.open("user://test.txt", FileAccess.READ)
	var ct = file.get_as_text()
	#return ct
	lbl.text = ct
	
