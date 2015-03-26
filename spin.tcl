###  This Script Not Belong To Me But I Do Some Changes.
###  Now The Spin The Bottle Have A Random Message.
###  Anyone Can Add Easily The Options Of The Random Message That Want.
### 
###     Written By Sergios K. sergios_k@hotmail.com
###
###  
###   Testing
###    Platforms : Linux 2.2.16   TCL v8.3
###                Eggdrop v1.6.0
###                Eggdrop v1.6.6
###         And : SunOS 5.8      TCL v8.3
###                Eggdrop v1.5.4
###
###  Description : IRC Game,the famous game Spin The Bottle (night at beatch,that was my job,lol)
###
###   Future Plans : Send in suggestions.
###
### Author Contact :     Email - sergios_k@hotmail.com
###                      Email - sergios@zeus.dynip.com
###                   Home Page - http://zeus.dynip.com/programs
###                     IRC - Nick: Sergios
###                   Support Channels: #Parea @GRNet (nini.irc.gr)
###                   #Help @ZeusNet (patra.dynip.com)
###                  
###
###                  History : 07/29/2001 - First Release
###
###    This Script Belong To moonwolf, just i do change into random message.
###    Flames/suggestions/invitations to dinner: 
###    moonwolf on IRC                    moonwolf@wolflair.demon.co.uk
###    BOTNET: moonwolf@phelan            wolf@spodbox.ehche.ac.uk
###
###    Oh, BTW, right now the last_nick function doesn't work.  Anyone tell
###    me why please?   Also working on stopping more than one person
###    spinning it at a time.  Suggestions for that also appreciated.  k.
###
###    Modified a bit by dhbrown [chocolat@undernet]. I think "last_nick"
###    works now...
###    Adapted for 1.0 by Robey
###

###    spin_bunny:   Coded by moonwolf with input from Sloot. Reworked by chocolat
###             to eliminate bot, self, last_nick kissing. Incorporates
###             previous "init_bunny" code.

###
### Define last_nick to be $botnick if not yet defined...
###

### edited 2015 by vfs
set floodprot "false"

if {![info exists last_nick]} {set last_nick $botnick}

	proc spin_bunny {nick uhost handle chan args} {
		global floodprot
		global botnick last_nick
		global rep

		if { $floodprot == "false" } {
			if {![onchan $last_nick $chan]} {
				set last_nick $botnick
			}

			set mylist [chanlist $chan]
			set wb [lsearch $mylist $botnick]
			set mylist [lreplace $mylist $wb $wb]
			set wn [lsearch $mylist $nick]
			set mylist [lreplace $mylist $wn $wn]
                        set wkf [lsearch $mylist "kaiser_franz"]
                        set mylist [lreplace $mylist $wkf $wkf]
                        set wdk [lsearch $mylist "derkanzler"]
                        set mylist [lreplace $mylist $wdk $wdk]
			set werica [lsearch $mylist "Erica"]
			set mylist [lreplace $mylist $werica $werica]
                        set wmm [lsearch $mylist "maschinenmensch"]
                        set mylist [lreplace $mylist $wmm $wmm]
			set wrs [lsearch $mylist "ratschlag"]
                        set mylist [lreplace $mylist $wrs $wrs]



			if {$last_nick != $botnick} {
				set wl [lsearch $mylist $last_nick]
				set mylist [lreplace $mylist $wl $wl]
			}

			foreach nname $mylist {
				if { [getchanidle $nname $chan] > 5 } {
					set wnn [lsearch $mylist $nname]
					set mylist [lreplace $mylist $wnn $wnn]
				}
			}
#			putserv "PRIVMSG vfs :$mylist"

			set mylength [llength $mylist]
			if {$mylength == 0 && $nick != "vfs"} {
				putserv "PRIVMSG $chan :$nick, keiner zum Spielen da :("
				return 0
			}
			if { $nick != "vfs" && $args == "" } {
				set myindex [rand $mylength]
			} else {
				set myindex 0
			}
			set result [lindex $mylist $myindex]
			set rep {
				"auf ein / zu einem Bild von juliane fappieren"
				"ein Bild seiner Lauerstation / von sich selbst (außer juliane) / seiner Wohnung liefern"
				"dem Flaschendreher ein Kompliment machen"
				"!roulette spielen"
				"einen Krebsfaden auf KC/b/ erstellen"
				"Femnazis auf Twitter triggern"
				"einen Troll-Tweet verfassen mit populärem Hashtag"
				"einen Krebsfaden auf EC/b/ erstellen"
				"einen Krebsfaden auf NSL/km/ erstellen"
				"juliane als Frau anerkennen für die nächsten 60 min"
				"den Flaschendreher buxen / !roulette starten"
				"seinen Standpunkt zum Holocaust erläutern"
				"ein Geheimnis erzählen"
				"pottbernd im Query trollen"
				"von einer ungewöhnlichen sexuellen Fantasie / seiner großen Liebe erzählen"
				"reibi machen"
				"erklären warum und wie er latiker / user / Tim töten will"
				"von seinem größten Kindheitstrauma erzählen"
				"!rmv ausführen und zum verlinkten Video fappieren"
				"sich einen neuen Vorschlag ausdenken und ihn vfs bei nächster Gelegenheit mitteilen, bzw. an vfs@wegbuxen.biz eine Stromdepesche schreiben"
				"die nervigste Person im Kanal wegbuxen! (Wenn keine Buxrechte !roulette)"
				"pottbernd ein Bild von einer Mettwurst zukommen lassen"
				"ein Drachenlord-Video komplett ansehen - zur Not lässt er sich von Baff beraten welches er gucken sollte"
				"dem Führer einen Kriegsentscheidenden Rat erteilen"
				"sich eine Aufgabe für den Flaschendreher überlegen"
				"einen Faden über Modern Talking auf einem Bildbrett seiner Wahl erstellen"
				"einen kleinen Monolog über den Sinn / Unsinn des Lebens halten"
				"dem Flaschendreher eine(n) Film/Serie/Band empfehlen"
				"seine Privilegien überprüfen und über seine Unterdrückung auf Twitter berichten"
				"erklären was es mit der BRD GmbH auf sich hat"
				"einen Gore-Faden im Kleiderkreisel-Forum eröffnen"
				"erklären wie er zu KC kam"
				"dem Flaschendreher eine verpflichtende lösbare Aufgabe stellen"
			}
			if { $nick != "vfs" } {
				putserv "PRIVMSG $chan :$nick dreht die Flasche ... Sie dreht und dreht sich immer weiter ... Sie kommt langsam zum stehen ... UND:"
				putserv "PRIVMSG $chan :$result muss nun [lindex $rep [rand [llength $rep]]]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11111einself"
				set last_nick $result
			} elseif { $nick == "vfs" && [lindex $args 0] != ""} {
				putserv "PRIVMSG $chan :Die Flasche zeigt nun auf [lindex $args 0]"
				putserv "PRIVMSG $chan :[lindex $args 0] muss nun [lindex $rep [rand [llength $rep]]]!"
				set last_nick $args
			} elseif { $nick == "vfs" && [lindex $args 0] == ""} {
				putserv "PRIVMSG $chan :$nick dreht die Flasche ... Sie dreht und dreht sich immer weiter ... Sie kommt langsam zum stehen ... UND:"
                                putserv "PRIVMSG $chan :$result muss nun [lindex $rep [rand [llength $rep]]]!"
                                set last_nick $result
			}
			set floodprot "true"
			utimer 5 resetthefloodprot
		} else {
			puthelp "NOTICE $nick :NA NA NA!"
		}
		return 1
	}
	proc resetthefloodprot {} {
        global floodprot
        set floodprot "false"
	}
bind pub - !fd spin_bunny

