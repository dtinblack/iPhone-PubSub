// Publishing messages to the broker 

var mqtt = require('mqtt')
  , client = mqtt.createClient();

client.publish('messages', 'great news ... it works with iPhone', {retain: true});
client.end();
