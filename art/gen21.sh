#!/bin/zsh
cd "$(dirname "$0")"
D="$(pwd)/gen"
S="ESTILO: pixel art de videojuego estilo Pokémon Esmeralda (Game Boy Advance) pero en alta resolución, vista desde arriba en 3/4 como los pueblos de Pokémon, colores MUY vivos y alegres, contornos oscuros limpios. SIN texto, SIN letras, SIN números, SIN marcas de agua."
KEY="El FONDO debe ser magenta puro liso (#FF00FF) en toda la imagen, sin degradado, sin sombras en el fondo; cada objeto bien separado con mucho espacio magenta alrededor. No uses magenta dentro de los dibujos."
run(){ name=$1; shift; (codex exec --dangerously-bypass-approvals-and-sandbox --skip-git-repo-check "Usa tu herramienta de generación de imágenes. $* Al final imprime NOMBRE => RUTA COMPLETA de cada imagen generada (aunque no hayas podido copiarla)." < /dev/null > log21-$name.txt 2>&1; echo "DONE $name $?") & }
run deco "$S $KEY Crea town-deco.png (imagen ancha 16:9) en $D/ con EXACTAMENTE 8 objetos en 2 filas de 4, cada uno del mismo tamaño: 1) árbol de cerezo grande con flores rosas, 2) árbol de cerezo chico, 3) seto verde recortado redondo, 4) macizo de flores de colores (rojas, amarillas, moradas) con borde de piedritas, 5) árbol de naranjas, 6) palmera chiquita en maceta, 7) fuente de piedra pequeña con agua azul, 8) puesto de globos de colores."
run houses "$S $KEY Crea town-houses.png (imagen ancha 16:9) en $D/ con EXACTAMENTE 4 casas de vecinos en UNA fila, bien separadas, del mismo tamaño, con la puerta al centro abajo y vista de frente igual que en Pokémon: 1) casa de techo AZUL con paredes blancas, 2) casa de techo ROJO con paredes crema, 3) casa de techo VERDE con paredes amarillo pastel, 4) casa de techo MORADO con paredes rosa pastel; todas con ventanas, macetas con flores y un escalón."
wait
echo ALLDONE
