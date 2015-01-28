//
//  AppartmentsViewController.h
//  sampleCoredta
//
//  Created by DV Reddy on 28/01/15.
//  Copyright (c) 2015 DVReddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppartmentsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    NSMutableArray *arrayAToZ;
    NSMutableArray *ApprtmentNames;
    NSMutableArray *AppImages;

}

@property (nonatomic, retain) IBOutlet UITableView *tableview;

@end
