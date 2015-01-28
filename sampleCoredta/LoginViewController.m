//
//  LoginViewController.m
//  sampleCoredta
//
//  Created by DV Reddy on 28/01/15.
//  Copyright (c) 2015 DVReddy. All rights reserved.
//

#import "LoginViewController.h"
#import "AppartmentsViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.hidesBackButton = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)ClickedLogin:(id)sender{
    if ([UserName.text isEqualToString:@"bhanu"] && [Password.text isEqualToString:@"prakash"]) {
        [self MoveToNextScreen];
    }
    else{
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"In correct"
                                                        message:@"Please Check username and password"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

-(IBAction)ClickedGuest:(id)sender{
    [self MoveToNextScreen];
}

-(void)MoveToNextScreen{

    AppartmentsViewController *app = [[AppartmentsViewController alloc]initWithNibName:@"AppartmentsViewController" bundle:nil];
    
    [self.navigationController pushViewController:app animated:YES];

}

@end
