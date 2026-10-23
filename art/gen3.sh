#!/bin/zsh
cd "$(dirname "$0")"
D="$(pwd)/gen"
S="ESTILO: pixel art de videojuego estilo Pokémon Esmeralda (Game Boy Advance) pero en alta resolución, colores pastel brillantes y tiernos, contornos oscuros limpios. SIN texto, SIN letras, SIN números."
KEY="El FONDO debe ser magenta puro liso (#FF00FF) en toda la imagen, sin sombras en el fondo; cada objeto bien separado con mucho espacio magenta alrededor. No uses magenta dentro de los dibujos."
run(){ name=$1; shift; (codex exec --dangerously-bypass-approvals-and-sandbox --skip-git-repo-check "Usa tu herramienta de generación de imágenes. $* Al final imprime NOMBRE => RUTA COMPLETA de cada imagen generada (aunque no hayas podido copiarla)." < /dev/null > log3-$name.txt 2>&1; echo "DONE $name $?") & }
run mach "$S $KEY Crea machines.png (imagen ancha 16:9) en $D/ con EXACTAMENTE 6 máquinas de pastelería en 2 filas de 3, cada una del mismo tamaño, vistas desde arriba en 3/4 como muebles de interior de Pokémon: 1) batidora industrial grande plateada con tazón gigante, 2) máquina decoradora de pasteles con mangas de betún de colores, 3) cafetera de cafetería roja con tazas, 4) carrito con bandejas dobles para hornear, 5) horno moderno de acero con ventana iluminada, 6) refrigerador rosa con puerta de vidrio lleno de pasteles."
run mix "$S Crea 2 imágenes en $D/: mix-bg.png (16:9): vista de cerca de una mesa de trabajo de madera en una cocina de pastelería tierna, con azulejos pastel al fondo, harina espolvoreada, rodillo y frascos a los lados; el CENTRO de la mesa despejado (ahí irá un tazón). mixtools.png (16:9) con fondo magenta puro liso (#FF00FF) y EXACTAMENTE 3 objetos en una fila, bien separados: 1) tazón grande de cerámica azul cielo VACÍO visto de frente un poco desde arriba (se ve el interior), 2) batidor globo de metal con mango rosa, 3) cuchara de madera."
run harv2 "$S $KEY Crea harvest2.png (imagen ancha 16:9) en $D/ con EXACTAMENTE 3 objetos en una fila: 1) arbusto de fresas verde frondoso con flores blancas y SIN fresas, 2) manzano frondoso SIN manzanas, 3) gallina blanca sentada en su nido de paja."
wait
echo ALLDONE
