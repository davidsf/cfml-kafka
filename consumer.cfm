<cfscript>
  cfflush(interval=1);
  consumerService = new com.kafkaConsumerService();

  consumer = consumerService.create('mytopic', 'testgroup');

  event = "";
  while(event!='"bye"') {
    records = consumer.poll(1000);
    for ( record in records.iterator()) {
      event = record.value();
      echo("<br>" & event);
    }
  }
  echo("<br>Ok, so goodbye from consumer");
  consumer.close();


</cfscript>
