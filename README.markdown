# Exploring PubSub and iOS

Exploring the technology required for iOS to use [ PubSub ] ( http://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern ). 
The PubSub software uses a [Nodejs] ( http://nodejs.org/ ) package 
[ MQTT.js ]( https://github.com/adamvr/MQTT.js/) and [ MQTT Client SDK for Objective-C ] ( https://github.com/m2mIO/mqttIO-objC ) for the iPhone.

Rather than connect to an instrument to publish data, software was developed 
to publish prime numbers to the iPhone simulator.

# Software
 
* Operating System : Mac OS 10.8 ( Mountain Lion )
* Node Version : v0.10.0 
* Node Package Manager ( NPM ) : v1.2.14 
* XCode version 4.6.3
* [ MQTT.js ]( https://github.com/adamvr/MQTT.js/ ) 
* [ MQTT Client SDK for Objective-C] ( https://github.com/m2mIO/mqttIO-objC )


## Installation of MQTT.js

    npm install mqtt

## Run



# Thanks

Many people to thank, however a special mention to [ Adam Rudd ] ( https://github.com/adamvr ) whose examples on [ MQTT.js ]( https://github.com/adamvr/MQTT.js/ ) was a great starting point to develop the server ( or broker ) for the PubSub.

