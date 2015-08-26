//
//  HStoryEditorView.m
//  virtualspace_ios_oc
//
//  Created by koujp on 15/7/29.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import "HStoryEditorView.h"
#import "WebView.h"
#import "StoryWebviewPlugin.h"
#import "StoryURLProtocol.h"
@implementation HStoryEditorView{
    @private
    WebView *webview;
    CGRect keyRect;
}
-(void)initView{
    [NSURLProtocol registerClass:[StoryURLProtocol class]];
    
    
    CGRect srect=self.frame;
    CGSize ssize=srect.size;
    CGFloat height=ssize.height;
    CGFloat width=ssize.width;
    CGRect frame=CGRectMake(0, 0, width, height);
    webview=[[WebView alloc] initWithFrame:frame];
    
    
    StoryWebviewPlugin *storyWebPlugin=[[StoryWebviewPlugin alloc] init];
    storyWebPlugin.storyEditorView=self;
    storyWebPlugin.name=@"StoryWebviewPlugin";
    [webview registerPlugin:storyWebPlugin];
    
    
    
    
    NSString *mainUrl=@"http://172.18.0.101:63342/virtualspace_resource/app/app/main/html/";
    NSString *storyUrl=@"http://172.18.0.101:63342/virtualspace_resource/app/app/story/html/demo.html";
    NSURL *url=[[NSURL alloc] initWithString:storyUrl];
    
    NSURLRequest *request=[[NSURLRequest alloc] initWithURL:url];
    
    [webview loadRequest:request];
    
    [self addSubview:webview];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardDidHideNotification object:nil];
    
    
    
}
-(void) keyboardWillHide:(NSNotification *) notification{
    NSLog(@"keyboard-hide");
    [self setKeyboardHidden:YES];
    [self resizeView];
}
-(void) keyboardWillShow:(NSNotification *) notification{
    
    NSDictionary *userinfo=notification.userInfo;
    keyRect=[[userinfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [self hideKeyboard:[self isKeyboardHidden]];
}
- (void) setKeyboardHidden:(BOOL)hidden{
    if(hidden){
        [webview setAttr:@"keyboardHidden" :@"hidden"];
    }else{
        [webview setAttr:@"keyboardHidden" :@"visible"];
    }
}
- (BOOL) isKeyboardHidden{
    NSString *keyboardHidden=[webview attr:@"keyboardHidden"];
    BOOL hidden=[keyboardHidden isEqualToString:@"hidden"];
    return hidden;
}
-(void) keyboardDidShow:(NSNotification *) notification{
    [self hideKeyboard:[self isKeyboardHidden]];
}
- (void)resizeView{
    CGRect screenRect=[[UIScreen mainScreen] bounds];
    CGFloat screenHeight=screenRect.size.height;
    CGFloat screenWidth=screenRect.size.width;
    if([self isKeyboardHidden]){
        webview.frame=CGRectMake(0,0,screenWidth,screenHeight);
    }else{
        webview.frame=CGRectMake(0,0,screenWidth,screenHeight-keyRect.size.height);
        
    }

}
-(void)hideKeyboard:(BOOL) hidden{
    for(UIWindow * window in [[UIApplication sharedApplication] windows]){
        for(UIView *view in [window subviews]){
           
            if([[view description] hasPrefix:@"<UIInputSetContainerView"]==YES){
                view.hidden=hidden;
                
            }
        }
    }
    [self resizeView];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [NSURLProtocol unregisterClass:[StoryURLProtocol class]];
}
@end
