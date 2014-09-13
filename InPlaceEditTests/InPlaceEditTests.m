#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>
#import <KIF.h>

#import "UILabel+InPlaceEditPrivate.h"
#import "UILabel+InPlaceEdit.h"
#import "KIInPlaceEditController.h"
#import "KIInPlaceEditOptions.h"

#import "KIViewController.h"

SpecBegin(UILabel)

describe(@"UILabel+InPlaceEdit", ^{
    UILabel *label = [[UILabel alloc] init];
    
    describe(@"- ipe_controller", ^{
        describe(@"AssociatedObjects", ^{
            it(@"should set & get controller", ^{
                KIInPlaceEditController *controller = [[KIInPlaceEditController alloc] init];
                label.ipe_controller = controller;
                expect(label.ipe_controller).to.equal(controller);
            });
            
            it(@"should set & get options", ^{
                KIInPlaceEditOptions *options = [KIInPlaceEditOptions longPressAndPromptToEdit];
                label.ipe_option = options;
                expect(label.ipe_option).to.equal(options);
            });
        });
    });
});

SpecEnd

SpecBegin(KIInPlaceEditOptions)

describe(@"KIInPlaceEditOptions", ^{
    describe(@"preset options", ^{
        it(@"- longPress", ^{
            KIInPlaceEditOptions *options = [KIInPlaceEditOptions longPressToEdit];
            expect(options.gesture).to.equal(KIInPlaceEditGestureLongPress);
            expect(options.showPrompt).to.equal(NO);
        });
        
        it(@"- longPressAndPromptToEdit", ^{
            KIInPlaceEditOptions *options = [KIInPlaceEditOptions longPressAndPromptToEdit];
            expect(options.gesture).to.equal(KIInPlaceEditGestureLongPress);
            expect(options.showPrompt).to.equal(YES);
        });
    });
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