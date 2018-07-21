#!/usr/bin/env python

import subprocess
import time

folder = "to_upload"
application = "php insta.php"

def get_drlist():
    return subprocess.check_output(["ls", folder]).decode('utf-8').strip().split("\n")

while True:
    drlist1 = get_drlist()
    time.sleep(2)
    drlist2 = get_drlist()
    for file in [f for f in drlist2 if not f in drlist1]:
            command = application+" '"+folder+"/"+file+"'"
            subprocess.Popen(["/bin/bash", "-c", command])