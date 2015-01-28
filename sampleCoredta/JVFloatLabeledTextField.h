

#import <UIKit/UIKit.h>

@interface JVFloatLabeledTextField : UITextField

@property (nonatomic, strong, readonly) UILabel * floatingLabel;
@property (nonatomic, strong) NSNumber * floatingLabelYPadding UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIFont * floatingLabelFont UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor * floatingLabelTextColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor * floatingLabelActiveTextColor UI_APPEARANCE_SELECTOR; // tint color is used by default if not provided
@property (nonatomic, assign) NSInteger animateEvenIfNotFirstResponder UI_APPEARANCE_SELECTOR; // Can't use BOOL for UI_APPEARANCE. Non-zero == YES


- (void)setLabelOriginForTextAlignment;
- (void)hideFloatingLabel:(BOOL)animated;
- (void)showFloatingLabel:(BOOL)animated;
@end
