//
//  WebNativeApi.h
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/11.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "WebView.h"
@protocol WebJsExport<JSExport>
- (NSString *)sendRequest:(NSDictionary *)requestObj;
@end
@interface WebNativeApi : NSObject<WebJsExport>
@property(weak) WebView *webview;

@end
