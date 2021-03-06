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
	tell application "Cisco AnyConnect Secure Mobility Client" to activate
	tell application "System Events"
		
		keystroke "asa.fh-potsdam.de:81"
		key code 52
		
		set passReq to 0
		repeat while passReq is 0
			if exists window "Cisco AnyConnect | asa.fh-potsdam.de:81" of process "Cisco AnyConnect Secure Mobility Client" then
				keystroke txtToTrans
				key code 52
				set passReq to 1
			end if
		end repeat
	end tell
else -- if not running, no need to adjust the portnumber
	tell application "Cisco AnyConnect Secure Mobility Client" to activate
	tell application "System Events"
		set passRequested to 0
		repeat while passRequested is 0
			if exists window "Cisco AnyConnect | asa.fh-potsdam.de:81" of process "Cisco AnyConnect Secure Mobility Client" then
				keystroke txtToTrans
				key code 52
				set passRequested to 1
			end if
		end repeat
	end tell
end if
