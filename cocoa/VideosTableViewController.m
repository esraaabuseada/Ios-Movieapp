//
//  VideosTableViewController.m
//  cocoa
//
//  Created by Lost Star on 4/14/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

#import "VideosTableViewController.h"


@interface VideosTableViewController ()


@end

@implementation VideosTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",_mid);
  NSString * trailorsUrl = [[NSString alloc] initWithString:[@"https://api.themoviedb.org/3/movie/" stringByAppendingString:_mid]];
    NSLog(@"%@",trailorsUrl);
    
    NSURL *url = [NSURL URLWithString: [trailorsUrl stringByAppendingString:@"/videos?api_key=658680e409a5e9e11988f3e49361edae"] ];
    
    NSLog(@"%@",url);
    
    NSURLRequest *request1 = [NSURLRequest requestWithURL:url];
    
    NSLog(@"%@",request1);
    AFHTTPRequestOperation *operation1=[[AFHTTPRequestOperation alloc] initWithRequest:request1];
    operation1.responseSerializer=[AFJSONResponseSerializer serializer];
    [operation1 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * operation1, id  responseObject){
        
        _dicTrailors =(NSDictionary*)responseObject;
        _trailors=[_dicTrailors objectForKey:@"results"];
        
        
        
        [self.tableView reloadData];
        
        NSLog(@"%@",_trailors[0]);
        
        printf("request success");
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        printf("request failed");
    }];
    [operation1 start];
    
    
    
    
    
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _trailors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
YTPlayerView* playerView = (YTPlayerView*)[cell viewWithTag:1];
    
     [playerView loadWithVideoId:_trailors[indexPath.row][@"key"]];
   // NSString *linkObj = [[NSString alloc] initWithString:[@"https://www.youtube.com/v/" stringByAppendingString:_trailors[indexPath.row][@"Key"]]];
    
    
   
    
    // Configure the cell...
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 200;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
