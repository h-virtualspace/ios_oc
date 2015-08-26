//
//  WebView.m
//  virtualspace_ios_oc
//
//  Created by koujp on 15/7/30.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import "WebView.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "WebNativeApi.h"
#import "HWebplugin.h"
@implementation WebView{
    @private
    NSMutableDictionary *webpluginCache;
    NSMutableDictionary *webviewProps;
}
- (WebView *)initWithFrame:(CGRect)frame{
    WebView *webview=[super initWithFrame:frame];
    if(webview!=nil){
        [self initWebview];
    }
    return webview;
}
- (WebView *)init{
    WebView *webview=[super init];
    if(webview!=nil){
        [self initWebview];
    }
    return webview;
}
- (WebView *)initWithCoder:(NSCoder *)coder{
    WebView *webview=[super initWithCoder:coder];
    if(webview!=nil){
        [self initWebview];
    }
    return webview;
}
- (void)setAttr:(NSString *)attrName :(id)attrVal{
    if(webviewProps==nil){
        webviewProps=[[NSMutableDictionary alloc] init];
    }
    [webviewProps setObject:attrVal forKey:attrName];
}
- (id)attr:(NSString *)attrName{
    if(webviewProps==nil){
        return nil;
    }
    return [webviewProps objectForKey:attrName];
}
- (BOOL)registerPlugin:(HWebplugin *)plugin{
    if(webpluginCache==nil){
        webpluginCache=[[NSMutableDictionary alloc] init];
    }
    if([webpluginCache objectForKey:plugin.name]!=nil){
        return NO;
    }
    [webpluginCache setObject:plugin forKey:plugin.name];
    return YES;
}
- (HWebplugin *)plugin:(NSString *)pluginName{
    if(webpluginCache==nil){
        return nil;
    }
    return [webpluginCache objectForKey:pluginName];
}
-(void)initWebview{
    [self initScriptContext];
    self.scrollView.alwaysBounceVertical=NO;
    
    self.scrollView.backgroundColor=[UIColor redColor];
    
    self.scrollView.scrollEnabled=NO;
    self.scrollView.delegate=self;
    
    self.scrollView.bounces=NO;
    
    self.keyboardDisplayRequiresUserAction=YES;
    self.delegate=self;
    
}
- (NSString *)executeScript:(NSString *) script{
    //JSValue *result=[self.jsContext evaluateScript:script];
    NSString *result=[self stringByEvaluatingJavaScriptFromString:script];
    return result;
    //return [result toString];
}
- (void)initScriptContext{
    self.jsContext=[self valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    WebNativeApi *nativeApi=[[WebNativeApi alloc] init];
    nativeApi.webview=self;
    self.jsContext[@"IosJsNativeBridge"]=nativeApi;
    
    
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    return YES;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    scrollView.contentOffset=CGPointZero;
}

@end
