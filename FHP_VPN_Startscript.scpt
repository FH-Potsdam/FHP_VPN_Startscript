set vpnPassword to "nopw"
set vpnPasswordFile to "vpn_fhp.txt"

set vpnPwExists to false
try
	((path to documents folder) & vpnPasswordFile as string) as alias
	-- check if vpnPasswordFile exists
	set vpnPwExists to true
on error
	-- Open passworddialog
	display dialog "Bitte gib dein VPN Passwort ein (einmalig)" default answer ""
	set vpnPassword to text returned of result
	set vpnOutputFile to ((path to documents folder as text) & vpnPasswordFile)
	try
		set fileReference to open for access file vpnOutputFile with write permission
		write vpnPassword to fileReference
		close access fileReference
	on error
		try
			close access file vpnOutputFile
		end try
	end try
end try

-- read the password file
set theFile to ((path to documents folder as text) & vpnPasswordFile)
set txtToTrans to (read file theFile)

on is_running(appName)
	tell application "System Events" to (name of processes) contains appName
end is_running



set safRunning to is_running("Cisco AnyConnect Secure Mobility Client")
-- check if Cisco is running
if safRunning then
	-- 
	tell application "Cisco AnyConnect Secure Mobility Client" to activate
	tell application "System Events"
		keystroke "asa.fh-potsdam.de:81"
		key code 52
		delay 1
		keystroke txtToTrans
		key code 52
	end tell
else -- if not running, no need to adjust the portnumber
	tell application "Cisco AnyConnect Secure Mobility Client" to activate
	delay 1
	tell application "System Events"
		keystroke txtToTrans
		key code 52
	end tell
end if
