//
//  StoryWebviewPlugin.h
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/12.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HWebplugin.h"
#import "HStoryEditorView.h"
@class HRequest;
@class WebView;
@interface StoryWebviewPlugin : HWebplugin
@property HStoryEditorView *storyEditorView;
- (void)setKeyboardHidden:(HRequest *)hrequest :(WebView *)webview;
- (void)imagePreview:(HRequest *)hrequest :(WebView *)webview;
@end
