###Original Script:
### BOFH
### Updated to 29/03/2002
### by Progeny <progeny@azzurra.org>
### AzzurraNet - #EggHelp (TCL & Eggdrop)
### Changes made by vfs 04/2015

set seel {
{Im �brigen ist die Hackerszene meine Szene.}
{Nein, ich will das nicht, habe ich gesagt, Lass das, ich will nicht. Doch er h�rte nicht auf.}
{Mir wurde also unterstellt, ich w�rde mich nicht frauengerecht verhalten. Ich h�tte das schlucken k�nnen � konnte aber nicht mehr. So gab ich meine Festanstellung bei der taz auf.}
{Im �brigen habe ich auch schon einmal einen Vergewaltigungsvorwurf erhoben. Erst nachdem ich mich k�rzlich l�nger mit solchen Debatten befasste, habe ich mich bei dem armen Mann entschuldigt. Das war n�mlich ganz sch�n unfair von mir.}
{Wer es etwas h�rter mag, kann sich auch in der BDSM-Community Fetlife eintragen. Besonders sympathisch dort: Die zahlreichen M�glichkeiten, sich eine Geschlechtsidentit�t zu geben.}
{ah dachte krautchan wei�, wie man Frauen behandelt. Missverst�ndnis.}
{Zeig mich an.}
{h�rt doch mal auf rumzuheulen. andere sind in beziehungen auch schlimm.}
{Man muss halt alles einmal ausprobieren. Ich fands lehrreich.}
{peiou und ich werden keinen Seks haben. Ist doch albern, lasst mal sowas.}
{Weil manche in �euren Kreisen� mich als die h�rteste Feministin �berhaupt sehen, kontere ich diesen Bullshit voller Freude mit �Schwanz ab!�.}
{Die Menschen in Bonn sind verr�ckt. Obwohl es regnet, bummeln sie weiter und kaufen ein. Ich mache mir keine Sorgen um die Wirtschaft hier.}
{Fefe ist halt ein misogynes Arschloch.}
{Postcolonial korrekt hei�t es nicht "Indianer". M�se zun�hen war u.a. auch de Sades Idee.}
{Als ich im Jahr 1998 Internet bekam, suchte ich mit Altavista und Yahoo, und meist gab es �hnliche Ergebnisse. Las und schrieb das Judo-Forum voll.}
{Im Grunde sollte Snowden einen ja gar nicht so aufregen, man sieht, dass man im Grunde die Gespr�che mit den Drogendealern auch in Klar-Sprache h�tte f�hren k�nnen, aber weil alle Freunde aufgeregt und resigniert sind, bin ich es auch.}
{Im Endeffekt war es einfach eine schlaue Diffamierung. Er h�tte auch sagen k�nnen, die Frau ist dumm, h�sslich, opportunistisch oder kann sich nicht anziehen.}
{Sicherlich wird es irgendwann auch m�glich sein, k�rperlichen Sex �ber das Netz zu machen.}
{Meine WG ist meine Familie, ich liebe mehr Menschen als nur meinen Freund.}
{Weder Sadomasochismus noch Promiskuit�t sind in Deutschland strafbar � zum Gl�ck.}
{Wenn die Frau "Ja" sagte und "Nein" meinte, ist das auch noch keine Vergewaltigung, so sehr Beziehungen mit ungleich verteilter Macht zu kritisieren sind.}
{Eine absolute Gleichstellung aller Lebensgemeinschaftsformen. Ob sie nun hetero- oder homosexuell sind oder ob sie zwei oder mehr Menschen umfassen, darf nicht von Bedeutung sein!}
{F�r mich stehen die Gr�nen nicht nur f�r eine bestimmte Haltung, sondern auch f�r ein Lebensgef�hl. Ich finde es gut, wenn wir mit Aktionen auf die Stra�e gehen, feiern und ein bisschen flippig auftreten. Damit strahlen wir Lebensfreude aus.}
{Und wo bleibt das Tempolimit auf deutschen Autobahnen?}
{Ich w�rde Pragmatismus nicht grunds�tzlich verurteilen - es kommt immer auf die Sache an.}
{Ich recherchierte, bis mein Sack leer war�}
{Checkt eure Privilegien. Wer hat denn das Privileg, ermutigt zu werden, als Kind mit Technik zu spielen, so dass man als Erwachsener dann hier zu diesem Kongress fahren kann?}
{Immer dieselben gleichen einf�hlsamen Typen, sich mit denen im Kreis zu wichsen, das bringt es doch auch nicht}
{Au�er Masturbationsh�ufigkeit, Leistung beim Weitwurf und Bereitschaft zum schnellen Sex korrelliert nichts mit Geschlecht.}
{Au�erdem h�nge ich seit vielen Jahren mit Hackern rum, ich nutze Debian-Linux auf meinen Laptops und man muss mich zu einem iPad zwingen.}
{Ficken konnte Beckedahl mich daf�r immer, auch mal, als ich Nein sagte}
{Das suckt so sehr. Dieses st�ndige Scheitern, viele kleine Scheiterns, das macht mutlos.}
{Ich werfe niemand Vergewaltigung vor.}
{Ich wurde klein in der Beziehung, die zu lange andauerte. Ich dachte, dass ich keinen guten Musikgeschmack habe, dass keine gute Partnerin bin, keine gute Politikerin, nicht intelligent genug.}
{Die meisten Menschen sehen Sexismus nicht und haben auch keine Lust, sich den ganzen Tag damit zu befassen.}
{Schlecht in Netzpolitik since 2003, das muss man als intelligenter Mensch erstmal schaffen.}
{Die Piratenpartei hat ein Problem mit ihren Spinnern, sie hat ein Problem mit der klaren Abgrenzung zu Nazis, auch wenn ihr das im Moment nicht bewusst sein mag.}
{Ich will �berhaupt nicht ein gesellschaftliches Klima, in dem sich Vergewaltigungsopfer nicht mehr trauen, sich zu �u�ern.}
{Was es so bringen kann, mal ein wenig an einem Ort herumzuh�ngen! Ich zum Beispiel h�nge gern in einem bestimmten IRC-Channel herum, wo den ganzen Tag gelabert wird.}
{So ist das � wenn man �lter wird, macht die Jugend nicht mehr, was man selbst toll findet, sondern irgendwelche anderen Dinge, die man selbst � im schlimmsten Falle � �total hirnrissig� und �peinlich� findet.}
}

bind pub - !seeliger pub:seeliger

proc pub:seeliger {nick uhost handle channel arg} {
global seel 
set excuse [lindex $seel [rand [llength $seel]]]
putserv "PRIVMSG $channel :$nick: Julia Seeliger sagt: \"$excuse\""
}


