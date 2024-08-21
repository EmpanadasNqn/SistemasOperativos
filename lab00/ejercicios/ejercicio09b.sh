ffmpeg -i ../voz.mp3 -i ../musica.mp3 -filter_complex "[0:a]volume=1.0[a1];[1:a]volume=0.5[a2];[a1][a2]amix=inputs=2:duration=longest" El_Rap_de_Fernanfloo.mp3
