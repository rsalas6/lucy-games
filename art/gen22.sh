#!/bin/zsh
cd "$(dirname "$0")"
D="$(pwd)/gen"
S="ESTILO: pixel art de videojuego estilo Pokémon Esmeralda / Pokémon Rojo Fuego (Game Boy Advance), vista desde arriba en 3/4, colores brillantes y alegres, contornos oscuros limpios, píxeles nítidos. SIN texto, SIN letras, SIN números, SIN marcas de agua."
KEY="El FONDO debe ser magenta puro liso (#FF00FF) en toda la imagen, sin degradado, sin sombras en el fondo; cada sprite bien separado de los demás con espacio magenta alrededor. No uses color magenta dentro de los dibujos."
WALK="hoja de sprites para caminar: EXACTAMENTE 4 filas y 3 columnas (12 cuadros del mismo tamaño, alineados en cuadrícula). Fila 1: caminando hacia ABAJO (de frente), fila 2: caminando hacia la IZQUIERDA, fila 3: caminando hacia la DERECHA, fila 4: caminando hacia ARRIBA (de espaldas). En cada fila: columna 1 paso con pie izquierdo, columna 2 parado, columna 3 paso con pie derecho. Personaje chibi pequeño como los entrenadores de Pokémon Esmeralda."
GIRL="La protagonista LUCY: chica PRE-ADOLESCENTE de unos 11 años (no bebé, más alta y estilizada que un niño chico), cabello castaño LARGO y suelto con mechones, mirada segura y tranquila, audífonos blancos alrededor del cuello."
run(){ name=$1; shift; (codex exec --dangerously-bypass-approvals-and-sandbox --skip-git-repo-check "Usa tu herramienta de generación de imágenes. $* Al final imprime NOMBRE => RUTA COMPLETA de cada imagen generada (aunque no hayas podido copiarla)." < /dev/null > log20-$name.txt 2>&1; echo "DONE $name $?") & }
run lucy2 "$S $KEY Crea lucy2.png (CUADRADA 1:1) en $D/: $WALK $GIRL Ropa: sudadera oversize color lila con capucha, un delantal rosa pastel encima con un corazoncito (es pastelera), jeans azules y tenis blancos."
run(){ name=$1; shift; (codex exec --dangerously-bypass-approvals-and-sandbox --skip-git-repo-check "Usa tu herramienta de generación de imágenes. $* Al final imprime NOMBRE => RUTA COMPLETA de cada imagen generada (aunque no hayas podido copiarla)." < /dev/null > log22-$name.txt 2>&1; echo "DONE $name $?") & }
C="Colores MUY vivos y alegres (como los personajes de Pokémon Esmeralda pero más coloridos)."
run c1 "$S $KEY $C Crea cit1.png (CUADRADA 1:1) en $D/: $WALK Una abuelita amable con chongo gris, lentes redondos, suéter morado y falda azul."
run c2 "$S $KEY $C Crea cit2.png (CUADRADA 1:1) en $D/: $WALK Un niño de 8 años con gorra azul al revés, playera amarilla y short verde."
run c3 "$S $KEY $C Crea cit3.png (CUADRADA 1:1) en $D/: $WALK Una niña de 9 años rubia con coletas, vestido verde menta y moño."
run c4 "$S $KEY $C Crea cit4.png (CUADRADA 1:1) en $D/: $WALK Un abuelito con boina café, bigote blanco, chaleco verde y bastón."
run c5 "$S $KEY $C Crea cit5.png (CUADRADA 1:1) en $D/: $WALK Una chica joven de cabello rosa corto, chamarra de mezclilla y falda morada."
run c6 "$S $KEY $C Crea cit6.png (CUADRADA 1:1) en $D/: $WALK Un señor deportista con playera naranja, shorts negros y tenis, cabello negro."
run baker "$S $KEY $C Crea baker2.png (CUADRADA 1:1) en $D/: $WALK Un panadero gordito con gorro de chef alto, bigote y delantal blanco."
run cashier "$S $KEY $C Crea cashier2.png (CUADRADA 1:1) en $D/: $WALK Una cajera joven con cabello negro en coleta, playera rosa y delantal de rayas rosa con blanco."
run helper "$S $KEY $C Crea helper2.png (CUADRADA 1:1) en $D/: $WALK Un repartidor joven con gorra roja, chamarra roja y mochila de entregas."
wait
echo ALLDONE
