import os
HERE=os.path.dirname(os.path.abspath(__file__))
src=open(os.path.join(HERE,'cut.py')).read(); src=src[:src.index('for n in [')]; exec(src)
plan={'g-bld-a':(['b-bakery','b-barn'],460),'g-bld-b':(['b-mill','b-fruit'],440),'g-bld-c':(['b-choco','b-grocery'],420),'g-bld-d':(['b-boutique','b-furniture'],420),
 'g-homes-a':(['b-home','b-home2'],420),'g-homes-b':(['b-home3','b-home4'],480),'g-houses':(['t-house-blue','t-house-red','t-house-green','t-house-purple'],360),
 'g-nature':(['p-tree','p-pine','t-cherry','t-cherry2','t-orange','t-hedge','p-flowers','t-palm'],300),
 'g-farm':(['p-hen','p-hen-nest','p-cow','p-berry','p-berry-empty','p-berry-grow','p-appletree','p-appletree-empty'],300),
 'g-props-a':(['p-fountain','t-fount2','p-bench','p-lamp','p-fence','p-mailbox','p-judgetable','t-balloons'],300),'g-props-b':(['p-van','t-flowerbed'],300)}
for g,(names,h) in plan.items():
    parts=flat(g); print(g,len(parts),len(names))
    for a,n in zip(parts,names): save(a,n+'.g',h)
