tool
extends EditorPlugin


# A class member to hold the dock during the plugin life cycle.
var dock

func _enter_tree():
	# Initialization of the plugin goes here.
	# Load the dock scene and instance it.
	dock = preload("res://addons/metalogue_plugin/dock_scene.tscn").instance()
	add_custom_type("MyButton", "Panel", preload("test_button.gd"), preload("res://icon.png"))

	# Add the loaded scene to the docks.
	add_control_to_dock(DOCK_SLOT_LEFT_UL, dock)
	# Note that LEFT_UL means the left of the editor, upper-left dock.


func _exit_tree():
	# Clean-up of the plugin goes here.
	# Remove the dock.
	remove_control_from_docks(dock)
	remove_custom_type("MyButton")
	# Erase the control from the memory.
	dock.free()
