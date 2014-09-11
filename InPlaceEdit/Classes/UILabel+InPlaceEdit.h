//
//  UILabel+InPlaceEdit.h
//  InPlaceEdit
//
//  Created by kaiinui on 2014/09/12.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KIInPlaceEditLongTapGestureDelegate;

@interface UILabel (InPlaceEdit)

- (void)ipe_enableInPlaceEdit;

# pragma mark - Private

@property (nonatomic, retain) KIInPlaceEditLongTapGestureDelegate *ipe_delegate;

@end
