//
//  UILabel+InPlaceEdit.h
//  InPlaceEdit
//
//  Created by kaiinui on 2014/09/12.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KIInPlaceEditController;

@interface UILabel (InPlaceEdit)

- (void)ipe_enableInPlaceEdit;

# pragma mark - Protected

- (void)ipe_edit:(id)sender;

# pragma mark - Private

@property (nonatomic, retain) KIInPlaceEditController *ipe_delegate;

@end
