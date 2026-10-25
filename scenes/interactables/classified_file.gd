extends StaticBody3D


var has_been_read:bool=false

func interact():
	if not has_been_read:
		has_been_read=true
		return "CLASSIFIED LOG: 'The archive locks weren't removed for maintenance. They were removed to trap us inside.'"
	else:
		return "The rest of the pages are heavily redacted."
