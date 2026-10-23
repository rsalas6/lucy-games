# Recorta las hojas de Codex: quita el fondo magenta, separa cada dibujo y lo guarda como WebP con transparencia.
# Los personajes se arman en una hoja uniforme de 3 columnas x 4 filas (abajo, izquierda, derecha, arriba).
import numpy as np, os
from PIL import Image
HERE = os.path.dirname(os.path.abspath(__file__)); SRC = os.path.join(HERE, 'gen'); OUT = os.path.join(HERE, '..', 'img', 'bakery')

def key(path):
    a = np.array(Image.open(path).convert('RGBA')).astype(np.int16)
    r, g, b = a[..., 0], a[..., 1], a[..., 2]; mag = np.minimum(r, b) - g
    alpha = np.where(mag > 110, 0, 255).astype(np.int16)
    t = alpha == 0; near = np.zeros_like(t); near[1:] |= t[:-1]; near[:-1] |= t[1:]; near[:, 1:] |= t[:, :-1]; near[:, :-1] |= t[:, 1:]
    alpha[(mag > 45) & near] = 0; a[..., 3] = alpha
    return a.astype(np.uint8)

def spans(m, gap, mn):
    out, s, g = [], None, 0
    for i, v in enumerate(m):
        if v:
            if s is None: s = i
            g = 0; e = i
        elif s is not None:
            g += 1
            if g >= gap: (out.append((s, e + 1)) if e + 1 - s >= mn else None); s = None
    if s is not None and e + 1 - s >= mn: out.append((s, e + 1))
    return out

def cut(name, gap=8, mn=20):
    a = key(os.path.join(SRC, name + '.png')); op = a[..., 3] > 0; res = []
    for y0, y1 in spans(op.any(axis=1), gap, mn):
        row = []
        for x0, x1 in spans(op[y0:y1].any(axis=0), gap, mn):
            sub = op[y0:y1, x0:x1]; ys = np.where(sub.any(axis=1))[0]
            row.append(a[y0 + ys[0]:y0 + ys[-1] + 1, x0:x1])
        res.append(row)
    return res

def save(arr, name, h):
    im = Image.fromarray(arr)
    if im.height > h: im = im.resize((round(im.width * h / im.height), h), Image.LANCZOS)
    im.save(os.path.join(OUT, name + '.webp'), quality=92)

def charsheet(name, out, cell_h=150):
    rows = cut(name)
    rows = [r for r in rows if len(r) >= 3][:4]
    assert len(rows) == 4, (name, [len(r) for r in rows])
    fr = [r[:3] for r in rows]
    W = max(s.shape[1] for r in fr for s in r); H = max(s.shape[0] for r in fr for s in r)
    sheet = np.zeros((H * 4, W * 3, 4), np.uint8)
    for j, r in enumerate(fr):
        for i, s in enumerate(r):
            y = j * H + (H - s.shape[0]); x = i * W + (W - s.shape[1]) // 2; sheet[y:y + s.shape[0], x:x + s.shape[1]] = s
    im = Image.fromarray(sheet); k = cell_h / H; im = im.resize((round(im.width * k), round(im.height * k)), Image.LANCZOS)
    im.save(os.path.join(OUT, out + '.webp'), quality=92); print(out, im.size)

def flat(name):
    return [s for r in cut(name) for s in r]

for n in ['lucy', 'npc-a', 'npc-b', 'npc-c', 'npc-d', 'baker', 'cashier', 'helper']: charsheet(n, 'ch-' + n)
b = flat('buildings-a'); print('bld-a', len(b)); [save(s, n, 420) for s, n in zip(b, ['b-bakery', 'b-barn', 'b-mill'])]
b = flat('buildings-b'); print('bld-b', len(b)); [save(s, n, 380) for s, n in zip(b, ['b-fruit', 'b-choco', 'b-grocery'])]
b = flat('houses'); print('houses', len(b)); [save(s, 'house-%d' % (i + 1), 300) for i, s in enumerate(b[:4])]
p = flat('props'); print('props', len(p)); [save(s, n, 260) for s, n in zip(p, ['p-tree', 'p-pine', 'p-berry', 'p-appletree', 'p-flowers', 'p-fountain', 'p-bench', 'p-lamp', 'p-fence', 'p-mailbox', 'p-hen', 'p-cow'])]
f = flat('furniture'); print('furniture', len(f)); [save(s, n, 260) for s, n in zip(f, ['f-oven1', 'f-oven2', 'f-mixer', 'f-vitrina', 'f-counter', 'f-table', 'f-plant', 'f-shelf'])]
d = flat('decor'); print('decor', len(d)); [save(s, n, 240) for s, n in zip(d, ['d-rug', 'd-painting', 'd-clock', 'd-lamp', 'd-balloons', 'd-window', 'd-menuboard', 'd-vase'])]
i = flat('ingredients'); print('ing', len(i)); [save(s, 'ing-' + n, 160) for s, n in zip(i, ['egg', 'milk', 'butter', 'flour', 'sugar', 'strawberry', 'apple', 'lemon', 'choco', 'vanilla', 'sprinkles', 'cream'])]
d = flat('desserts'); print('des', len(d)); [save(s, 'des-' + n, 180) for s, n in zip(d, ['cookie', 'cupcake', 'donut', 'applepie', 'strawcake', 'brownie', 'macaron', 'croissant', 'chococake', 'lemonpie', 'creamhorn', 'bdaycake'])]
