##created by vfs - public domain

##############################################
bind pub n !rehash rehash_bot
proc rehash_bot {nik uhost hand chn txt} {
global channel
rehash
putserv "PRIVMSG $chn :Mit Freude und sofort, mein Führer!"
}
################## REHASH ###########################
bind evnt - rehash checkblow
proc checkblow { hash } {
global admin_channel
putserv "PRIVMSG $admin_channel :uiuiui %) REHASH"
}


