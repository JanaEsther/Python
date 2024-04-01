import requests

headers = {
    'accept': 'application/json',
    # Already added when you pass json= but not when you pass data=
    # 'Content-Type': 'application/json',
}

json_data = {
    'obchodniJmeno': 'moneta'
}



# Note: json_data will not be serialized by requests
# exactly as it was in the original request.
data = '{\n  "obchodniJmeno":"moneta"\n\n}'
response = requests.post('https://ares.gov.cz/ekonomicke-subjekty-v-be/rest/ekonomicke-subjekty/vyhledat', headers=headers, data=data)
print(response.json())