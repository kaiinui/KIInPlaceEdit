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

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *someLabel;

@end

@implementation KIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label.userInteractionEnabled = YES;
    KIInPlaceEditOptions *options = [KIInPlaceEditOptions longPressAndPromptToEdit];
    [options setTarget:self action:@selector(inPlaceTextFieldEvent:) forControlEvents:UIControlEventEditingDidEnd];
    [self.label ipe_enableInPlaceEdit:options];
}

- (void)inPlaceTextFieldEvent:(id)sender {
    UITextField *field = sender;
    
    self.someLabel.text = [NSString stringWithFormat:@"value = %@", field.text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
