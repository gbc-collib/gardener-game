# Interactable.gd
extends Area2D


# This function should be overridden by any object that is interactable
func interact():
	print("Interacting with: ", self.name)
