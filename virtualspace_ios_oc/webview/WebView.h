//
//  WebView.h
//  virtualspace_ios_oc
//
//  Created by koujp on 15/7/30.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
@class HWebplugin;
@interface WebView : UIWebView<UIScrollViewDelegate,UIWebViewDelegate>
@property(strong,readwrite) JSContext *jsContext;
- (WebView *)initWithFrame:(CGRect)frame;
- (WebView *)init;
- (NSString *)executeScript:(NSString *) script;
- (BOOL)registerPlugin:(HWebplugin *)plugin;
- (HWebplugin *)plugin:(NSString *)pluginName;
- (void)setAttr:(NSString *)attrName :(id)attrVal;
- (id)attr:(NSString *)attrName;
@end
