//
//  HWebView.m
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/6.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import "HWebView.h"

@implementation KWebView
- (KWebView *)initWithFrame:(CGRect)frame{
    KWebView *webview=[super initWithFrame:frame];
    if(webview!=nil){
        [self initWebview];
    }
    return webview;
}
- (instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration{
    KWebView *webview=[super initWithFrame:frame configuration:configuration];
    if(webview!=nil){
        [self initWebview];
    }
    return webview;
}
- (KWebView *)init{
    KWebView *webview=[super init];
    if(webview!=nil){
        [self initWebview];
    }
    return webview;
}
- (KWebView *)initWithCoder:(NSCoder *)coder{
    KWebView *webview=[super initWithCoder:coder];
    if(webview!=nil){
        [self initWebview];
    }
    return webview;
}
-(void)initWebview{
    
    
    self.scrollView.alwaysBounceVertical=NO;
    
    self.scrollView.backgroundColor=[UIColor redColor];
    
    self.scrollView.scrollEnabled=NO;
    self.scrollView.delegate=self;
    
    self.scrollView.bounces=NO;
    
    self.navigationDelegate=self;
    
}
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    return YES;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    scrollView.contentOffset=CGPointZero;
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    decisionHandler(WKNavigationResponsePolicyAllow);
    NSHTTPURLResponse *resp=(NSHTTPURLResponse *)navigationResponse.response;
    
    
    
    NSLog(@"new url:%@",navigationResponse.response.URL.absoluteString);
}
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
}
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
}
@end
