import sys
import os
import shutil

def main():
    currentSystem = sys.platform
    print "System is ", currentSystem

    if (currentSystem == "win32"):
        prefix = "__"
        vimDirectory = "vimfiles"
    else:
        prefix = "."
        vimDirectory = ".vim"

    print "prefix : ", prefix
    print "vim directory : ", vimDirectory

    homeFolderPath = os.path.expanduser('~')

    print "Backing up old files..."
    backupPath = os.path.join(homeFolderPath,  prefix + "vimfilesBackup")
    if not os.path.exists(backupPath):
        os.mkdir(backupPath)

    shutil.move(os.path.join(homeFolderPath, prefix + "vimrc"), os.path.join(backupPath, prefix + "vimrc"))

    vimrcDestPath = os.path.join(homeFolderPath, prefix + "vimrc")
    print "Copying vimrc to " + vimrcDestPath
    os.symlink(os.path.join(os.getcwd(), "vimrc"), vimrcDestPath) 

if __name__ == "__main__":
    main()
