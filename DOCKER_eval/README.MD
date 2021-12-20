Remarques et justifications des choix effectués

Structure des dossiers et fichiers. 

DOCKER_eval/
├── DF_authentication
│   └── Dockerfile
├── DF_authorization
│   └── Dockerfile
├── DF_content
│   └── Dockerfile
├── README.MD
├── docker-compose.yml
├── docker_volume
│   ├── api_test.log
│   ├── log.txt
│   └── user.csv
└── setup.sh

Le setup.sh purge les fichiers log.txt et api_test.log ainsi que les images malekidri/* si elles existent
Lance le docker compose et écrit les sorties vers le fichier log.txt. 
Il est aussi possible de construire les images en décommentant la partie construction des images, sinon les images proviennent du dépôt malekidri/* sur dockerhub. 

les dossiers DF_* contiennent les Dockerfile ainsi que les scripts python pour les tests, ces derniers sont créés à partir de debian, python3 y est installé ainsi que les librairies nécessaires au fonctionnement. Un changement de dossier courant est opéré vers /my_server/.
Ensuite l'exécution des scriptes python y sont effectués. 

Le dossier docker_volume est un volume se trouvant dans chaque container au niveau de "/docker_volume/:/data/", il centralise les données des utilisateurs sous user.csv, et les fichiers logs. Cela permet une gestion plus simple de l'ensemble des containers. 

Le docker-compose créer un réseau "my_network" et le volume "my_volume" et active les containers dans l'ordre suivant: 
1- datascientest/latest - my_api_container (api)
2- authentication (requête test d'authentification)
3- authorization (requête test d'authorisation pour sentimentv11 etv22)
4- content requête testt de sentiment pour les phrases: "life is beautiful", "that suckss"





