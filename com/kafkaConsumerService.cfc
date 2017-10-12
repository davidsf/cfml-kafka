/**
 * kafkaConsumer.cfc
 * 
 * @author David Sedeño
 * @date September 2017
 **/
component accessors="true" {
  
  function create(topic, groupid) {
    var props = createobject('java', 'java.util.Properties');
    var ConsumerConfig = createobject('java', 'org.apache.kafka.clients.consumer.ConsumerConfig');

    props.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");

    props.put(ConsumerConfig.GROUP_ID_CONFIG, arguments.groupid);
    props.put(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, "false");
    props.put(ConsumerConfig.SESSION_TIMEOUT_MS_CONFIG, "30000");
    props.put('auto.offset.reset', 'latest');
    StringDeserializer = createobject('java', 'org.apache.kafka.common.serialization.StringDeserializer');
    props.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
    props.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
    props.put("max.poll.records", "5");

    var consumer = createobject('java', 'org.apache.kafka.clients.consumer.KafkaConsumer').init(props);
    consumer.subscribe([arguments.topic]);
    return consumer;
  }
}