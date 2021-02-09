# ft_server

## Docker

### Build

* 'docker build -t debian .'

### Run

* 'docker run -d -p 80:80 -p 443:443 --name=debian 3d4bc80bd107'

* 'docker run -p 80:80 -p 443:443 -it --name=debian 76f883f4eb3f /bin/bash'

### Delete

* Supprimer une image : 'docker rmi 76f883f4eb3f'

* Supprimer toutes les images : 'docker rmi $(docker images -a -q)'