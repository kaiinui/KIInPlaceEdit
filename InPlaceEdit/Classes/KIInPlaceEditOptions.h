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

# pragma mark - UIControl Events

/**
 *  A target of UIControl action by UITextField which is dynamically generated while in-place editing. It should be set with action, events.
 *  KIInPlaceEdit will set this target to UITextField.
 *  @see https://developer.apple.com/library/ios/documentation/uikit/reference/uicontrol_class/reference/reference.html#//apple_ref/occ/instm/UIControl/addTarget:action:forControlEvents:
 */
@property id target;

/**
 *  A selector of UIControl action by UITextField which is dynamically generated while in-place editing. It should be set with target, events.
 *  @see https://developer.apple.com/library/ios/documentation/uikit/reference/uicontrol_class/reference/reference.html#//apple_ref/occ/instm/UIControl/addTarget:action:forControlEvents:
 */
@property SEL action;

/**
 *  UIControl events you want to catch. It should be set with target, action.
 *  @see https://developer.apple.com/library/ios/documentation/uikit/reference/uicontrol_class/reference/reference.html#//apple_ref/occ/instm/UIControl/addTarget:action:forControlEvents:
 */
@property UIControlEvents events;

# pragma mark - Presets

/**
 *  Returns the preset option which start in-place editing with long press.
 */
+ (instancetype)longPressToEdit;

/**
 *  Returns the preset option which start in-place editing with long press and prompt.
 */
+ (instancetype)longPressAndPromptToEdit;

# pragma mark - Instance Public

- (void)setTarget:(id)target action:(SEL)selector forControlEvents:(UIControlEvents)events;

@end
