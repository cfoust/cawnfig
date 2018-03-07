#!/usr/bin/env python
import sys, subprocess

def sh(command):
    """
    Run a command and return its STDOUT.
    """
    version = sys.version_info
    output  = subprocess.check_output(command, shell=True)

    if version[0] != 3:
        return output.strip()

    return output.decode('utf-8').strip()
