

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "CaptureManager.h"

@interface AddDataViewController : UIViewController<UIScrollViewDelegate,CaptureManagerDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate>{

    IBOutlet UIImageView *imageGalarey;
    AVCaptureVideoPreviewLayer *previewLayer;
    CaptureManager *captureManager;
    IBOutlet UIButton *buttonPlus;
}

@property (strong, nonatomic) IBOutlet UIImageView *imageGalarey;
@property (strong, nonatomic) IBOutlet UITextField *name;

@property (strong, nonatomic) IBOutlet UITextField *Firstname;

@property (strong, nonatomic) IBOutlet UITextField *Address;
@property (strong, nonatomic) IBOutlet UITextField *City;
@property (strong, nonatomic) IBOutlet UITextField *Country;
@property (strong, nonatomic) IBOutlet UITextField *Description;
@property (strong, nonatomic) IBOutlet UITextField *Amenites;

@property (strong, nonatomic) IBOutlet UITextField *state;
@property (strong, nonatomic) IBOutlet UITextField *ContactPersonName;
@property (strong, nonatomic) IBOutlet UITextField *ContactPersonEmail;
@property (strong, nonatomic) IBOutlet UITextField *ContactPersonPhoneNumber;

@property (strong, nonatomic) IBOutlet UILabel *status;

- (IBAction)photoAlbumButtonPushed:(id)sender;

-(IBAction)saveData:(id)sender;
- (IBAction)findContact:(id)sender;

@end
