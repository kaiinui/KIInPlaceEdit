#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>
#import <KIF.h>

#import "UILabel+InPlaceEdit.h"
#import "KIViewController.h"

SpecBegin(UILabel)

describe(@"UILabel+InPlaceEdit", ^{
    
});

SpecEnd

SpecBegin(KIViewController)

describe(@"KIViewController", ^{
    [tester longPressViewWithAccessibilityLabel:@"Label" value:nil duration:0.5f];
    [tester tapViewWithAccessibilityLabel:@"Edit"];
    [tester enterTextIntoCurrentFirstResponder:@"Hi! Test!"];
    [tester tapViewWithAccessibilityLabel:@"return"];
});

SpecEnd