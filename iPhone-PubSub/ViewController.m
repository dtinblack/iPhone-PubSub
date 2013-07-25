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
    
    
    
    // Initialise the arrays
    
    messageArray = [[NSMutableArray alloc] init];

    
    // load message array to test interface
    
    [messageArray addObject:@"First Line"];
    [messageArray addObject:@"Second Line"];
    [messageArray addObject:@"Third Line"];
    [messageArray addObject:@"Fourth Line"];
       
    
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




@end
