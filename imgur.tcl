##script by vfs, i dont know anymore if i "ripped" of some other scripped... public domain

package require uri


bind pub - !imgur pub:imgur
 proc pub:imgur {nick host handle chan arg} {
	set args ""
	set url "http://imgur.com/random"
    array set URI [::uri::split $url] ;# Need host info from here
    while {1} {
        set token [eval [list http::geturl $url] $args]
        if {![string match {30[1237]} [::http::ncode $token]]} {return $token}
        array set meta [set ${token}(meta)]
        if {![info exist meta(Location)]} {
            return $token
        }
        array set uri [::uri::split $meta(Location)]
        unset meta
        if {$uri(host) == ""} { set uri(host) $URI(host) }
        # problem w/ relative versus absolute paths
        set url [eval ::uri::join [array get uri]]
	set newurl [string map {"http" "https"} $url]
	putserv "PRIVMSG $chan :$nick: $newurl cc $arg"
    }
 }
