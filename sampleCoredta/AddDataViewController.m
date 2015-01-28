

#import "AddDataViewController.h"
#import "DEMOLeftMenuViewController.h"
#import "DEMORightMenuViewController.h"

@interface AddDataViewController ()

@end

@implementation AddDataViewController

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

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fill Form"
                                                    message:@"Please Fill Application to Book apartment"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    self.navigationItem.title = @"Apply online";
    

    
//    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Show" style:UIBarButtonItemStylePlain target:self action:@selector(BarButtonItem)];
//    self.navigationItem.rightBarButtonItem = anotherButton;

    
    //self.navigationItem.rightBarButtonItem = sideMenuViewController;
}

-(void)BarButtonItem{
    DEMOLeftMenuViewController *leftMenuViewController = [[DEMOLeftMenuViewController alloc] init];
    DEMORightMenuViewController *rightMenuViewController = [[DEMORightMenuViewController alloc] init];
    
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:self.navigationController
                                                                    leftMenuViewController:nil
                                                                   rightMenuViewController:rightMenuViewController];
    [self.navigationController pushViewController:sideMenuViewController animated:YES];
    [self.sideMenuViewController presentRightMenuViewController];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveData:(id)sender {
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newContact;
    newContact = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Owner"
                  inManagedObjectContext:context];
    [newContact setValue: _name.text forKey:@"name"];
    [newContact setValue: _Firstname.text forKey:@"firstname"];
    
    [newContact setValue: _Address.text forKey:@"address"];
    [newContact setValue: _City.text forKey:@"city"];
    [newContact setValue: _state.text forKey:@"state"];
    
    [newContact setValue: _Country.text forKey:@"country"];
    [newContact setValue: _Description.text forKey:@"descriptiondetails"];
    [newContact setValue: _Amenites.text forKey:@"aminites"];
    
    [newContact setValue: _ContactPersonName.text forKey:@"contactname"];
    [newContact setValue: _ContactPersonEmail.text forKey:@"contactemail"];
    [newContact setValue: _ContactPersonPhoneNumber.text forKey:@"contactphone"];
    
    NSData *dataImage = [NSData dataWithData:UIImagePNGRepresentation(_imageGalarey.image)];
    NSLog(@"Data log :%@",dataImage);
    [[NSUserDefaults standardUserDefaults]setValue:dataImage forKey:@"imagedata"];
    [newContact setValue:dataImage forKey:@"imagedate"];
    
    _name.text = @"";
    _Firstname.text = @"";
    _Address.text =@"";
    _City.text = @"";
    _state.text = @"";
    _Country.text = @"";
    _Description.text = @"";
    _Amenites.text =@"";
    _ContactPersonName.text =@"";
    _ContactPersonEmail.text =@"";
    _ContactPersonPhoneNumber.text =@"";
    
    
    [buttonPlus setBackgroundImage:[UIImage imageNamed:@"Plus_icon.png"] forState:UIControlStateNormal];
    [_imageGalarey setImage:nil];
    
    NSError *error;
    [context save:&error];
    _status.text = @"Contact saved";
}

- (IBAction)findContact:(id)sender {
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"Owner"
                inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"(name = %@)",
     _name.text];
    [request setPredicate:pred];
    NSManagedObject *matches = nil;
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    
    if ([objects count] == 0) {
        _status.text = @"No matches";
    } else {
        matches = objects[0];
        _Firstname.text = [matches valueForKey:@"firstname"];
        _status.text = [NSString stringWithFormat:
                        @"%lu matches found", (unsigned long)[objects count]];
        
        _Address.text = [matches valueForKey:@"address"];
        _City.text = [matches valueForKey:@"city"];
        _state.text = [matches valueForKey:@"state"];
        _Country.text = [matches valueForKey:@"country"];
        _Description.text = [matches valueForKey:@"descriptiondetails"];
        _Amenites.text = [matches valueForKey:@"aminites"];
        
        _ContactPersonName.text = [matches valueForKey:@"contactname"];
        _ContactPersonEmail.text = [matches valueForKey:@"contactemail"];
        _ContactPersonPhoneNumber.text = [matches valueForKey:@"contactphone"];
        
        NSData *data = [matches valueForKey:@"imagedate"];
        
        [_imageGalarey setImage:[UIImage imageWithData:data]];
        [buttonPlus setBackgroundImage:nil forState:UIControlStateNormal];
        
    }
}

- (IBAction)photoAlbumButtonPushed:(id)sender {
    previewLayer.hidden = YES;
    [captureManager stopRunning];
    [self performSelector:@selector(showImagePicker) withObject:nil afterDelay:0.0];
}

#pragma mark -

- (void)showImagePicker {
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    pickerController.delegate = self;
    pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerController.allowsEditing = YES;
    [self presentModalViewController:pickerController animated:YES];
    
}

- (void)hideImagePickerAnimated:(BOOL)animated {
    [self dismissModalViewControllerAnimated:animated];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    CGRect cropRect = [[info valueForKey:UIImagePickerControllerCropRect] CGRectValue];
    UIImage *originalImage = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [_imageGalarey setImage:originalImage];
    [buttonPlus setBackgroundImage:nil forState:UIControlStateNormal];
    [self hideImagePickerAnimated:NO];
}



@end
