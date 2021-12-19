#-------------------------------------Content

import os
import requests
import csv

# définition de l'adresse de l'API
address = '34.244.150.51'
# port de l'API
port = 8000

def request_test(user, password,version, sentence):
    # requête
    r = requests.get(
        url=f'http://{address}:{port}/{version}/sentiment',
        params= {
            'username': user,
            'password': password, 
            'sentence': sentence
        }
    )

    output = '''
    ============================
        Content test
    ============================

    request done at "{version}/sentiment"
    | username={user}
    | password={password}
    | sentence={sentence}
    | score = {r}

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
    log=output.format(status_code=status_code, test_status=test_status, user=user, 
    password=password, version=version, sentence=sentence, r=r.json()['score'])

    # impression dans un fichier
    with open('my_server/api_test.log', 'a') as file:
        file.write(log)

with open('/my_server/user.csv', newline='') as f:
    reader = csv.DictReader(f)
    users = list(reader)

versions=["v1", "v2"]
sentences=["life is beautiful", "that sucks" ]
for user in users:
    if not user['users'] in ["clementine","bob"]:
        for version in versions:
            for sentence in sentences:
                request_test(user['users'], user['password'], version, sentence)