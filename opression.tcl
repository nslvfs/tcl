#written 2014 by vfs - public domain
#you can not contact me
set floodprot "false"

bind pub - !aeg privileg
bind pub - !siemens privileg
bind pub - !bauknecht privileg
bind pub - !miele privileg
bind pub - !bosch privileg
bind pub - !privileg privileg
proc privileg {nick host handle chan arg} {
	global floodprot
	if { $floodprot == "false" } {
		
		if { [lindex $arg 0] != "" && $nick == "vfs"} {
			set ziel [lindex $arg 0]
		} else {
			set ziel $nick
		}
		set lheight {hochgewachsene*r kurzgewachsene*r "durschnittlich gewachsene*r" zwergenwuchshaftige*r}
		set lheightc [expr [llength $lheight] -1]
		set lrand "[rand $lheightc]"
		set height "[lindex $lheight $lrand], "
		set lrand "[rand 2]"
		if { $lrand == 0 } {
			set height ""
		}	
	
		set lstatus {"durchschnittlich verdienende*r" obdachlose*r "gut verdienende*r" reiche*r arme*r "super reiche*r"}
		set lstatusc [expr [llength $lstatus] -1]
		set lrand "[rand $lstatusc]"
		set status "[lindex $lstatus $lrand], "
		set lrand "[rand 2]"
		if { $lrand == 0 } {
			set status ""
		}		

		set lsexo {heterosexuelle*r asexuelle*r homokriminelle*r bisexuelle*r pansexuelle*r zoophile*r pÃ¤dophile*r}
		set lsexoc [expr [llength $lsexo] -1]
		set lrand "[rand $lsexoc]"
		set sexo "[lindex $lsexo $lrand], "
		set lrand "[rand 2]"
		if { $lrand == 0 } {
			set sexo ""
		}
		
		set lethnic {"latein amerikanische*r" asiatische*r negroide*r arabische*r kaukasische*r indianische*r inuitische*r aldebaranische*r reptiloidische*r arische*r jÃ¼dische*r semitische*r}
		set lethnicc [expr [llength $lethnic] -1]
		set lrand "[rand $lethnicc]"
		set ethnic "[lindex $lethnic $lrand], "
		set lrand "[rand 2]"
		if { $lrand == 0 } {
			set ethnic ""
		}

		set loffspring {Israel Deutschland "deutschem Reich" Japan SÃ¼deuropa "mittlerem Osten" Osteuropa Afrika Lateinamerika Mitteleuropa Indien Skandinavien KÃ¼sten-China "Vereinigten Staaten" Kanada Zentralchina Ozeanien}
		set loffspringc [expr [llength $loffspring] -1]
		set lrand "[rand $loffspringc]"
		set offspring "aus [lindex $loffspring $lrand] kommende*r "
		set lrand "[rand 2]"
		if { $lrand == 0 } {
			set offspring ""
		}
		
		set lsex {CIS-Mann CIS-Frau Transmann Transfrau "genderqueerer Mensch"}
		set lsexc [expr [llength $lsex] -1]
		set lrand "[rand $lsexc]"
		set sex "[lindex $lsex $lrand]."


		set age "Du bist [rand 65] Jahre alt. "
		set lrand "[rand 10]"
		if { $lrand <= 1 } {
			set age ""
		}		
		
		set hmatesr [rand 7]
		
		if { $hmatesr == 0 } {
			set hmates "Du hast keine Headmates. "
		} elseif { $hmatesr == 6 } {
			set hmates "Du hast mehr als 6 headmates. "
		} else {
			set hmates "Du hast $hmatesr Headmate(s). "
		}
		set lrand "[rand 2]"
		if { $lrand == 0 } {
			set hmates ""
		}		
				
	

		set ljob {Wissenschaftler*in Arbeitslose*r Neet Mediziner*in Elektroniker*in Lehrer*in Beamte*r "Investmentbänker*in" Ingenieur*in EinzelhÃ¤ndler*in}
		set ljobc [expr [llength $ljob] -1]
		set lrand "[rand $ljobc]"
		set job "Dein Beruf ist [lindex $ljob $lrand]. "
		set lrand "[rand 2]"
		if { $lrand == 0 } {
			set job ""
		}			
		

		set lkinship {Reptiliekin Demonkin Werekin Otherkin Mammalkin Birdkin Humankin Dragonkin Hobbitkin Transethniker*in Transloli Transtrisomieker*in Tranadult}
		set lkinshipc [expr [llength $lkinship] -1]
		set lrand "[rand $lkinshipc]"
		set kinship "Du bist ein [lindex $lkinship $lrand]. "
		set lrand "[rand 2]"
		if { $lrand == 0 } {
			set kineship ""
		}

		set lable {adipÃ¶s Ã¼bergewichtig "sehr attraktiv" "optisch benachteiligt" "ein Gesichtselfmeter" "durschnittlich Attraktiv" "von Akne Betroffende*r" "intellektuell Herrausgeforderte*r" "chronisch Krank" Rollstuhlfahrer*in Autist*in blind geisteskrank taub gesund "Down-Syndrom geschÃ¤digt"}
		set lablec [expr [llength $lable] -1]
		set lrand "[rand $lablec]"
		set able "Du bist [lindex $lable $lrand]. "
		set lrand "[rand 2]"
		if { $lrand == 0 } {
			set able ""
		}		

		set lreligion {Judx AussenseiterreligionsanhÃ¤ngx Buddhist*in Hinduist*im Evangelikale*r "AnhÃ¤nger*in der Kirche der Orthodoxie" Prostestant*in Katholik*in Muslim*in Sikh*in Atheist*in Agnostiker*in Satanist*in "Zeugx Jehova" "Neu Heidx"}
		set lreligionc [expr [llength $lreligion] -1]
		set lrand "[rand $lreligionc]"
		set religion "Du bist glaubenstechnisch ein*e [lindex $lreligion $lrand]."
		set lrand "[rand 2]"
		if { $lrand == 0 } {
			set religion ""
		}
		set temp "$height$status$sexo$ethnic$offspring$sex $age$job$able$kinship$hmates$religion"
		
		set message [string map -nocase {", CIS"      " CIS" 		  ", Trans"      " Trans" 		  ", gender"      " gender" 		} $temp]
			
		putserv "PRIVMSG $chan :$ziel: Du bist ein*e $message"
		set floodprot "true"
		utimer 5 resetthefloodprot
	} else {
		puthelp "NOTICE $nick :NA NA NA!"
 }
 
}

proc resetthefloodprot {} {
	global floodprot
	set floodprot "false"
}



