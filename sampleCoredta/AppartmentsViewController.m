//
//  AppartmentsViewController.m
//  sampleCoredta
//
//  Created by DV Reddy on 28/01/15.
//  Copyright (c) 2015 DVReddy. All rights reserved.
//

#import "AppartmentsViewController.h"
#import "AddDataViewController.h"
#import "AppImageViewController.h"

@interface AppartmentsViewController ()

@end

@implementation AppartmentsViewController
@synthesize tableview;
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
    self.navigationItem.title = @"Near By Apartments";
    tableview.delegate = self;
    tableview.dataSource = self;
    
        arrayAToZ = [[NSMutableArray alloc] initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    
    ApprtmentNames = [[NSMutableArray alloc]initWithObjects:@"Matrix Appartments",@"Novotel Appartment",@"Lovely Service App",@"Dot Service",@"Ginger Service",@"Matrix Appartments",@"Novotel Appartment",@"Lovely Service App",@"Dot Service",@"Ginger Service",@"Matrix Appartments",@"Novotel Appartment",@"Lovely Service App",@"Dot Service",@"Ginger Service",@"Matrix Appartments",@"Novotel Appartment",@"Lovely Service App",@"Dot Service",@"Ginger Service",@"Matrix Appartments",@"Novotel Appartment",@"Lovely Service App",@"Dot Service",@"Ginger Service",@"Dot Service", nil];
    
    AppImages = [[NSMutableArray alloc]initWithObjects:@"images (1).jpeg",@"images (2).jpeg",@"images (3).jpeg",@"images (4).jpeg",@"images (5).jpeg",@"images (1).jpeg",@"images (2).jpeg",@"images (3).jpeg",@"images (4).jpeg",@"images (5).jpeg",@"images (1).jpeg",@"images (2).jpeg",@"images (3).jpeg",@"images (4).jpeg",@"images (5).jpeg",@"images (1).jpeg",@"images (2).jpeg",@"images (3).jpeg",@"images (4).jpeg",@"images (5).jpeg",@"images (1).jpeg",@"images (2).jpeg",@"images (3).jpeg",@"images (4).jpeg",@"images (5).jpeg",@"images (5).jpeg", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView methods

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 25)];
    
    UILabel *headerTitle=[[UILabel alloc]initWithFrame:CGRectMake(15, 0, 280, 25)];
    headerView.backgroundColor = [UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1];
    //[headerTitle setFont:[UIFont fontWithName: size:16.0f]];
    
    // just added for the sectionTitles
    
    [headerTitle setText:[NSString stringWithFormat:@"%@",[arrayAToZ objectAtIndex:section]]];
    headerTitle.textColor = [UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1];
    [headerView addSubview:headerTitle];
    
    return headerView;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    //sectionForSectionIndexTitleAtIndex: is a bit buggy, but is still useable
    return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  

    
    return [arrayAToZ count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 25;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    view.tintColor = [UIColor blueColor];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [arrayAToZ count];
    
}

-(void)sortAlphabetically {
    

    [tableview reloadData];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = nil;
    cellIdentifier = @"ChooseTeamTableViewCell";
    

    UITableViewCell *teamCell = [[UITableViewCell alloc]init];
    
    
    UILabel *labelSeparator = [[UILabel alloc]initWithFrame:CGRectMake(15, 43, tableView.frame.size.width, 1)];
    labelSeparator.backgroundColor = [UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1];
    
    teamCell.textLabel.text = [ApprtmentNames objectAtIndex:indexPath.row];
    teamCell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    teamCell.imageView.image = [UIImage imageNamed:[AppImages objectAtIndex:indexPath.row]];
    return teamCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [self GotoAddOrEditScree];

}

-(void)GotoAddOrEditScree{
//    AddDataViewController *add = [[AddDataViewController alloc]initWithNibName:@"AddDataViewController" bundle:nil];
//    
//    [self.navigationController pushViewController:add animated:YES];
    
    AppImageViewController *app = [[AppImageViewController alloc]initWithNibName:@"AppImageViewController" bundle:nil];
    [self.navigationController pushViewController:app animated:YES];
}


@end
