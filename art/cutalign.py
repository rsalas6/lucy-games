# Recorta hojas de caminar alineando cada cuadro por el centro de la cabeza/torso (no por el contorno), para que no se mueva de lado a lado
import os, sys, numpy as np
from PIL import Image
HERE=os.path.dirname(os.path.abspath(__file__))
src=open(os.path.join(HERE,'cut.py')).read(); src=src[:src.index('for n in [')]; exec(src)
def aligned(name, out, cell_h=150):
    rows=[r for r in cut(name) if len(r)>=3][:4]; assert len(rows)==4,(name,[len(r) for r in rows])
    fr=[r[:3] for r in rows]
    # ¿Hacia dónde mira cada cuadro? La piel de la cara queda del lado al que mira
    def facing(s):
        a=s.astype(int); h=a.shape[0]; reg=a[:int(h*.4)]; op=reg[...,3]>0
        r,g,b=reg[...,0],reg[...,1],reg[...,2]; skin=op&(r>200)&(g>140)&(b>100)&(r>g)&(g>b)&(r-b>40)
        ys,xs=np.where(op); ys2,xs2=np.where(skin)
        if len(xs2)<8: return 0
        return -1 if xs2.mean()<xs.mean()-1 else (1 if xs2.mean()>xs.mean()+1 else 0)
    L0,R0=fr[1],fr[2]; fl=[facing(x) for x in L0]; frr=[facing(x) for x in R0]
    newL,newR=[],[]
    for i in range(3):
        if fl[i]==-1: newL.append(L0[i])
        elif frr[i]==1: newL.append(R0[i][:,::-1].copy())
        else: newL.append(L0[i][:,::-1].copy() if fl[i]==1 else L0[i])
        if frr[i]==1: newR.append(R0[i])
        elif fl[i]==-1: newR.append(L0[i][:,::-1].copy())
        else: newR.append(R0[i][:,::-1].copy() if frr[i]==-1 else R0[i])
    print(name,'mira izq:',fl,'mira der:',frr)
    fr[1],fr[2]=newL,newR
    def cx(s):
        a=s[...,3]>0; h=a.shape[0]; top=a[int(h*.08):int(h*.32)]; ys,xs=np.where(top); return xs.mean()
    H=max(s.shape[0] for r in fr for s in r)
    cents=[[cx(s) for s in r] for r in fr]
    L=max(c for r in cents for c in r); R=max(s.shape[1]-c for r,cr in zip(fr,cents) for s,c in zip(r,cr))
    W=int(np.ceil(L+R))+2
    sheet=np.zeros((H*4,W*3,4),np.uint8)
    for j,(r,cr) in enumerate(zip(fr,cents)):
        for i,(s,c) in enumerate(zip(r,cr)):
            y=j*H+(H-s.shape[0]); x=i*W+int(round(L-c))+1; sheet[y:y+s.shape[0],x:x+s.shape[1]]=np.maximum(sheet[y:y+s.shape[0],x:x+s.shape[1]],s)
    im=Image.fromarray(sheet); k=cell_h/H; im=im.resize((round(im.width*k),round(im.height*k)),Image.LANCZOS)
    im.save(os.path.join(OUT,out+'.webp'),quality=92); print(out,im.size)
for a in sys.argv[1:]:
    n,o=a.split(':'); aligned(n,o)
