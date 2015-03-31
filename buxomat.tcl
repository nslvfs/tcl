#public domain - mostly #krautchan related stuff
#v1.3 paar neue Funktionen
#v1.2 Gangmem ist nun dabei
#v1.1 logik fehler beseitig
#v1.0 1. veröffentlichung

bind pub * <3 pub:liebe
proc pub:liebe {nick host hand chan text} {
	set ziel [lindex $text 0]
	if { $ziel == "Exekutivfs" } {
	        putserv "privmsg $chan :<3 $nick"
        }
}


bind pub * ?admin pub:vfsc
bind pub * ?help pub:vfsc
proc pub:vfsc {nick host hand chan text} {
        putserv "NOTICE $nick :vfs vfs@wegbuxen.biz"
}

bind pub * !getRandomNumber pub:pseudornd
proc pub:pseudornd {nick host hand chan text} {
        putserv "privmsg $chan :9"
}




bind pub O ?gang pub:gangmem
proc pub:gangmem {nickt host hand chan text} {
	set ziel ""
	foreach nick [chanlist $chan] {
		set len [string length $nick]
		if { $len == 3 } {
			append ziel "$nick "
		}
	}
	putserv "privmsg $chan :Gangmitglieder sind zur Zeit: $ziel"
}




bind msg n say bot:query
proc bot:query {nick host hand text} {
	set ziel [lindex $text 0]
	set rest [lrange $text 1 end]
	putserv "privmsg $ziel :$rest"
}



bind pub * ?jn pub:8ball
proc pub:8ball {nick host handle channel text} {
	set 8ball "[rand 4]"

	if {[string match "*Gott*" $text] || [string match "*gott*" $text]} {
		putserv "privmsg $channel :$nick: Nein! Ausgeschlossen! Unmöglich!"
		return
	}
	if {[string match "*arbeit*" $text] || [string match "*Arbeit*" $text]} {
		if {$nick == "vfs" || $nick == "peiou" || "verwalter"} {
			putserv "privmsg $channel :$nick: Nein! Ausgeschlossen! Unmöglich!"
			return
		} else {
			putserv "privmsg $channel : $nick: Ja!"
			return
		}
	}

	if {$8ball == "0" || $8ball == "2"} {
		putserv "privmsg $channel :$nick: Ja!"
	} elseif {$8ball == "1" || $8ball == "3"} {
		putserv "privmsg $channel :$nick: Nein!"
	}

}

#bind pub * ?arbeiten pub:arbeiten
#bind pub * ?arbeit pub:arbeiten
proc pub:arbeiten {nick host handle chan text} {
	if {$nick == "vfs" || $nick == "peiou" || "verwalter"} {
 		putmsg $chan "Nein!"
	} else {
		putmsg $chan "Ja!"
	}
}

bind pub O !exekutiere pub:wegbuxen
proc pub:wegbuxen {nick host handle chan text} {
	putserv "PRIVMSG $chan :Jawohl mein Führer"
	putserv "PRIVMSG $chan :$text wegbuxen"
}



bind pub O !gegenangriff pub:wegbuxen2
proc pub:wegbuxen2 {nick host handle chan text} {
        putserv "PRIVMSG $chan :$text wegbuxen"
	putserv "PRIVMSG $chan :Der Gegenangriff ist erfolgt, mein Führer"
}




#bind pub * !gegen pub:vfsschutz
#bind pub * vfs pub:vfsschutz
proc pub:vfsschutz  {nick host handle chan text} {
	if {$text == "wegbuxen" ||  $text == "vfs"} {
		putserv "PRIVMSG $chan :$nick wegbuxen"
	}
}

bind pubm -|- * todesbux

proc todesbux {nick uhost hand chan text} {
	set randflame [expr {int(10000*rand())}]
	set buxomat [lindex $text 3]
	if {$buxomat == "juliane" || $buxomat == "berlinbernd" || $buxomat == "Veicha"} {
		if {[string match "*registriert, noch 1 Stimme*" $text]} {
			putmsg $chan "würde $buxomat wegbuxen cc vfs"
		}
	}
	if {$randflame <= 9 && $nick != "vfs" && $nick != "dergeneral" && $nick != "peiou" && $nick != "loom" && $nick != "Heil" && $nick != "Tsaryu" && $nick != "verwalter"} {
		putmsg $chan "HALT DIE FRESSE $nick"

	} elseif {$randflame <= 20 && $nick == "geheim"} {
		putmsg $chan "HALT DIE FRESSE $nick"
	} elseif {$randflame <= 46 && $nick == "chamois"} {
		putmsg $chan "HALT DIE FRESSE $nick"
	} elseif {$randflame <= 99 && $nick == "juliane"} {
		putmsg $chan "HALT DIE FRESSE MANN"
	}
}

bind pub - ?jetzt jetztzeit
proc jetztzeit {nick host handle channel arg} {
	set jetzt [unixtime]
	puthelp "NOTICE $nick :$jetzt"
}



bind pub - !feiertag countdown
proc countdown {nickname hostname handle channel arg} {
    set date1 "1429480800"
    set now [unixtime]
    set left [expr { $date1 - $now }]
    set formatted [clock format $date1 -format "%d.%m.%Y"]
    set leftform [duration $left]
    puthelp "PRIVMSG $channel :$nickname: Noch $leftform bis zum Führergeburtstag am $formatted - an diesem Tag passiert sonst nichts relevantes"

}




proc duration { int_time } {
     set timeList [list]
     foreach div {86400 3600 60 1} mod {0 24 60 60} name {Tag/e Stunde/n Minute/n Sekunde/n} {
         set n [expr {$int_time / $div}]
         if {$mod > 0} {set n [expr {$n % $mod}]}
             lappend timeList "$n $name"
     }
     return [join $timeList]
 }


putlog "buxomat.tcl von vfs geladen"
