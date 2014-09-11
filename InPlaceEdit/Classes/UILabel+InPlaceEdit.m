//
//  UILabel+InPlaceEdit.m
//  InPlaceEdit
//
//  Created by kaiinui on 2014/09/12.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "UILabel+InPlaceEdit.h"

#import <objc/runtime.h>

#import "KIInPlaceEditLongTapGestureDelegate.h"

@implementation UILabel (InPlaceEdit)

- (void)ipe_enableInPlaceEdit {
    [self initializeLongPressGestureDelegate];
    [self initializeLongPressGesture];
}

# pragma mark - UIResponder

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return (action == @selector(ipe_edit:));
}

# pragma mark - UIResponderStandardEditActions

- (void)copy:(id)sender {
    [[UIPasteboard generalPasteboard] setString:self.text];
}

# pragma mark - UIMenu Custom Item

- (void)ipe_edit:(id)sender {
    NSString *text = self.text;
    self.text = @"";
    
    UITextField *field = [[UITextField alloc] initWithFrame:self.bounds];
    field.text = text;
    [self addSubview:field];
    [field becomeFirstResponder];
}

# pragma mark - Helpers (Gesture)

- (void)initializeLongPressGestureDelegate {
    self.ipe_delegate = [[KIInPlaceEditLongTapGestureDelegate alloc] init];
}

- (void)initializeLongPressGesture {
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self.ipe_delegate action:@selector(handleLongPressGesture:)];
    [self addGestureRecognizer:recognizer];
}

# pragma mark - Private

@dynamic ipe_delegate;

- (KIInPlaceEditLongTapGestureDelegate *)ipe_delegate {
    return objc_getAssociatedObject(self, @selector(ipe_delegate));
}

- (void)setIpe_delegate:(KIInPlaceEditLongTapGestureDelegate *)ipe_delegate {
    objc_setAssociatedObject(self, @selector(ipe_delegate), ipe_delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
