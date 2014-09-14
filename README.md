![KIInPlaceEdit](https://dl.dropboxusercontent.com/u/7817937/_github/KIInPlaceEditLogo.png)
=============

![](http://img.shields.io/cocoapods/v/KIInPlaceEdit.svg?style=flat) ![](http://img.shields.io/travis/kaiinui/KIInPlaceEdit.svg?style=flat) ![](http://img.shields.io/badge/test-Unit+E2E-green.svg?style=flat)

In-place editing for UILabel.

`UILabel+InPlaceEdit.h` enables users to edit a label in the place.

<img src="https://dl.dropboxusercontent.com/u/7817937/_github/KIInPlaceEditSS1.png" width="240px" /> <img src="https://dl.dropboxusercontent.com/u/7817937/_github/KIInPlaceEdit.png" width="240px" />

Usage
---

It's few lines to enable in-place edit. Do not forget to set `userInteractionEnabled` to `YES`. Otherwise it will not work.

```objc
#import "UILabel+InPlaceEdit.h"

label.userInteractionEnabled = YES;
[label ipe_enableInPlaceEdit:[KIInPlaceEditOptions longPressAndPromptToEdit]];
```

### Options

There are some preset options.

```objc
// KIInPlaceEditOptions.h

+ (instancetype)longPressToEdit;
+ (instancetype)longPressAndPromptToEdit;
```

Available options are

```objc
@property BOOL showPrompt; // Default NO. Whether to show prompt before start in-place editing.
@property NSString *promptLabel; // Default "Edit"
@property KIInPlaceEditGesture gesture; // Currently only LongPress is provided.
```

You can provide your options as following.

```objc
KIInPlaceEditOptions *options = [[KIInPlaceEditOptions alloc] init];
options.showPrompt = YES;
options.promptLabel = "You want to edit?";
label.userInteractionEnabled = YES;
[label ipe_enableInPlaceEdit:options];
```

`UIControl` Events
---

You can receive `UIControl` events by setting options as following.

```objc
KIInPlaceEditOptions *options = [KIInPlaceEditOptions longPressAndPromptToEdit];
[options setTarget:self action:@selector(didEndInPlaceEdit:) forControlEvents:UIControlEventEditingDidEnd];
label.userInteractionEnabled = YES;
[label ipe_enableInPlaceEdit:options];

// ...

- (void)didEndInPlaceEdit:(id)sender {
    UITextField *textField = sender;
    NSLog(@"End editing with value: %@", textField.text);
}
```

For more information about UIControl Events, please refer [UIControl Class Reference](https://developer.apple.com/library/ios/documentation/uikit/reference/uicontrol_class/reference/reference.html)

Installation
---

`pod 'KIInPlaceEdit'`

Test
---

```
xcodebuild -workspace InPlaceEdit.xcworkspace -scheme InPlaceEditTests -destination 'platform=iOS Simulator,name=iPhone Retina (4-inch 64-bit)' test
```

[You can find test cases here](xcodebuild -workspace InPlaceEdit.xcworkspace -scheme InPlaceEditTests -destination 'platform=iOS Simulator,name=iPhone Retina (4-inch 64-bit)' test).

LICENSE
---

The MIT License (MIT)

Copyright (c) 2014 kaiinui

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
