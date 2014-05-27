PolJonasSnake
=============

Snake Game for the Basys2 Board

## Remember how to use git

git status

git add *
git commit -m "MESSAGE"
git push origin master

git pull origin master

## Notes

** 27/05/2104 - 22 Uhr **
Jonas: das Spiel ist eigentlich fertig, allerdings Zaehlt der ScoreCounter immernoch manchmal mehrere Punkte auf einmal hoch. Das liegt glaube ich an den Apfel-Positionen, die sich mehrmals in einem Gameclock ändern können. Morgen werde ich in den ScoreCounter noch hardcoden, dass er nur einmal pro Gameclock hochzählen kann und dann wird abgegeben.

Und mir hat es gereicht mit den vielen Files. Alles bis auf .v, .ucf und das Projekt-File Snake.xise wird jetzt ignoriert.

** 27/05/2014 - 18 Uhr **
Jonas: Ich konnte ganz viele Dateien löschen, da die noch aus der Zeit gekommen sind, in dem wir andere Top-Level-Module hatten. Ausserdem habe ich die Logfiles in .gitignore hinzugefügt, die Apfelposition verbessert und den Apfel-Fluktuations-Bug behoben.

** 26/05/2014 **
Pol: Ich habe die Taktquelle wieder auf den integrierten Oszillator umgestellt. Der zusätzliche Quartz hat leider einen Wackler, oft wenn ich einen der Buttons betätige bricht das Bild ab.


