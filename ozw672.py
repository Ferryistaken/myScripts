#!/usr/bin/python3.8

import requests
import json

tokenResponse = requests.get("http://192.168.1.8/api/auth/login.json?user=Administrator&pwd=Deis.lab1")

json = json.loads(tokenResponse.text)
sessionId = json["SessionId"]

id = 2673

route = "http://192.168.1.8/api/menutree/read_datapoint.json?SessionId=" + sessionId + "&Id=" + str(id)


data = requests.get(route)

print(data.text)