<cfscript>
  producer = new com.kafkaProducer();
  producer.send("mytopic", FORM.msg);
  echo("Message send!");
</cfscript>
