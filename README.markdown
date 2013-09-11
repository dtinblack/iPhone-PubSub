# Exploring PubSub and iOS

Exploring the technology required for iOS to use [ PubSub ] ( http://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern ). 
The PubSub software uses a [Nodejs] ( http://nodejs.org/ ) package 
[ MQTT.js ]( https://github.com/adamvr/MQTT.js/) and [ MQTT Client SDK for Objective-C ] ( https://github.com/m2mIO/mqttIO-objC ) for the iPhone.

Rather than connect to an instrument to publish data, software was developed 
to publish prime numbers to the iPhone simulator. The style of software is "make it work" and therefore doesn't have any error handling or system management. 

# Software
 
* Operating System : Mac OS 10.8 ( Mountain Lion )
* Node Version : v0.10.0 
* Node Package Manager ( NPM ) : v1.2.14 
* XCode version 4.6.3
* [ MQTT.js ]( https://github.com/adamvr/MQTT.js/ ) 
* [ MQTT Client SDK for Objective-C] ( https://github.com/m2mIO/mqttIO-objC ) and is used under the [ 2lemetry ] ( https://github.com/m2mIO/mqttIO-objC/blob/master/README.md )licence. 


## Installation of MQTT.js

    npm install mqtt

## Installation of MQTT Client SDK for Objective-C

    Download MQTT libraries from GitHub ( see above ) then copy into Xcode. Then add the header file into software. 

## Run

<ol>
<li>Start the server e.g. node server.js which runs the "broker"</li>
<li>Compile the project in Xcode ( which automatically links to the server as a subscriber ).</li>
<li>Run "node publish.js" which publishes prime numbers that are read and displayed by the iPhone application.</li>
</ol>

# Thanks

Many people to thank, however a special mention to [ Adam Rudd ] ( https://github.com/adamvr ) whose examples on [ MQTT.js ]( https://github.com/adamvr/MQTT.js/ ) was a great starting point to develop the server ( or broker ) for the PubSub. Also, [ 2lemetry ] ( http://www.2lemetry.com ) for making available their [ MQTT Client SDK for Objective-C ] ( https://github.com/m2mIO/mqttIO-objC ) and sample apps that gave me a lot of insight into PubSub.

