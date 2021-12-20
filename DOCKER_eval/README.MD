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
│   ├── authentication.py
│   ├── authorization.py
│   ├── content.py
│   ├── log.txt
│   └── user.csv
└── setup.sh

Le setup.sh purge les fichiers log.txt et api_test.log et les images malekidri/* si elles existent
Lance le docker compose et écrit les sorties vers le fichier log.txt. 

Le dossier docker_volume et un volume se trouvant dans chaque containers au niveau de "/docker_volume/:/my_server/", il centralise les scipts, les données des utilisateurs sous user.csv, et les fichiers logs. Cela permet une gestion plus simple de l'ensemble des containers. 




