#!/usr/bin/python3
import requests

url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=BAT"
response = requests.get(
        url,
        headers={'Accept': 'application/json', 'X-CMC_PRO_API_KEY': 'a3f35322-d0de-4b38-adb2-3ad3aeef927c'},
)

json = response.text

price = json.split("price\":", 1)[1]
price = price.split(",", 1)[0]

print(price)
