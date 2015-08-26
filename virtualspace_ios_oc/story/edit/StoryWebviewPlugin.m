//
//  StoryWebviewPlugin.m
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/12.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import "StoryWebviewPlugin.h"
#import "StoryImgPickerViewCtrl.h"
@implementation StoryWebviewPlugin
- (void)setKeyboardHidden:(HRequest *)hrequest :(WebView *)webview{
    NSString *hidden=[hrequest.params objectAtIndex:0];
    
    [webview setAttr:@"keyboardHidden":hidden];
    [self.storyEditorView hideKeyboard:[hidden isEqualToString:@"hidden"]];
}
- (void)imagePreview:(HRequest *)hrequest :(WebView *)webview{
    StoryImgPickerViewCtrl *imageView = [StoryImgPickerViewCtrl initWithDefault];
    UIViewController *rootViewCtrl=[[UIApplication sharedApplication] keyWindow].rootViewController;
    [webview resignFirstResponder];
    imageView.webview=webview;
    [imageView show:rootViewCtrl];
}
@end
