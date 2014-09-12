//
//  KIInPlaceEditOptions.m
//  InPlaceEdit
//
//  Created by kaiinui on 2014/09/12.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIInPlaceEditOptions.h"

@implementation KIInPlaceEditOptions

@synthesize showPrompt, promptLabel, gesture;

# pragma mark - Lifecycle

- (instancetype)init {
    self = [super init];
    if (self) {
        self.promptLabel = @"Edit";
    }
    return self;
}

# pragma mark - Presets

+ (instancetype)longPressToEdit {
    KIInPlaceEditOptions *options = [[self alloc] init];
    options.gesture = KIInPlaceEditGestureLongPress;
    options.showPrompt = NO;
    return options;
}

+ (instancetype)longPressAndPromptToEdit {
    KIInPlaceEditOptions *options = [[self alloc] init];
    options.gesture = KIInPlaceEditGestureLongPress;
    options.showPrompt = YES;
    return options;
}

# pragma mark - UIControl Events

- (void)setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)events {
    self.target = target;
    self.action = action;
    self.events = events;
}

@end
