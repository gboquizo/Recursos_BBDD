import requests
import json


url = 'http://api.football-data.org/v1/soccerseasons/424'
headers = {'X-Auth-Token' : '19a97d9b7fb14c96b28d2936325953b5'}

r = requests.get(url, headers = headers)

if r.status_code == 200:
    # j = json.loads(r)
    # print j[0]

    print r.text