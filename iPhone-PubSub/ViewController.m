//
//  ViewController.m
//  iPhone-PubSub
//
//  Created by David Black on 17/07/2013.
//  Copyright (c) 2013 David Black. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize scrollView;
@synthesize messageTable;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
        
   
 
    // connect to PubSub server
 
    // - generate a Client ID to be used to connect to the server
 
     NSString *alphabet  = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789";
     NSMutableString *client = [NSMutableString stringWithCapacity:5];
     for (NSUInteger i = 0; i < 5; i++) {
     u_int32_t r = arc4random() % [alphabet length];
     unichar c = [alphabet characterAtIndex:r];
     [client appendFormat:@"%C", c];

     }
      
    clientID = client;
 
    // Initialise the arrays
 
    messageArray = [[NSMutableArray alloc] init];
 
    // connect to the server
 
    mySession = [[MQTTSession alloc] initWithClientId:clientID];
 
    [mySession connectToHost:@"localhost" port:1883];
 
    [mySession setDelegate:self];
 
   // set topic name
 
    topicName = @"messages"; // not the best way but works
 
   // subscribe
 
   [mySession subscribeTopic:topicName];
 
 
 
    CGSize scrollContentSize = self.view.frame.size;
    self.scrollView.contentSize = scrollContentSize;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Table View

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [messageArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[messageArray objectAtIndex:indexPath.row]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Topic: %@",[messageArray objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - MQTT Callback methods
- (void) session:(MQTTSession *)session handleEvent:(MQTTSessionEvent)eventCode {
    
    //TODO
    
    switch (eventCode){
        case MQTTSessionEventConnected:
            NSLog(@"connected");
            break;
         case MQTTSessionEventConnectionRefused:
            NSLog(@"connection refused");
            break;
         case MQTTSessionEventConnectionClosed:
            NSLog(@"connection closed");
            break;
         case MQTTSessionEventConnectionError:
            NSLog(@"connection error");
            NSLog(@"reconnecting ....");
            [mySession connectToHost:@"localhost" port:1883]; // specific connection to the local server
            break;
         case MQTTSessionEventProtocolError:
            NSLog(@"protocol error");
            
        default:
            break;
    }
    
    
    
}

- (void)session:(MQTTSession*)sender
     newMessage:(NSData*)data
        onTopic:(NSString*)topic {
 NSLog(@"new message, %d bytes, topic=%@", [data length], topic);
 NSString *payloadString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
 NSLog(@"data: %@ %@", payloadString,data);
 [messageArray insertObject:payloadString atIndex:0];
// [topicArray insertObject:topic atIndex:0];
 [messageTable reloadData];
 //[self newMessageReceived:payloadString Topic:topic];
 
}


@end
