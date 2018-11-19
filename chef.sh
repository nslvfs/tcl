#!/bin/bash
#by crucio
RET=`curl -Ls -o /dev/null -w %{url_effective} http://www.chefkoch.de/rezepte/zufallsrezept/`
reg="Kuchen|kuchen|Torte|torte"
 
while [[ "$RET" =~ "$reg" ]]; do
RET=`curl -Ls -o /dev/null -w %{url_effective} http://www.chefkoch.de/rezepte/zufallsrezept/`
done
