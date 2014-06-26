import os, sys, re, subprocess
from ctypes import *

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
vs = vs+'\\msbuild.txt'

msbuildpath = open(vs).readline()
msbuildpath = msbuildpath.strip('\n')
msbuildpath = msbuildpath + "\\msbuild.exe"

a = [ msbuildpath,
                "/m:8",
                "/V:q",
                "/property:WarningLevel=0;Configuration=%s;Platform=%s"%( configure, platform ),
                solution
                ]

p = subprocess.Popen( a, stdout=subprocess.PIPE)


listError = []
while True:
        l = p.stdout.readline()
        if l=="":
                break
        print l
        err = re.findall("error", l )
        if len(err) > 0 :
                listError = listError + [l]
                


print "compile %s finish..... error count = %d" % ( solution, len(listError) )
print "-"*80

windll.Kernel32.GetStdHandle.restype = c_ulong
h = windll.Kernel32.GetStdHandle(c_ulong(0xfffffff5))
windll.Kernel32.SetConsoleTextAttribute(h, 12)

for l in listError:
        print l



