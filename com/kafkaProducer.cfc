/**
 * kafkaProducer.cfc
 * 
 * @author David Sedeño
 * @date September 2017
 **/
component accessors="true" {
  property producer;
  
  function init() {
    var props = createobject('java', 'java.util.Properties');
    var ProducerConfig = createobject('java', 'org.apache.kafka.clients.producer.ProducerConfig');
    var StringSerializer = createobject('java', 'org.apache.kafka.common.serialization.StringSerializer');
    
    props.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG,"127.0.0.1:9092");
    
    props.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
    props.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());

    producer = createobject('java', 'org.apache.kafka.clients.producer.KafkaProducer').init(props);
    return this;
  }
  
  function send(topic, message) {
    var value = serializeJson(message);
    var producerrecord = createobject('java', 'org.apache.kafka.clients.producer.ProducerRecord').init(topic, value);
    getproducer().send(producerRecord);
  }
}