//
//  KIInPlaceEditOptions.h
//  InPlaceEdit
//
//  Created by kaiinui on 2014/09/12.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, KIInPlaceEditGesture) {
    KIInPlaceEditGestureLongPress
};

/**
 *  This class enables you to provide options to In-place editing.
 */
@interface KIInPlaceEditOptions : NSObject

/**
 *  Whether to show UIMenu prompt after the gesture to edit.
 */
@property BOOL showPrompt;

/**
 *  The label of a prompt which will be shown if you set `showPrompt` to `YES`.
 *  Default value is "Edit".
 */
@property NSString *promptLabel;

/**
 *  Gesture to start in-place editing.
 */
@property KIInPlaceEditGesture gesture;

/**
 *  Returns the preset option which start in-place editing with long press.
 */
+ (instancetype)longPressToEdit;

/**
 *  Returns the preset option which start in-place editing with long press and prompt.
 */
+ (instancetype)longPressAndPromptToEdit;

@end
