//
//  UILabel+InPlaceEdit.h
//  InPlaceEdit
//
//  Created by kaiinui on 2014/09/12.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KIInPlaceEditOptions.h"

@interface UILabel (InPlaceEdit)

/**
 *  Call this method with options to enable In-place editing.
 *
 *  There are some preset options. In example, you can enable in-place editing as following.
 *
 *      [label ipe_enableInPlaceEdit:[KIInPlaceEditOptions longPressAndPromptToEdit]];
 *
 *  For more information, see `KIInPlaceEditOptions`.
 *
 *  @param option see KIInPlaceEditOptions
 *  @see KIInPlaceEditOptions
 */
- (void)ipe_enableInPlaceEdit:(KIInPlaceEditOptions *)option;

@end
