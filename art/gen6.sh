#!/bin/zsh
cd "$(dirname "$0")"
D="$(pwd)/gen"
S="ESTILO: pixel art de videojuego estilo Pokémon Esmeralda (Game Boy Advance) pero en alta resolución, colores brillantes, apetitosos y tiernos, contornos oscuros limpios. SIN texto, SIN letras, SIN números, SIN marcas de agua."
KEY="El FONDO debe ser magenta puro liso (#FF00FF) en toda la imagen, sin sombras en el fondo; cada objeto bien separado con mucho espacio magenta alrededor. No uses magenta dentro de los dibujos."
run(){ name=$1; shift; (codex exec --dangerously-bypass-approvals-and-sandbox --skip-git-repo-check "Usa tu herramienta de generación de imágenes. $* Al final imprime NOMBRE => RUTA COMPLETA de cada imagen generada (aunque no hayas podido copiarla)." < /dev/null > log6-$name.txt 2>&1; echo "DONE $name $?") & }
run des2 "$S $KEY Crea desserts2.png (imagen ancha 16:9) en $D/ con EXACTAMENTE 8 postres en 2 filas de 4, cada uno del mismo tamaño y como ícono de juego: concha mexicana de vainilla, churros con azúcar y canela en su bolsita, flan con caramelo, gelatina de fresa de tres capas, pastel de tres leches con fresa encima, galletas con forma de carita de gatito, donas de chocolate con chispas, pastel especial decorado con las caritas de un gatito negro y un gatito blanco con manchas cafés."
run toys "$S $KEY Crea cattoys.png (imagen ancha 16:9) en $D/ con EXACTAMENTE 4 objetos en UNA fila, vistos desde arriba en 3/4 como muebles de Pokémon: bolita de estambre rosa, ratoncito de juguete gris con cuerda, túnel de tela para gatos morado, castillito de cartón para gatos."
wait
echo ALLDONE
