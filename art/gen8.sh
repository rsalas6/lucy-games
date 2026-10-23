#!/bin/zsh
cd "$(dirname "$0")"
D="$(pwd)/gen"
S="ESTILO: pixel art de videojuego estilo Pokémon Esmeralda (Game Boy Advance) pero en alta resolución, colores pastel brillantes, apetitosos y tiernos, contornos oscuros limpios. SIN texto, SIN letras, SIN números, SIN marcas de agua."
KEY="El FONDO debe ser magenta puro liso (#FF00FF) en toda la imagen, sin sombras en el fondo; cada objeto bien separado con mucho espacio magenta alrededor. No uses magenta dentro de los dibujos."
run(){ name=$1; shift; (codex exec --dangerously-bypass-approvals-and-sandbox --skip-git-repo-check "Usa tu herramienta de generación de imágenes. $* Al final imprime NOMBRE => RUTA COMPLETA de cada imagen generada (aunque no hayas podido copiarla)." < /dev/null > log8-$name.txt 2>&1; echo "DONE $name $?") & }
run m2 "$S $KEY Crea machines2.png (imagen ancha 16:9) en $D/ con EXACTAMENTE 3 máquinas en UNA fila, vistas desde arriba en 3/4 como muebles de interior de Pokémon, del mismo tamaño: 1) máquina de helados de mostrador rosa con tres palancas y conos, 2) fuente de chocolate de tres pisos con chocolate cayendo y fresas en un plato, 3) carrito de algodón de azúcar con nube rosa y azul."
run t2 "$S $KEY Crea treats.png (imagen ancha 16:9) en $D/ con EXACTAMENTE 5 postres en UNA fila, del mismo tamaño, como íconos de juego: 1) cono de helado de fresa, 2) copa de helado de chocolate con cereza, 3) paleta de hielo de limón, 4) brocheta de fresas cubiertas de chocolate, 5) algodón de azúcar rosa y azul en su palito."
wait
echo ALLDONE
