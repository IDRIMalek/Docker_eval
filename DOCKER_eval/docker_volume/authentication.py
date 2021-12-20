import os
import requests
import csv
import docker 

# définition de l'adresse de l'API
client = docker.DockerClient()
container = client.containers.get("my_api_container")
address = container.attrs['NetworkSettings']['Networks']['docker_eval_my_network']['IPAddress']
#address = '34.244.150.51'

# port de l'API
port = 8000

def request_test(user, password):
    # requête
    r = requests.get(
        url=f'http://{address}:{port}/permissions',
        params= {
            'username': user,
            'password': password
        }
    )

    output = '''
    ============================
        Authentication test
    ============================

    request done at "/permissions"
    | username={user}
    | password={password}

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
    log=output.format(status_code=status_code, test_status=test_status, user=user, password=password)

    # impression dans un fichier
    with open('/my_server/api_test.log', 'a') as file:
        file.write(log)

with open('/my_server/user.csv', newline='') as f:
    reader = csv.DictReader(f)
    users = list(reader)


for user in users:
    request_test(user['users'], user['password'])