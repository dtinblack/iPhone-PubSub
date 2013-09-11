//
//  ViewController.h
//  iPhone-PubSub
//
//  Created by David Black on 17/07/2013.
//  Copyright (c) 2013 David Black. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MQTTSession.h"

@interface ViewController : UIViewController<UITableViewDataSource,
                            UITableViewDelegate> {
                                
            NSMutableArray *messageArray;
            MQTTSession *mySession;
            BOOL connecting;
            NSString *clientID;
            NSString *topicName;
    
}


@property(weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(weak, nonatomic) IBOutlet UITableView *messageTable;

#pragma mark - MQTT Callback methods
- (void) session:(MQTTSession *)session handleEvent:(MQTTSessionEvent)eventCode;
- (void) session:(MQTTSession *)session newMessage:(NSData *)data onTopic:(NSString *)topic;

@end
