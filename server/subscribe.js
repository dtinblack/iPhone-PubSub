// Subscribe to the broker to recieve the published messages

var mqtt = require('mqtt')
  , client = mqtt.createClient();

client.subscribe('messages');
client.publish('messages', 'test');

client.on('message', function(topic, message) {
          console.log('topic: ' + topic + ' payload: ' + message);
});
