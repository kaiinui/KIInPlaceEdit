//
//  KIViewController.m
//  InPlaceEdit
//
//  Created by kaiinui on 2014/09/12.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIViewController.h"

#import "UILabel+InPlaceEdit.h"

@interface KIViewController ()

@end

@implementation KIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UILabel *label = (UILabel *)[self.view viewWithTag:1];
    label.userInteractionEnabled = YES;
    [label ipe_enableInPlaceEdit:[KIInPlaceEditOptions longPressAndPromptToEdit]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
