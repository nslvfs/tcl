# decision.tcl by lookshe (v 1.1)
#
# todo: little bit better coding style
#
# usage: [ ] decision1 [ ] decision2 [ ] desicion3 ...
#   no need for space after "]" but before "["
#
# Changelog:
# 
# 1.0
#  - first working version
#
# 1.1
#  - remember answers for 60 minutes


bind pub - \[ proc_decision

proc proc_decision {nick host hand chan arguments} {

global do_dec
if {[info exists do_dec($nick:$chan)]} {
   if {$nick == "lookshe"} {
      unset do_dec($nick:$chan)
   } else {
      set act_do_dec $do_dec($nick:$chan)
      if {$act_do_dec < 3} {
         incr act_do_dec
         set do_dec($nick:$chan) $act_do_dec
      } else {
         putserv "NOTICE $nick :no flooding!"
         return 0
      }
   }
} else {
   if {$nick != "lookshe"} {
      set do_dec($nick:$chan) 1
      timer 10 "unset do_dec($nick:$chan)"
   }
}

   set allargs [string map {" " _} $arguments]
   set arguments [split $arguments]
   set count 1
   set klammer_count 0
   if {([lindex $arguments 0] == "]") || ([string first "]" [lindex $arguments 0]] == 0)} {
      incr klammer_count
   } else {
      return
   }
   while {$count != [llength $arguments]} { 
      if {[lindex $arguments $count] == "\["} {
         set tmp $count
         incr tmp
         if {([lindex $arguments $tmp] == "]") || ([string first "]" [lindex $arguments $tmp]] == 0)} {
            incr klammer_count
         }
      }
      incr count
   }
   if {$klammer_count == 1} {
      return
   }
   set count 0
   set myrand [rand $klammer_count]
   if {[info exists do_dec($allargs)]} {
      set myrand $do_dec($allargs)
      timer 60 "unset do_dec($allargs)"
   } else {
      set do_dec($allargs) $myrand
      timer 60 "unset do_dec($allargs)"
   }
   set klammer_count 0
   if {$myrand == 0} {
      set output "\[X"
      while {$count != [llength $arguments]} {
         set output "$output[lindex $arguments $count] "
         incr count
      }
   } else {
      set output "\["
      while {$count != [llength $arguments]} { 
         if {[lindex $arguments $count] == "\["} {
            set tmp $count
            incr tmp
            if {([lindex $arguments $tmp] == "]") || ([string first "]" [lindex $arguments $tmp]] == 0)} {
               incr klammer_count
            }
         }
         if {$klammer_count == $myrand} {
            if {([lindex $arguments $count] == "]") || ([string first "]" [lindex $arguments $count]] == 0)} {
               set output "[string range $output 0 end]X"
            } else {
               set output "$output "
            }
         } else {
            set output "$output "
         }
         set output "$output[lindex $arguments $count]"
         incr count
      }
      
   }
   putserv "PRIVMSG $chan :$output"
}

putlog "decision by lookshe loaded" 
