//
//  ViewController.h
//  iPhone-PubSub
//
//  Created by David Black on 17/07/2013.
//  Copyright (c) 2013 David Black. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,
                            UITableViewDelegate> {
                                
            NSMutableArray *messageArray;
    
}

@property(weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(weak, nonatomic) IBOutlet UITableView *messageTable;

@end
