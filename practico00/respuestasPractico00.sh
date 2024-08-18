#ejercicio 01
cat /proc/cpuinfo | grep -i 'model name'

#ejercicio 02
cat /proc/cpuinfo | grep -i 'model name' | wc -l

#ejercicio 03
curl -s https://raw.githubusercontent.com/dariomalchiodi/superhero-datascience/master/content/data/heroes.csv | grep -o '^[^;]*;[^;]*' | grep -o '[^;]*$' | grep -i '[^identity]' | tr '[:upper:]' '[:lower:]' | tr -d ' ' | grep -v '^$'

#ejercicio 04a
sort -rnk5,5 ../weather_cordoba.in | head -n 1 | grep -o '^[^ ]* [^ ]* [^ ]*'

#ejercicio 04b
sort -nk6,6 ../weather_cordoba.in | head -n 1 | grep -o '^[^ ]* [^ ]* [^ ]*'

#ejercicio 05
sort -nk3,3 ../atpplayers.in

#ejercicio 06
awk '{ print $0, $7-$8 }' ../superliga.in | sort -rnk2 -rnk9 | awk '{ print $1,$2,$3,$4,$5,$6,$7,$8 }'

#ejercicio 07
ip address | grep -iom1 'ether [0-f]\{2\}:[0-f]\{2\}:[0-f]\{2\}:[0-f]\{2\}:[0-f]\{2\}:[0-f]\{2\}'

#ejercicio 08a
mkdir -p The_Walking_Dead && for i in {01..10}; do touch "The_Walking_Dead/twd_S01E${i}_es.srt"; done

#ejercicio 08b
cd The_Walking_Dead && for i in *.srt; do mv "$i" ${i/_es/}; done && cd ..

#ejercicio 09a
ffmpeg -i ../videoEjercicio9a.mp4 -ss 00:00:02 -t 00:00:07 -c copy videoRecortadoEjercicio9a.mp4

#ejercicio 09b
ffmpeg -i ../voz.mp3 -i ../musica.mp3 -filter_complex "[0:a]volume=1.0[a1];[1:a]volume=0.5[a2];[a1][a2]amix=inputs=2:duration=longest" El_Rap_de_Fernanfloo.mp3
