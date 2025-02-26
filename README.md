Usage Instructions for the Bot

You can only use change.sh via the command line.

If you don't want the console window to appear all the time, you can use a VBS script to run PowerShell in the background. This will create a tray icon with an exit button for easy access.

To use this bot, you need to rename all the .jpg files to numbers from 1.jpg to 100.jpg (if you want to use 100 images in the loop). Make sure to place all the renamed files in the same folder.

The bot can also be run with newly created, not-yet-setup Steam accounts, so you can still use the avatar!

Cookies can be found on your Steam page by opening the browser > pressing F12 > navigating to the *Application* tab > then clicking Cookies.


#
If you choose to use the VBS script, make sure you have enabled scripts on your system by running the following command:

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

Inside of RunBot.ps1 you need to change $scriptPath = ""
also path need to be changed inside VBS (if you want to use it)
