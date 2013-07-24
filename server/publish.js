// Publishing messages to the broker - test

var mqtt = require('mqtt')
  , client = mqtt.createClient();

var primes = new Array();

primes[0] = 1;
primes[1] = 2;

var prime  = 1;
var number = 3;
var found  = 0;

function mod(n, m) {
    return n % m;
}

while ( prime < 10000 ) {
    
    for ( var i = 1; i <= prime; i++ ) {
        
        var value = number / primes[ i ];
        var intvalue = Math.floor(value);
        
        if ( value ==  intvalue ) { found = 1;} // not a prime
        
    }
    
    if ( found == 0 ) {
        
        prime++;
        
        primes[prime] = number;
        
    } else {
        
        found = 0;
    }
    
    
    
    if( mod( number, 1000 ) == 0 ) { // publish every 1000'th prime
        
        client.publish('messages', 'prime = ' + primes[prime], {retain: true} );
        
    }
    
    number++;
}

client.end();

