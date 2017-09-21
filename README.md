# Using Apache Kafka from CFML

* Download, unzip and start Kafka.

  [Offical kafka download page](http://kafka.apache.org/downloads)

```
  cd <kafka-dir>
  sudo ./bin/zookeeper-server-start.sh -daemon config/zookeeper.properties
  sudo ./bin/kafka-server-start.sh -daemon config/server.properties
```

* Create our test topic, mytopic:
```
  sudo ./bin/kafka-topics.sh --create --topic mytopic --partitions 5 --replication-factor 1 --zookeeper localhost:2181
```
* start a console kafka client:
```
  ./bin/kafka-topics.sh  --topic mytopic^C-zookeeper localhost:2181
```
* From this repo, start server with commandbox:
```
    commandbox> start server libDir=lib
```
* From the website, you can send messages to "mytopic" topic and you can see it in the kafka client console.
