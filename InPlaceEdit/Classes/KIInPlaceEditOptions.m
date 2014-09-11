//
//  KIInPlaceEditOptions.m
//  InPlaceEdit
//
//  Created by kaiinui on 2014/09/12.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIInPlaceEditOptions.h"

@implementation KIInPlaceEditOptions

@synthesize showMenu, gesture;

+ (instancetype)longPress {
    KIInPlaceEditOptions *options = [[self alloc] init];
    options.gesture = KIInPlaceEditGestureLongPress;
    options.showMenu = NO;
    return options;
}

+ (instancetype)longPressWithPrompt {
    KIInPlaceEditOptions *options = [[self alloc] init];
    options.gesture = KIInPlaceEditGestureLongPress;
    options.showMenu = YES;
    return options;
}

@end
