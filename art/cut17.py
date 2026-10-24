import numpy as np, os, sys
from PIL import Image
sys.argv=['x']
HERE=os.path.dirname(os.path.abspath(__file__)); SRC=os.path.join(HERE,'gen'); OUT=os.path.join(HERE,'..','img','bakery')
src=open(os.path.join(HERE,'cut.py')).read(); src=src[:src.index('for n in [')]
exec(src)
def runs(v,gap):
    out=[];s=None;g=0
    for i,x in enumerate(v):
        if x:
            if s is None: s=i
            g=0;e=i
        elif s is not None:
            g+=1
            if g>=gap: out.append((s,e+1)); s=None
    if s is not None: out.append((s,e+1))
    return out
a=key(os.path.join(SRC,'kitchen2.png')); op=a[...,3]>0
rr=runs(op.any(axis=1),2); print('rows',rr)
names=[['k-counter','k-sink','k-stove'],['k-fridge','k-island','k-dining']]
for (y0,y1),row in zip(rr,names):
    cs=runs(op[y0:y1].any(axis=0),12); print(cs)
    for (x0,x1),n in zip(cs,row):
        sub=a[y0:y1,x0:x1]; ys=np.where((sub[...,3]>0).any(axis=1))[0]
        save(sub[ys[0]:ys[-1]+1], 'h-'+n, 300); print(n, sub.shape)
# bowl
b=key(os.path.join(SRC,'mixbowl2.png')); o=b[...,3]>0; ys=np.where(o.any(axis=1))[0]; xs=np.where(o.any(axis=0))[0]
im=Image.fromarray(b[ys[0]:ys[-1]+1, xs[0]:xs[-1]+1]); print('bowl',im.size); im.save(os.path.join(OUT,'mix-bowl2.webp'),quality=92)
for n in ['mixtable-wide','mixtable-tall']:
    im=Image.open(os.path.join(SRC,n+'.png')).convert('RGB'); im.thumbnail((1280,1280)); im.save(os.path.join(OUT,n+'.webp'),quality=86); print(n,im.size)
