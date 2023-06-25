import requests


res = requests.get('https://dou.eu/companies?from=mp')

print(res)
print(res.status_code)
print(res.content)
print(res.text)
