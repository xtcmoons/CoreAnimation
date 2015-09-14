//
//  CoreViewController.m
//  CoreAnimation
//
//  Created by chufw1 on 15/9/12.
//  Copyright (c) 2015年 chufw1. All rights reserved.
//

#import "CoreViewController.h"
#import "CALayerViewController.h"
#import "BaseAnimationViewController.h"
#import "KeyAnimationVC.h"
#import "GroupAnimationVC.h"
#import "TransitionVC.h"
#import "DisplayLinkVC.h"

@interface CoreViewController () {
    NSMutableArray *_dataArray;
}

@end

@implementation CoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Core Animation";

    _dataArray = @[@"CALayer",
                   @"BaseAnimation",
                   @"keyFrame",
                   @"GroupAnimation",
                   @"Transiton",
                   @"DisplayLink"].mutableCopy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellID = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];

    cell.textLabel.text = _dataArray[indexPath.row];

    return cell;
}

#pragma mark - UITableViewDelegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        CALayerViewController *calayerVC = [[CALayerViewController alloc] init];
        calayerVC.view.backgroundColor = [UIColor whiteColor];

        [self.navigationController pushViewController:calayerVC animated:YES];

    } else if (indexPath.row == 1) {
        BaseAnimationViewController *calayerVC = [[BaseAnimationViewController alloc] init];
        calayerVC.view.backgroundColor = [UIColor whiteColor];

        [self.navigationController pushViewController:calayerVC animated:YES];

    } else if (indexPath.row == 2) {
        KeyAnimationVC *calayerVC = [[KeyAnimationVC alloc] init];
        calayerVC.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:calayerVC animated:YES];

    } else if (indexPath.row == 3) {
        GroupAnimationVC *calayerVC = [[GroupAnimationVC alloc] init];
        calayerVC.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:calayerVC animated:YES];
    } else if (indexPath.row == 4) {
        TransitionVC *calayerVC = [[TransitionVC alloc] init];
        calayerVC.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:calayerVC animated:YES];

    } else if (indexPath.row == 5) {
        DisplayLinkVC *calayerVC = [[DisplayLinkVC alloc] init];
        calayerVC.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:calayerVC animated:YES];

    }
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
