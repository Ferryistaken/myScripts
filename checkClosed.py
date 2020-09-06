from subprocess import check_output 
import urllib.request

pkglist = check_output(["pacman", "-Qq"]).splitlines() blocklist = urllib.request.urlopen("https://projects.parabola.nu/blacklist.git/plain/blacklist.txt").read().splitlines()

for pkg in pkglist: for blocked_pkg in blocklist: if blocked_pkg.startswith(pkg+b':'): print(pkg.decode('ASCII'), ' ---> ' ,blocked_pkg.decode('ASCII'))
