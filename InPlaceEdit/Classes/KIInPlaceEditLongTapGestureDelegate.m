//
//  KIInPlaceEditLongTapGestureDelegate.m
//  InPlaceEdit
//
//  Created by kaiinui on 2014/09/12.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIInPlaceEditLongTapGestureDelegate.h"

@implementation KIInPlaceEditLongTapGestureDelegate

# pragma mark - UIGestureRecognizer

- (void)handleLongPressGesture:(UIGestureRecognizer *)recognizer {
    if (recognizer.state != UIGestureRecognizerStateBegan) { return; }
    
    NSLog(@"whoa");
    
    [recognizer.view becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setTargetRect:recognizer.view.frame inView:recognizer.view.superview];
    [menu setMenuVisible:YES animated:YES];
}

@end
