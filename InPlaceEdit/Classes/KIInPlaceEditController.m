//
//  KIInPlaceEditLongTapGestureDelegate.m
//  InPlaceEdit
//
//  Created by kaiinui on 2014/09/12.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIInPlaceEditController.h"

#import "UILabel+InPlaceEdit.h"
#import "UILabel+InPlaceEditPrivate.h"

@interface KIInPlaceEditController ()

@property (nonatomic, weak) UILabel *label;

@end

@implementation KIInPlaceEditController

# pragma mark - Lifecycle

- (instancetype)initWithLabel:(UILabel *)label {
    self = [super init];
    if (self) {
        self.label = label;
    }
    return self;
}

# pragma mark - UIGestureRecognizer

/**
 *  Will be targeted in `UILabel+InPlaceEdit.m` on initialization.
 */
- (void)handleGesture:(UIGestureRecognizer *)recognizer {
    if (recognizer.state != UIGestureRecognizerStateBegan) { return; }
    
    if (self.label.ipe_option.showPrompt == YES) {
        [self showMenuWithEditItemForView:recognizer.view];
    } else {
        [self.label ipe_edit:nil]; // Bit dirty...
    }
}

# pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (!textField) { return NO; }
    self.label.text = textField.text;
    [self.label sizeToFit];
    [textField resignFirstResponder]; // Stop focusing.
    [textField removeFromSuperview];
    return NO;
}

# pragma mark - Helpers (Dynamic Sized TextField)

/**
 *  Should be targeted with `UIControlEventEditingChanged`.
 *  This method fits the text field and the label with their text.
 */
- (IBAction)textFieldDidChange:(UITextField *)textField {
    NSString *value = textField.text;
    // @see http://stackoverflow.com/questions/19145078/ios-7-sizewithattributes-replacement-for-sizewithfontconstrainedtosize
    CGSize newSize = [value sizeWithAttributes:@{NSFontAttributeName: textField.font}];
    
    CGRect textFrame = textField.frame;
    textFrame.size = newSize;
    textField.frame = textFrame;
    
    CGRect labelFrame = self.label.frame;
    labelFrame.size = newSize;
    self.label.frame = labelFrame;
}

# pragma mark - Helpers (UIMenuController)

- (void)showMenuWithEditItemForView:(UIView *)view {
    // @see http://nshipster.com/uimenucontroller/
    [view becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    UIMenuItem *editItem = [[UIMenuItem alloc] initWithTitle:self.label.ipe_option.promptLabel action:@selector(ipe_edit:)];
    [menu setMenuItems:@[editItem]];
    [menu setTargetRect:view.frame inView:view.superview];
    [menu setMenuVisible:YES animated:YES];
}

@end
