To create a UI element we need 3 files that will be placed in OtClient/mods/testWindow/ :

testWindow.otmod:
This file gives information about the window and gives the dependencies and the script.
Also calls the functions tu use when openning and closing the window.

testWindow.otui:
This file sets the layout of the window and the elements inside it( size, margin...).
And you can call functionf from it for example if a click hapenns you can call a function onClick().

testWindow.lua:
This file contains the functions that we use in the window.