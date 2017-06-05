# FreePBX on Docker

### Image includes

 * Debian Jessie
 * LAMP stack (apache2, mysql, php)
 * Asterisk 13
 * FreePBX 13
 
### Credit

This work is based on the docker image jmar71n/freepbx.


### Run your FreePBX image

#### 1st time

```bash
cd /tmp/
mkdir docker-freepbx
cd docker-freepbx
wget https://raw.githubusercontent.com/micmay/docker-freepbx/master/docker-compose.yml

# start in background
docker-compose up -d

# start in foreground
docker-compose up
```

Go to http://localhost:8082 for freepbx

#### 2nd time
```bash
docker start freepbx
```

#### shutdown
```bash
docker stop freepbx
```

#### Remove
```bash
docker-compose down
```
Or
```bash
docker rm freepbx
```

### Build

```bash
git clone https://github.com/micmay/docker-freepbx.git
cd docker-freepbx
docker-compose -f docker-compose-build.yml build
```

### Dockerhub

This image is available on ducker hub 
[mima84/docker-freepbx/](https://hub.docker.com/r/mima84/docker-freepbx/)


### Fork ME

Please feel free to fork or contribite to this image.
https://github.com/micmay/docker-freepbx.git


