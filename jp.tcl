############################################### 
######## 
####### 
######   join us pt.PTchat.org 
#####     add joinpart.tcl to eggrop .conf file 
####       !Join #Channel 
###         !Part #Channel 
## 
# 

bind pub n|n !join pub:join 
bind pub n|n !part pub:part 

### BOTNET begin 
bind BOT - bjoin bjoin 
bind BOT - bpart bpart 

proc bjoin {from key arg} { 

   if {![validchan [lindex [split $arg] 0]]} { 
      channel add [lindex [split $arg] 0] 
   } 
} 

proc bpart {from key arg} { 

   if {[validchan [lindex [split $arg] 0]]} { 
      channel remove [lindex [split $arg] 0] 
   } 
} 

### botnet end 

proc pub:join {nick host hand chan text} { 
   set newchan [lindex [split $text] 0] 
   if {$newchan == ""} { 
      puthelp "NOTICE $nick :No Channel Given." 
      return 0 
   } 
   putallbots "bjoin $newchan" 
   if {![validchan "$newchan"]} { 
      channel add $newchan 
      return 1 
   } else { 
      puthelp "NOTICE $nick :I'm already on that channel" 
      return 0 
   } 
} 

proc pub:part {nick host hand chan text} { 
   set oldchan [lindex [split $text] 0] 
   if {$oldchan == ""} { 
      puthelp "NOTICE $nick :Please give a channel name." 
      return 0 
   } 
   putallbots "bpart $oldchan" 
   if {[validchan "$oldchan"]} { 
      channel remove $oldchan 
      return 1 
   } else { 
      puthelp "NOTICE $nick :I'm not on \002$oldchan\002" 
      return 0 
   } 
} 

putlog "JoinPartChan by duarteper - Loaded!" 
