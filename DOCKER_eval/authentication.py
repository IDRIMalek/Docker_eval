import os
import requests

# définition de l'adresse de l'API
address = '34.244.150.51'
# port de l'API
port = 8000

# requête
r = requests.get(
    url=f'http://{address}:{port}/permissions',
    params= {
        'username': 'alice',
        'password': 'wonderland'
    }
)

output = '''
============================
    Authentication test
============================

request done at "/permissions"
| username="alice"
| password="wonderland"

expected result = 200
actual restult = {status_code}

==>  {test_status}

'''

# statut de la requête
status_code = r.status_code

# affichage des résultats
if status_code == 200:
    test_status = 'SUCCESS'
else:
    test_status = 'FAILURE'
print(output.format(status_code=status_code, test_status=test_status))

# impression dans un fichier
if os.environ.get('LOG') == 1:
    with open('api_test.log', 'a') as file:
        file.write(output)
