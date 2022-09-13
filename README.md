# Laravel9 Docker

### 執行

```sh
# build
docker build -f ./Docker/Dockerfile -t laravel9-docker:latest .

# run
docker run -d -p 80:80 --name laravel9-docker laravel9-docker:latest

# bash
docker exec -it laravel9-docker bash

# stop & rm
docker stop laravel9-docker && docker rm laravel9-docker
```

### 測試

```sh
# Laravel Schedule,每分鐘寫入時間到log
# app/Console/Commands/ScheduleTestCommand.php
# app/Console/Kernel.php
cat /var/www/logs/laravel.log
```
