#written by vfs - public domain
set floodprot "false"

if {![info exists last_nick]} {set last_nick $botnick}
	proc knuddeln {nick uhost handle chan args} {
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
				putserv "PRIVMSG $chan :$nick, keiner zum knuddeln da ;_;"
				return 0
			}
			if { $nick != "vfs" && $args == "" } {
				set myindex [rand $mylength]
			} else {
				set myindex 0
			}
			set result [lindex $mylist $myindex]
			puthelp "PRIVMSG $chan :\001ACTION knuddelt $result \001"

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
bind pub - !schwense knuddeln
