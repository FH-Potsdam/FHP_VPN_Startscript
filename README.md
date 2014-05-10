# FHP_VPN_Startscript #

Script to simplify VPN usage on campus

Pretty simple and rough code, hacked together at a first start with apple script.

Benutzung:

Wichtig: Aktviere "Start VPN when AnyConnect is started" in AnyConnect und schalte das Script unter OSX Settings -> Sicherheit -> Bedienungshilfen  frei.

1. Starte das Script
2. Einmalige Passworteingabe
3. let the magic happen ;)


## Automatisierung: ##
(funktioniert nur wenn man gerade im WLAN der der FHP ist.)

Benötigt: http://www.controlplaneapp.com/ 
1. Starte das Programm
2. lege in den Einstellungen 2 Umgebungen an
3. Nenne eine **FH Potsdam** und die andere **Unterwegs** oder ähnliches
4. Gehe in den Reiter **Evidenzquellen** und hake dort **Nearby WiFi Network** und **Sleep/Wake Event** an
5. Lege eine neue **Nearby WiFi Network** -> **WiFi SSID** Regel im Reiter Regeln an, und wähle dort das WLAN der FHP aus und stelle die Wahrscheinlichkeit auf 100%. Dann wähle bei Umgebung **FH Potsdam** aus.
6. Erstelle eine weitere Regel im Modus **Sleep/Wake Event**. Wähle im Dialog Sleep, eine Wahrscheinlichkeit von 100% und Umgebung **Unterwegs**.
7. Gehe nun in den Reiter Aktionen und lege eine neue **Aktion** an. (Application Actions -> Open File or Application). Dann wähle das **FHP VPN Startscript** im File Dialog aus.
8. Wähle bei der Aktion unter Umgebung **FH Potsdam**
9. Fertig. Das Script startet jetzt automatisch sobald ihr euch auf dem Campus der FHP befindet. (Auch nach zuklappen des Laptops wird das Sript automatisch gestartet. Wobei es sein kann dass das teilweise nicht funktioniert. Sollte aber mit der nächsten Version richtig funktionieren)

PS: Man sollte evtl. die Benachritigungen von ControlPlane ausschalten, sonst wird man permanent mit Hinweisen bombardiert.
