//
//  HWebplugin.h
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/14.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HRequest.h"
#import "WebView.h"
@interface HWebplugin : NSObject
//插件名称
@property(strong,readwrite) NSString *name;
+ (NSString *) execute:(HRequest *)hrequest :(WebView *)webview;

@end
