import keyboard
import os
import re

def up():
	current_brightness = os.system('xrandr --verbose --current | grep "DVI-D-0" -A5 | tail -n1')
	print(str(current_brightness))
	x = re.search('\d{1}\.\d{2}', str(current_brightness))
	print(x)

def down():
	print('down!')

keyboard.add_hotkey('ctrl+shift+]', up)
keyboard.add_hotkey('windows+shift+[', down)
keyboard.wait()
