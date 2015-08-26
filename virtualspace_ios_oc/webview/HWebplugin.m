//
//  HWebplugin.m
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/14.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import "HWebplugin.h"
#import "WebView.h"
#import "HResponse.h"
@implementation HWebplugin
+ (NSString *) execute:(HRequest *)hrequest :(WebView *)webview{
    NSString *method=hrequest.method;
    NSString *callback=hrequest.callback;
    NSString *namespace=hrequest.namespace;
    HWebplugin *plugin=[webview plugin:namespace];
    if(nil==plugin){
        return nil;
    }
     NSString *methodSel=[NSString stringWithFormat:@"%@::",method];
    if([plugin respondsToSelector:NSSelectorFromString(methodSel)]==NO){
        return nil;
    }
   
    
    id resp=[plugin performSelector:NSSelectorFromString(methodSel) withObject:hrequest withObject:webview];
    NSString *data,*error;
    if([resp isKindOfClass:[HResponse class]]){
        HResponse *response=resp;
        data=response.data;
        error=response.error;
    }
    
    if(callback!=nil){
        [webview executeScript:[NSString stringWithFormat:@"HJsApp.executeCallback('%@','%@','%@')",callback,data,error]];
    }
    if(data!=nil){
        return data;
    }
    return error;
}
@end
