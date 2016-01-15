# docker.io/ngyuki/httpbin

## Build

```
docker build -t ngyuki/httpbin .
```

## Run

```
docker run -p 4000:80 ngyuki/httpbin
open http://localhost:4000/
```

Using https.

```
docker run -p 4443:443 -e HTTPS=on ngyuki/httpbin
open https://localhost:4443/
```
