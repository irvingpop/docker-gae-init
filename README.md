Docker container for gae-init based projects.

To build, run:
```
docker build -t irvingpop/gae-init:latest .
```

To push to dockerhub, run:
```
docker push irvingpop/gae-init
```


To run in your gae-init project:
```
cd ~/src/my-gae-init-project
docker run --rm -ti -v $PWD:/var/app:cached irvingpop/gae-init npm install
docker run --rm -ti -p 3000:3000 -p 3001:3001 -v $PWD:/var/app:cached irvingpop/gae-init gulp
```
