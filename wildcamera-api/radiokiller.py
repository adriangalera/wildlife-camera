import os


def kill_radio():
    os.system("sudo rfkill block all")
