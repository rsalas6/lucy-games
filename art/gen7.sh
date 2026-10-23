#!/bin/zsh
cd "$(dirname "$0")"
codex exec --dangerously-bypass-approvals-and-sandbox --skip-git-repo-check "Usa tu herramienta de generación de imágenes. ESTILO: pixel art de videojuego estilo Pokémon Esmeralda en alta resolución, colores brillantes y tiernos, contornos oscuros limpios, como ícono de objeto de juego. SIN texto, SIN letras. El FONDO debe ser magenta puro liso (#FF00FF), sin sombras. Crea catfood.png CUADRADA (1:1) en $(pwd)/gen/: una bolsa de croquetas para gato rosa con la carita de un gatito dibujada y unas croquetas en forma de pescadito saliendo. Al final imprime NOMBRE => RUTA COMPLETA." < /dev/null > log7.txt 2>&1
echo ALLDONE
