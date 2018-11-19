##script by vfs, i dont know anymore if i "ripped" of some other script... public domain
## editet by crucio because chefkoch uses https now
bind pub - !chef pub:chef
proc pub:chef {nick host handle chan arg} {
	set result [exec sh egg/egg/scripts/chef.sh $arg]
	putserv "PRIVMSG $chan :$nick: $result"
 }
