#!/usr/bin/python3.8

# this will retrieve data about my plant

import requests
import re
import json

humidity = json.loads(requests.get("http://192.168.3.16:8080/rest/items/plantHumidityPercentag"))


print(humidity.text)
