//
//  UILabel+InPlaceEdit.m
//  InPlaceEdit
//
//  Created by kaiinui on 2014/09/12.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "UILabel+InPlaceEdit.h"

#import <objc/runtime.h>

#import "KIInPlaceEditController.h"
#import "UILabel+InPlaceEditPrivate.h"

@implementation UILabel (InPlaceEdit)

- (void)ipe_enableInPlaceEdit:(KIInPlaceEditOptions *)option {
    self.ipe_option = option;
    [self initializeInPlaceEditController];
    [self initializeGesture];
}

# pragma mark - UIResponder

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return (action == @selector(ipe_edit:));
}

# pragma mark - Helpers (Initialization)

- (void)initializeInPlaceEditController {
    self.ipe_controller = [[KIInPlaceEditController alloc] initWithLabel:self];
}

- (void)initializeGesture {
    UIGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self.ipe_controller action:@selector(handleGesture:)];
    [self addGestureRecognizer:recognizer];
}

@end
