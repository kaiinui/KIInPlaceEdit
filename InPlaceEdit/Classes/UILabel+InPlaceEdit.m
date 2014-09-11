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

# pragma mark - UIMenu Custom Item

- (void)ipe_edit:(id)sender {
    NSString *text = self.text;
    self.text = @"";
    
    [self initializeTextFieldWithText:text];
}

# pragma mark - Helpers (In Place Edit)

- (void)initializeTextFieldWithText:(NSString *)text {
    UITextField *field = [[UITextField alloc] initWithFrame:self.bounds];
    field.text = text;
    field.delegate = self.ipe_delegate;
    [self addSubview:field];
    [field becomeFirstResponder]; // Focus on the text field.
}

# pragma mark - Helpers (Gesture)

- (void)initializeLongPressGestureDelegate {
    self.ipe_delegate = [[KIInPlaceEditController alloc] initWithLabel:self];
}

- (void)initializeLongPressGesture {
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self.ipe_delegate action:@selector(handleLongPressGesture:)];
    [self addGestureRecognizer:recognizer];
}

# pragma mark - Private

@dynamic ipe_delegate;

- (KIInPlaceEditController *)ipe_delegate {
    return objc_getAssociatedObject(self, @selector(ipe_delegate));
}

- (void)setIpe_delegate:(KIInPlaceEditController *)ipe_delegate {
    objc_setAssociatedObject(self, @selector(ipe_delegate), ipe_delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
