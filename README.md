# Using Apache Kafka from CFML

Examples of using apache kafka with cfml.

## Installation

### Kakfa

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
* start a console kafka client, so you can see the messages that we will send to it:
```
  ./bin/kafka-topics.sh  --topic mytopic -zookeeper localhost:2181
```

### CFML

* Clone this repo, start server with commandbox:
```
    cd cfml-kafka
    commandbox> start server libDir=lib
```
* From the website, you can send messages to "mytopic" topic and you can see it in the kafka client console.
