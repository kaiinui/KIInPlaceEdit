//
//  KIInPlaceEditLongTapGestureDelegate.h
//  InPlaceEdit
//
//  Created by kaiinui on 2014/09/12.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KIInPlaceEditController : NSObject <UITextFieldDelegate>

- (instancetype)initWithLabel:(UILabel *)label;

- (void)handleGesture:(UIGestureRecognizer *)recognizer;

@end
