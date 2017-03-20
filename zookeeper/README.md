
```bash
docker build -t yourimgs/zookeeper .
```

```bash
docker run --name zookeeper -it -d \
    -p 2181:2181 \ 
    -v /var/lib/zookeeper:/var/lib/zookeeper \
    -v /var/logs/zookeeper \
    yourimgs/zookeeper:latest
```
