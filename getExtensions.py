#!/usr/bin/python3.8

import wget
import sys

if len(sys.argv) != 3:
	print("Too many arguments!")
	print("Usage: ")
	print("getExtension.py <browserVersion> <extensionURL>")
	sys.exit()


url = "https://clients2.google.com/service/update2/crx?response=redirect&acceptformat=crx2,crx3&prodversion=" + str(sys.argv[1]) + "&x=id%3D" + str(sys.argv[2]) + "%26installsource%3Dondemand%26uc"

extension = wget.download(url, out="Downloads")
