//
//  WebNativeApi.m
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/11.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import "WebNativeApi.h"
#import "HRequest.h"
#import "HWebplugin.h"
@implementation WebNativeApi
- (NSString *)sendRequest:(NSDictionary *)requestObj{
    HRequest *hrequest=[HRequest initWithDictionary:requestObj];
    return [HWebplugin execute:hrequest :self.webview];
}
@end
