# ft_server

## Docker

### Build

* 'docker build -t ft_server .'

### Run

* 'docker run --rm -d -p 80:80 -p 443:443  --env index=on --name=tmp ft_server'

* 'docker run --rm -d -p 80:80 -p 443:443  --env index=off --name=tmp ft_server'

* 'docker run -p 80:80 -p 443:443 -it --name=tmp ft_server /bin/bash'

### Stop

* 'docker stop tmp'

### Delete

* 'docker rmi 76f883f4eb3f'

* 'docker rmi $(docker images -a -q)'
