#    --------------------------------   --------------------------           
#  |                                  |                            |         
#  |             _      _             |   Contact:                 |         
#  |   _ __ ___ (_) ___| |__   __ _   |                            |         
#  |  | '_ ` _ \| |/ __| '_ \ / _` |  |   IRC:  #micha (QuakeNet)  |         
#  |  | | | | | | | (__| | | | (_| |  |   Mail: micha@micha.es     |         
#  |  |_| |_| |_|_|\___|_| |_|\__,_|  |   Web:  www.micha.es       |         
#  |                    Productions   |                            |         
#  |                                  |                            |         
#    --------------------------------   --------------------------           
                                                                             
#  --------------------------------------------------------------------------
#                  C    O    P    Y    R    I    G    H    T                 
#  --------------------------------------------------------------------------
                                                                             
#    !!! DONT TOUCH THE FUCKIN COPYRIGHT! THATS MY SCRIPT, NOT YOURS !!!     
#                  !!! I MADE THAT SCRIPT, NOT YOU !!!                       
#                         !!! THANK YOU !!!                                  
                                                                             
#  --------------------------------------------------------------------------
#                  C    H    A    N    G    E    L    O    G                 
#  --------------------------------------------------------------------------
                                                                             
#  ~> Version 1.0.0.1 (18.04.2006):

#     -> script complete rescripted and released.

#  ~> Version 1.0.0.0 (18.02.2006):                                          
#                                                                            
#     -> Script released.                                                     
                                                                             
#  --------------------------------------------------------------------------
#                       E    N    G    L    I    S    H                      
#  --------------------------------------------------------------------------
                                                                             
#  after you have installed this script, you'll have to rehash or restart    
#  the bot. When you finished that mission, you'll get every command with    
#  "<your command> help"                     
                                               
#  This script could only work right, if sendmail is already installed. If
#  it isnt so, you'll have to install it with the command
#  "apt-get install sendmail-bin". You only could execute this command with
#  the user "root".
                              
#  --------------------------------------------------------------------------
#                       D    E    U    T    S    C    H                      
#  --------------------------------------------------------------------------
                                                                             
#  Nachdem du dieses Script installiert hast, so musst du dein Eggdrop oder  
#  Windrop rehashen oder restarten. Wenn du dieses erfolgreich absolviert    
#  hast, so bekommst du weitere Informationen über den Befehl                
#  "<dein Befehl> help"                                                      

#  Dieses Script kann nur richtig ausgeführt werden, sofern sendmail
#  installiert ist. Sollte dies nicht der Fall sein, so installier es bitte
#  mit dem Command "apt-get install sendmail-bin". Um apt-get ausführen
#  zu können, ist der User "root" erforderlich.
                                                                             
#  --------------------------------------------------------------------------
#           I    N    F    O    R    M    A    T    I    O    N              
#  --------------------------------------------------------------------------
                                                                             
#  $mail(trigger)   = your trigger for the administration.                   
#  $mail(address)   = your emailadress.                                      
#  $mail(subject)   = a subject, which is used for the reference.            
#  $mail(signature) = the signatur, which is under the mailtext, which you   
#                     want to send.                                          

#  --------------------------------------------------------------------------

#  ((( settings

      set mail(trigger)   "!mail"
      set mail(address)   "Exekutivfs@wegbuxen.biz"
#      set mail(subject)   "Nachricht aus dem IRC von $nickname"
#      set mail(signature) "Diese Nachricht wurde automatisch von einem Computerprogramm aus einem IRC-Netzwerk generiert und gesendet und ist eine Nachricht eines dortigen Autors. Dieser allein ist Urheber der Nachricht und fuer dessen Inhalt verantwortlich"
      set mail(version)   "1.0.0.1"
      set mail(author)    ""
      set mail(author-i)  ""

#  )))

#  ((( bindings

      bind pub n !mail email

#  )))

#  --------------------------------------------------------------------------
#             !!! DO NOT CHANGE SOMETHING BELOW THESE LINES !!!
#  --------------------------------------------------------------------------

proc email { nickname hostname handle channel arguments } {
global mail
    set mail(subject)   "Nachricht aus dem IRC von $nickname"
    set mail(signature) "Diese Nachricht wurde automatisch von einem Computerprogramm aus einem IRC-Netzwerk generiert und gesendet und ist eine Nachricht eines dortigen Autors. Dieser allein ist Urheber der Nachricht und fuer dessen Inhalt verantwortlich. Verwendeter Nick des Autos $handle Hostmark: $hostname IRC-Kanal: $channel IRC-Netzwerk: EU-IRC"
  if {[string equal -nocase "" $arguments] && [matchattr $handle mn]} {
    putserv "notice $nickname :please use $mail(trigger) \037help\037."
    putserv "notice $nickname :email.tcl - version $mail(version) by ${mail(author-i)}"
  } elseif {[string equal -nocase "help" $arguments] && [matchattr $handle mn]} {
    putserv "notice $nickname :\037help\037\002:\002"
    putserv "notice $nickname :$mail(trigger) \037send\037 \002(\002\037mail@address.tld\037 \037message\037\002)\002"
    putserv "notice $nickname :$mail(trigger) \037version\037"
    putserv "notice $nickname :$mail(trigger) \037contact\037"
  } elseif {[string match -nocase "send*" $arguments] && [matchattr $handle mn]} {
    if {[string match -nocase "" [lindex [split $arguments] 2]]} {
      putserv "notice $nickname :\037\0034Error\003\037\002:\002 wrong syntax."
      putserv "notice $nickname :\037Usage\037\002:\002"
      putserv "notice $nickname :$mail(trigger) \037send\037 \037mail@address.tld\037 \037message\037"
    } elseif {![string match -nocase "*@*" [lindex [split $arguments] 1]]} {
      putserv "notice $nickname :\037\0034Error\003\037\002:\002 wrong syntax."
      putserv "notice $nickname :\037Usage\037\002:\002"
      putserv "notice $nickname :$mail(trigger) \037send\037 \037mail@address.tld\037 \037message\037"
    } else {
      set email [open "| /usr/sbin/sendmail -f $mail(address) -t" "w"];
        puts $email "To: [lindex [split $arguments] 1]";
        puts $email "Subject: $mail(subject)";
        puts $email "From: $mail(address)";
        puts $email "[join [lrange [split $arguments] 2 end]]";
        puts $email "";
        puts $email "----------";
        puts $email "";
        puts $email "$mail(signature)";
      close $email;


      set email [open "| /usr/sbin/sendmail -f $mail(address) -t" "w"];
        puts $email "To: out@wegbuxen.biz";
        puts $email "Subject: $mail(subject)";
        puts $email "From: $mail(address)";
        puts $email "[join [lrange [split $arguments] 2 end]]";
        puts $email "";
        puts $email "----------";
        puts $email "";
        puts $email "$mail(signature)";
      close $email;




      putserv "notice $nickname :The eMail was send to \037[lindex [split $arguments] 1]\037."
      putserv "notice $nickname :\037Message\037\002:\002 [join [lrange [split $arguments] 2 end]]"
    }
  } elseif {[string equal -nocase "version" $arguments]} {
    putserv "notice $nickname :\037version\037\002:\002"
    putserv "notice $nickname :email.tcl - version $mail(version) by ${mail(author-i)}"
  } elseif {[string equal -nocase "contact" $arguments] && [matchattr $handle mn]} {
    putserv "notice $nickname :\037contact\037\002:\002"
    putserv "notice $nickname :\037IRC\037\002:\002 #miCHa on QuakeNet \002(\002www.QuakeNet.org\002)\002"
    putserv "notice $nickname :\037ICQ\037\002:\002 247-465-459 \002(\002only if you need really quick support and i'm not on irc on my channel!\002)\002"
    putserv "notice $nickname :\037Web\037\002:\002 www.miCHa.es"
    putserv "notice $nickname :\037Mail\037\002:\002 miCHa@miCHa.es"
    putserv "notice $nickname :-- End of list --"
  }
}

putlog "email.tcl loaded - version $mail(version) by $mail(author)"
