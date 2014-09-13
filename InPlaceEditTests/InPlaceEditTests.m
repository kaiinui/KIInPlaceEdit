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
    UILabel *testLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"test"];
    
    [tester longPressViewWithAccessibilityLabel:@"Label" value:nil duration:0.5f];
    [tester tapViewWithAccessibilityLabel:@"Edit"]; // UIMenu Edit
    [tester enterTextIntoCurrentFirstResponder:@"Hi! Test!"];
    [tester tapViewWithAccessibilityLabel:@"return"]; // Keyboard return
    
    it(@"should catch editEnd event and set text to the test label", ^{
        expect(testLabel.text).to.equal(@"value = LabelHi! Test!");
    });
});

SpecEnd