//
//  KIInPlaceEditLongTapGestureDelegate.m
//  InPlaceEdit
//
//  Created by kaiinui on 2014/09/12.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIInPlaceEditLongTapGestureDelegate.h"

#import "UILabel+InPlaceEdit.h"

@implementation KIInPlaceEditLongTapGestureDelegate

# pragma mark - UIGestureRecognizer

- (void)handleLongPressGesture:(UIGestureRecognizer *)recognizer {
    if (recognizer.state != UIGestureRecognizerStateBegan) { return; }
    
    [self showMenuWithEditItemForView:recognizer.view];
}

# pragma mark - Helpers (UIMenuController)

- (void)showMenuWithEditItemForView:(UIView *)view {
    // @see http://nshipster.com/uimenucontroller/
    [view becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    UIMenuItem *editItem = [[UIMenuItem alloc] initWithTitle:@"Edit" action:@selector(ipe_edit:)]; // TODO: make it i18n-able.
    [menu setMenuItems:@[editItem]];
    [menu setTargetRect:view.frame inView:view.superview];
    [menu setMenuVisible:YES animated:YES];
}

@end
