#written by vfs - public domain
set floodprot "false"

if {![info exists last_nick]} {set last_nick $botnick}
	
	proc wen_beleidigen {nick uhost handle chan args} {
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
				putserv "PRIVMSG $chan :$nick, keiner zum beleidigen da >:|"
				return 0
			}
			if { $nick != "vfs" && $args == "" } {
				set myindex [rand $mylength]
			} else {
				set myindex 0
			}
			set result [lindex $mylist $myindex]

			putserv "PRIVMSG $chan :$nick muss nun $result beleidigen"

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
bind pub - ?wb wen_beleidigen			