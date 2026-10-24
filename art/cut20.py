import os, sys
HERE=os.path.dirname(os.path.abspath(__file__))
src=open(os.path.join(HERE,'cut.py')).read(); src=src[:src.index('for n in [')]
exec(src)
for n,out in [(a.split(':')[0],a.split(':')[1]) for a in sys.argv[1:]]:
    try: charsheet(n,out)
    except AssertionError as e: print('FAIL',n,e)
