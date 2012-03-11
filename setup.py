#  Setup environnment with vimrc, gvimrc and vim plugin directory
#
# on windows, files should be the same partitions as vim config files (probably C:)
# for file hardlink to work
# and require the use of the junction.exe program for directory symlink
# (to provide as an argument)

import sys
import os
import shutil

def main(junctionPath):
    currentSystem = sys.platform
    print "System is ", currentSystem
    
    if (currentSystem == "win32"):
        import win32file
        prefix = "_"
        vimDirectory = "vimfiles"
    else:
        prefix = "."
        vimDirectory = ".vim"

    print "prefix : ", prefix
    print "vim directory : ", vimDirectory

    homeFolderPath = os.path.expanduser('~')
    print "Home Folder : " + homeFolderPath

#    backupPath = os.path.join(homeFolderPath,  prefix + "vimfilesBackup")
#    print "BackUp path : " + backupPath
#   if not os.path.exists(backupPath):
#       print "Backing up old files..."
#       os.mkdir(backupPath)

    if (os.path.exists(os.path.join(homeFolderPath, prefix + "vimrc"))):
        os.rename(os.path.join(homeFolderPath, prefix + "vimrc"), os.path.join(homeFolderPath, prefix + "vimrc.bak"))
    if (os.path.exists(os.path.join(homeFolderPath, prefix + "gvimrc"))):
        os.rename(os.path.join(homeFolderPath, prefix + "gvimrc"), os.path.join(homeFolderPath, prefix + "gvimrc,bak"))
    if (os.path.exists(os.path.join(homeFolderPath, vimDirectory))):
        os.rename(os.path.join(homeFolderPath, vimDirectory), os.path.join(homeFolderPath, vimDirectory + "BackUp"))

    if (currentSystem == "win32"):
        vimrcDestPath = os.path.join(homeFolderPath, prefix + "vimrc")
        print "Copying vimrc to " + vimrcDestPath
        win32file.CreateHardLink(vimrcDestPath, os.path.join(os.getcwd(), "vimrc")) 
#        os.system(junctionPath[0] + ' -s "' + vimrcDestPath + '" "' + os.path.join(os.getcwd(), 'vimrc"'))

        gvimrcDestPath = os.path.join(homeFolderPath, prefix + "gvimrc")
        print "Copying gvimrc to " + gvimrcDestPath
        win32file.CreateHardLink(gvimrcDestPath, os.path.join(os.getcwd(), "gvimrc")) 
#        os.system(junctionPath[0] + ' -s "' + gvimrcDestPath + '" "' + os.path.join(os.getcwd(), 'gvimrc"'))

    if (len(junctionPath) > 0):
        vimDirectoryDestPath = os.path.join(homeFolderPath, vimDirectory)
        print "Copying gvimrc to " + vimDirectoryDestPath
        #win32file.CreateHardLink(vimDirectoryDestPath, os.path.join(os.getcwd(), "vimrc")) 
        print junctionPath[0] + ' -s \"' + vimDirectoryDestPath + '" "' + os.path.join(os.getcwd(), 'vim"')
        os.system(junctionPath[0] + ' -s "' + vimDirectoryDestPath + '" "' + os.path.join(os.getcwd(), 'vim"'))
    else:
        vimrcDestPath = os.path.join(homeFolderPath, prefix + "vimrc")
        print "Copying vimrc to " + vimrcDestPath
        os.symlink(os.path.join(os.getcwd(), "vimrc"), vimrcDestPath) 

        gvimrcDestPath = os.path.join(homeFolderPath, prefix + "gvimrc")
        print "Copying gvimrc to " + gvimrcDestPath
        os.symlink(os.path.join(os.getcwd(), "gvimrc"), gvimrcDestPath) 

        vimDirectoryDestPath = os.path.join(homeFolderPath, vimDirectory)
        print "Copying gvimrc to " + vimDirectoryDestPath
        os.symlink(os.path.join(os.getcwd(), "vim"), vimDirectoryDestPath) 

if __name__ == "__main__":
    main(sys.argv[1:])
