//
//  AppImageViewController.m
//  sampleCoredta
//
//  Created by DV Reddy on 29/01/15.
//  Copyright (c) 2015 DVReddy. All rights reserved.
//

#import "AppImageViewController.h"
#import "AddDataViewController.h"

@interface AppImageViewController ()

@end

@implementation AppImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Apratment Detail";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)Next:(id)sender{
    AddDataViewController *add = [[AddDataViewController alloc]initWithNibName:@"AddDataViewController" bundle:nil];
    [self.navigationController pushViewController:add animated:YES];
}

@end
