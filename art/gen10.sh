#!/bin/zsh
cd "$(dirname "$0")"
D="$(pwd)/gen"
S="ESTILO: pixel art de videojuego estilo Pokémon Esmeralda (Game Boy Advance) pero en alta resolución, vista desde arriba en 3/4 como los muebles de interior de Pokémon, colores pastel brillantes y muy tiernos, contornos oscuros limpios. SIN texto, SIN letras, SIN números, SIN marcas de agua."
KEY="El FONDO debe ser magenta puro liso (#FF00FF) en toda la imagen, sin degradado, sin sombras en el fondo; cada objeto bien separado con mucho espacio magenta alrededor. No uses magenta dentro de los dibujos."
WALK="hoja de sprites para caminar: EXACTAMENTE 4 filas y 3 columnas (12 cuadros del mismo tamaño, alineados en cuadrícula). Fila 1: caminando hacia ABAJO (de frente), fila 2: caminando hacia la IZQUIERDA, fila 3: caminando hacia la DERECHA, fila 4: caminando hacia ARRIBA (de espaldas). En cada fila: columna 1 paso con pie izquierdo, columna 2 parado, columna 3 paso con pie derecho. Personaje chibi cabezón como los entrenadores de Pokémon."
LUCY="La protagonista LUCY: niña tierna de unos 6 años, cabello castaño largo en dos colitas, ojos cafés grandes"
run(){ name=$1; shift; (codex exec --dangerously-bypass-approvals-and-sandbox --skip-git-repo-check "Usa tu herramienta de generación de imágenes. $* Al final imprime NOMBRE => RUTA COMPLETA de cada imagen generada (aunque no hayas podido copiarla)." < /dev/null > log10-$name.txt 2>&1; echo "DONE $name $?") & }
run f4 "$S $KEY Crea furn-d.png (imagen ancha 16:9) en $D/ con EXACTAMENTE 12 muebles en 3 filas de 4, cada uno del mismo tamaño: litera de madera con escalerita, sillón reclinable amarillo, mecedora de madera, acuario redondo con tortuguita, jaula con pajarito azul, caballito mecedor de madera, mesa de té para niñas con tacitas, pizarrón con gis de colores, telescopio, globo terráqueo en su base, lámpara de lava morada, alfombra de arcoíris."
run o5 "$S $KEY Crea lucy-pijama.png (CUADRADA 1:1) en $D/: $WALK $LUCY, con pijama de una pieza de conejito rosa con capucha de orejitas largas y pantuflas de conejito."
run o6 "$S $KEY Crea lucy-sirena.png (CUADRADA 1:1) en $D/: $WALK $LUCY, con disfraz de sirena: falda larga turquesa brillante con escamas, top lila de conchitas, corona de estrella de mar y sandalias plateadas."
wait
echo ALLDONE
