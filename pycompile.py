import os, sys
if len(sys.argv)<2 :
        print "Need an input file."
        exit()

configure="Debug"
platform = "x64"
solution = sys.argv[1]

if len(sys.argv)>2:
        configure = sys.argv[2]

if len(sys.argv)>3:
        platform = sys.argv[3]

vs = os.getenv("VIM")
vs = vs+'\\vscompile.bat '
strcommand = vs + configure + " " + platform + " "+ solution

print configure
print platform
print solution

os.system(strcommand)

