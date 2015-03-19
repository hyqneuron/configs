#!/usr/bin/python
import time
import sys
import os

def output(val):
    sys.stdout.write(val)

def root_menu():
    tstr = time.strftime("%a %d %b %H:%M")
    template = ""
    with open("/home/noid/.config/openbox/pipe_template.xml", "r") as tmplfile:
        template = tmplfile.read()
    output(template.format(tstr))

volume_template="""<openbox_pipe_menu>
  <item label="  Volume: {}" />
</openbox_pipe_menu>"""

def volume_doit(command):
    lines = os.popen(command).read().split('\n')[-2]
    line = lines.split()
    output(volume_template.format(line[-3]+" "+line[-1]))
    

def volume_inc():
    volume_doit("amixer sset Master 10%+ ")
def volume_dec():
    volume_doit("amixer sset Master 10%- ")
def volume_tog():
    volume_doit("amixer sset Master toggle")
    

if len(sys.argv)==1: root_menu()
else:
    choice = sys.argv[1]
    if choice == 'volume_inc':
        volume_inc()
    elif choice == 'volume_dec':
        volume_dec()
    elif choice == 'volume_tog':
        volume_tog()

