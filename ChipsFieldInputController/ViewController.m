#import <UIKit/UIKit.h>
#import "MaterialChips.h"

static const CGFloat kVerticalPadding = 100;

@interface ViewController : UIViewController

@end

@interface ViewController () <MDCChipFieldDelegate>

@property (nonatomic) MDCChipField *chipField;
@property (nonatomic) MDCTextInputControllerUnderline *textInputController;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    
    self.chipField = [[MDCChipField alloc] initWithFrame:CGRectZero];
    self.chipField.delegate = self;
    self.chipField.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.chipField.textField.placeholder = @"Placeholder";
    self.textInputController = [[MDCTextInputControllerUnderline alloc] initWithTextInput:self.chipField.textField];
    self.chipField.layer.borderColor = [UIColor redColor].CGColor;
    self.chipField.layer.borderWidth = 4;
    [self updateChipFieldFrame];
    [self.view addSubview:self.chipField];
}

- (void)chipFieldHeightDidChange:(MDCChipField *)chipField {
    NSLog(@"Chip field height did change");
    [self updateChipFieldFrame];
}

- (void)updateChipFieldFrame {
    CGRect safeRect = UIEdgeInsetsInsetRect(self.view.bounds, self.view.safeAreaInsets);
    CGSize sizeThatFits = [self.chipField sizeThatFits:CGSizeMake(safeRect.size.width, safeRect.size.height - kVerticalPadding * 2)];
    NSLog(@"Chip field sizeThatFits: %@",
          NSStringFromCGSize([self.chipField sizeThatFits:CGSizeMake(self.view.bounds.size.width, 200)]));
    self.chipField.frame = CGRectMake(0, kVerticalPadding, sizeThatFits.width, sizeThatFits.height);
}

@end
