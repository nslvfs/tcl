###Original Script:
### BOFH
### Updated to 29/03/2002
### by Progeny <progeny@azzurra.org>
### AzzurraNet - #EggHelp (TCL & Eggdrop)
### Changes made by vfs 04/2015

set seel {
{Im Übrigen ist die Hackerszene meine Szene.}
{Nein, ich will das nicht, habe ich gesagt, Lass das, ich will nicht. Doch er hörte nicht auf.}
{Mir wurde also unterstellt, ich würde mich nicht frauengerecht verhalten. Ich hätte das schlucken können – konnte aber nicht mehr. So gab ich meine Festanstellung bei der taz auf.}
{Im Übrigen habe ich auch schon einmal einen Vergewaltigungsvorwurf erhoben. Erst nachdem ich mich kürzlich länger mit solchen Debatten befasste, habe ich mich bei dem armen Mann entschuldigt. Das war nämlich ganz schön unfair von mir.}
{Wer es etwas härter mag, kann sich auch in der BDSM-Community Fetlife eintragen. Besonders sympathisch dort: Die zahlreichen Möglichkeiten, sich eine Geschlechtsidentität zu geben.}
{ah dachte krautchan weiß, wie man Frauen behandelt. Missverständnis.}
{Zeig mich an.}
{hört doch mal auf rumzuheulen. andere sind in beziehungen auch schlimm.}
{Man muss halt alles einmal ausprobieren. Ich fands lehrreich.}
{peiou und ich werden keinen Seks haben. Ist doch albern, lasst mal sowas.}
{Weil manche in „euren Kreisen“ mich als die härteste Feministin überhaupt sehen, kontere ich diesen Bullshit voller Freude mit „Schwanz ab!“.}
{Die Menschen in Bonn sind verrückt. Obwohl es regnet, bummeln sie weiter und kaufen ein. Ich mache mir keine Sorgen um die Wirtschaft hier.}
{Fefe ist halt ein misogynes Arschloch.}
{Postcolonial korrekt heißt es nicht "Indianer". Möse zunähen war u.a. auch de Sades Idee.}
{Als ich im Jahr 1998 Internet bekam, suchte ich mit Altavista und Yahoo, und meist gab es ähnliche Ergebnisse. Las und schrieb das Judo-Forum voll.}
{Im Grunde sollte Snowden einen ja gar nicht so aufregen, man sieht, dass man im Grunde die Gespräche mit den Drogendealern auch in Klar-Sprache hätte führen können, aber weil alle Freunde aufgeregt und resigniert sind, bin ich es auch.}
{Im Endeffekt war es einfach eine schlaue Diffamierung. Er hätte auch sagen können, die Frau ist dumm, hässlich, opportunistisch oder kann sich nicht anziehen.}
{Sicherlich wird es irgendwann auch möglich sein, körperlichen Sex über das Netz zu machen.}
{Meine WG ist meine Familie, ich liebe mehr Menschen als nur meinen Freund.}
{Weder Sadomasochismus noch Promiskuität sind in Deutschland strafbar – zum Glück.}
{Wenn die Frau "Ja" sagte und "Nein" meinte, ist das auch noch keine Vergewaltigung, so sehr Beziehungen mit ungleich verteilter Macht zu kritisieren sind.}
{Eine absolute Gleichstellung aller Lebensgemeinschaftsformen. Ob sie nun hetero- oder homosexuell sind oder ob sie zwei oder mehr Menschen umfassen, darf nicht von Bedeutung sein!}
{Für mich stehen die Grünen nicht nur für eine bestimmte Haltung, sondern auch für ein Lebensgefühl. Ich finde es gut, wenn wir mit Aktionen auf die Straße gehen, feiern und ein bisschen flippig auftreten. Damit strahlen wir Lebensfreude aus.}
{Und wo bleibt das Tempolimit auf deutschen Autobahnen?}
{Ich würde Pragmatismus nicht grundsätzlich verurteilen - es kommt immer auf die Sache an.}
{Ich recherchierte, bis mein Sack leer war…}
{Checkt eure Privilegien. Wer hat denn das Privileg, ermutigt zu werden, als Kind mit Technik zu spielen, so dass man als Erwachsener dann hier zu diesem Kongress fahren kann?}
{Immer dieselben gleichen einfühlsamen Typen, sich mit denen im Kreis zu wichsen, das bringt es doch auch nicht}
{Außer Masturbationshäufigkeit, Leistung beim Weitwurf und Bereitschaft zum schnellen Sex korrelliert nichts mit Geschlecht.}
{Außerdem hänge ich seit vielen Jahren mit Hackern rum, ich nutze Debian-Linux auf meinen Laptops und man muss mich zu einem iPad zwingen.}
{Ficken konnte Beckedahl mich dafür immer, auch mal, als ich Nein sagte}
{Das suckt so sehr. Dieses ständige Scheitern, viele kleine Scheiterns, das macht mutlos.}
{Ich werfe niemand Vergewaltigung vor.}
{Ich wurde klein in der Beziehung, die zu lange andauerte. Ich dachte, dass ich keinen guten Musikgeschmack habe, dass keine gute Partnerin bin, keine gute Politikerin, nicht intelligent genug.}
{Die meisten Menschen sehen Sexismus nicht und haben auch keine Lust, sich den ganzen Tag damit zu befassen.}
{Schlecht in Netzpolitik since 2003, das muss man als intelligenter Mensch erstmal schaffen.}
{Die Piratenpartei hat ein Problem mit ihren Spinnern, sie hat ein Problem mit der klaren Abgrenzung zu Nazis, auch wenn ihr das im Moment nicht bewusst sein mag.}
{Ich will überhaupt nicht ein gesellschaftliches Klima, in dem sich Vergewaltigungsopfer nicht mehr trauen, sich zu äußern.}
{Was es so bringen kann, mal ein wenig an einem Ort herumzuhängen! Ich zum Beispiel hänge gern in einem bestimmten IRC-Channel herum, wo den ganzen Tag gelabert wird.}
{So ist das – wenn man älter wird, macht die Jugend nicht mehr, was man selbst toll findet, sondern irgendwelche anderen Dinge, die man selbst – im schlimmsten Falle – “total hirnrissig” und “peinlich” findet.}
}

bind pub - !seeliger pub:seeliger

proc pub:seeliger {nick uhost handle channel arg} {
global seel 
set excuse [lindex $seel [rand [llength $seel]]]
putserv "PRIVMSG $channel :$nick: Julia Seeliger sagt: \"$excuse\""
}


