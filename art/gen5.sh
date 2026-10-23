#!/bin/zsh
cd "$(dirname "$0")"
D="$(pwd)/gen"
S="ESTILO: pixel art de videojuego estilo Pokémon Esmeralda / Pokémon Rojo Fuego (Game Boy Advance), vista desde arriba en 3/4, colores brillantes, alegres y tiernos, contornos oscuros limpios, píxeles nítidos. SIN texto, SIN letras, SIN números, SIN marcas de agua."
KEY="El FONDO debe ser magenta puro liso (#FF00FF) en toda la imagen, sin degradado, sin sombras en el fondo; cada sprite bien separado de los demás con espacio magenta alrededor. No uses color magenta dentro de los dibujos."
WALK="hoja de sprites para caminar: EXACTAMENTE 4 filas y 3 columnas (12 cuadros del mismo tamaño, alineados en cuadrícula). Fila 1: caminando hacia ABAJO (de frente), fila 2: caminando hacia la IZQUIERDA, fila 3: caminando hacia la DERECHA, fila 4: caminando hacia ARRIBA (de espaldas). En cada fila: columna 1 paso con pie izquierdo, columna 2 parado, columna 3 paso con pie derecho. Personaje chibi cabezón como los entrenadores de Pokémon."
LUCY="La protagonista LUCY: niña tierna de unos 6 años, cabello castaño largo en dos colitas, ojos cafés grandes"
run(){ name=$1; shift; (codex exec --dangerously-bypass-approvals-and-sandbox --skip-git-repo-check "Usa tu herramienta de generación de imágenes. $* Al final imprime NOMBRE => RUTA COMPLETA de cada imagen generada (aunque no hayas podido copiarla)." < /dev/null > log5-$name.txt 2>&1; echo "DONE $name $?") & }
run o1 "$S $KEY Crea lucy-fresa.png (CUADRADA 1:1) en $D/: $WALK $LUCY, con moños rojos, vestido rojo con estampado de fresas blancas y cuello blanco, calcetas blancas y zapatitos rojos."
run o2 "$S $KEY Crea lucy-gatita.png (CUADRADA 1:1) en $D/: $WALK $LUCY, con diadema de orejitas de gato negras, sudadera negra con carita de gato, falda negra, colita de gato negra y tenis verdes (como su gatita Aceituna)."
run o3 "$S $KEY Crea lucy-princesa.png (CUADRADA 1:1) en $D/: $WALK $LUCY, con una corona dorada chiquita, vestido largo de princesa lila con brillos y zapatillas plateadas."
run o4 "$S $KEY Crea lucy-pintora.png (CUADRADA 1:1) en $D/: $WALK $LUCY, con boina amarilla, overol de mezclilla azul con manchas de pintura de colores, playera de rayas blancas y rojas y tenis blancos."
run bou "$S $KEY Crea boutique.png (imagen ancha 16:9) en $D/ con EXACTAMENTE 1 edificio: una BOUTIQUE de ropa para niñas vista desde arriba en 3/4 estilo pueblo de Pokémon, con techo celeste, toldo rosa con blanco, un escaparate con un vestido rosa en un maniquí y su puerta al frente abajo."
wait
echo ALLDONE
