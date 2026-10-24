#!/bin/zsh
cd "$(dirname "$0")"
D="$(pwd)/gen"
S="ESTILO: pixel art de videojuego estilo Pokémon Esmeralda / Pokémon Rojo Fuego (Game Boy Advance), vista desde arriba en 3/4, colores brillantes y alegres, contornos oscuros limpios, píxeles nítidos. SIN texto, SIN letras, SIN números, SIN marcas de agua."
KEY="El FONDO debe ser magenta puro liso (#FF00FF) en toda la imagen, sin degradado, sin sombras en el fondo; cada sprite bien separado de los demás con espacio magenta alrededor. No uses color magenta dentro de los dibujos."
WALK="hoja de sprites para caminar: EXACTAMENTE 4 filas y 3 columnas (12 cuadros del mismo tamaño, alineados en cuadrícula). Fila 1: caminando hacia ABAJO (de frente), fila 2: caminando hacia la IZQUIERDA, fila 3: caminando hacia la DERECHA, fila 4: caminando hacia ARRIBA (de espaldas). En cada fila: columna 1 paso con pie izquierdo, columna 2 parado, columna 3 paso con pie derecho. Personaje chibi pequeño como los entrenadores de Pokémon Esmeralda."
GIRL="La protagonista LUCY: chica PRE-ADOLESCENTE de unos 11 años (no bebé, más alta y estilizada que un niño chico), cabello castaño LARGO y suelto con mechones, mirada segura y tranquila, audífonos blancos alrededor del cuello."
run(){ name=$1; shift; (codex exec --dangerously-bypass-approvals-and-sandbox --skip-git-repo-check "Usa tu herramienta de generación de imágenes. $* Al final imprime NOMBRE => RUTA COMPLETA de cada imagen generada (aunque no hayas podido copiarla)." < /dev/null > log20-$name.txt 2>&1; echo "DONE $name $?") & }
run lucy2 "$S $KEY Crea lucy2.png (CUADRADA 1:1) en $D/: $WALK $GIRL Ropa: sudadera oversize color lila con capucha, un delantal rosa pastel encima con un corazoncito (es pastelera), jeans azules y tenis blancos."
run pijama2 "$S $KEY Crea pijama2.png (CUADRADA 1:1) en $D/: $WALK $GIRL Ropa: pijama de conejito rosa con capucha de orejitas de conejo y pantuflas."
run sirena2 "$S $KEY Crea sirena2.png (CUADRADA 1:1) en $D/: $WALK $GIRL Ropa: disfraz de sirena: blusa de conchitas lila, falda larga turquesa con escamas que termina en aleta, diadema con estrella de mar."
run fresa2 "$S $KEY Crea fresa2.png (CUADRADA 1:1) en $D/: $WALK $GIRL Ropa: vestido rojo de fresa con puntitos blancos, boina verde de hojita, sandalias."
run pintora2 "$S $KEY Crea pintora2.png (CUADRADA 1:1) en $D/: $WALK $GIRL Ropa: overol de mezclilla con manchas de pintura de colores, playera blanca, boina rosa de pintora."
run gatita2 "$S $KEY Crea gatita2.png (CUADRADA 1:1) en $D/: $WALK $GIRL Ropa: sudadera gris con orejitas de gato en la capucha (puesta), falda negra, medias, botitas."
run princesa2 "$S $KEY Crea princesa2.png (CUADRADA 1:1) en $D/: $WALK $GIRL Ropa: vestido largo de princesa rosa con brillos y una tiara dorada."
run leon "$S $KEY Crea leon.png (CUADRADA 1:1) en $D/: $WALK Personaje LEÓN: niño de 2 años, MUY chiquito y cachetón (mucho más bajito que una chica de 11 años), cabello castaño corto despeinado, playera verde con un T-rex, shorts azules y tenis rojos."
run minisius "$S $KEY Crea minisius.png (CUADRADA 1:1) en $D/: $WALK Personaje MINISIUS: bebé de 1 año, el MÁS chiquito de todos (más bajito que un niño de 2 años), cachetón, poquito pelo castaño claro, mameluco azul cielo con estrellitas, chupón, caminando torpe como bebé que apenas aprende a caminar."
wait
echo ALLDONE
