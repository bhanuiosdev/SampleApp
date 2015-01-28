//
//  LoginViewController.h
//  sampleCoredta
//
//  Created by DV Reddy on 28/01/15.
//  Copyright (c) 2015 DVReddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UIAlertViewDelegate>{

    IBOutlet UITextField *UserName;
    IBOutlet UITextField *Password;
}

-(IBAction)ClickedLogin:(id)sender;
-(IBAction)ClickedGuest:(id)sender;

@end
