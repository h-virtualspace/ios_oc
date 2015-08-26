//
//  URLProtocol.m
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/3.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import "StoryURLProtocol.h"
#import "StoryDao.h"
@implementation StoryURLProtocol
+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request{
    return  request;
}
+ (BOOL)canInitWithRequest:(NSURLRequest *)request{
    if([request.URL.scheme isEqualToString:@"myprotocol"] && [request.URL.host isEqualToString:@"storyimages"]){
        
        return YES;
    }
    NSString *frag=request.URL.fragment;
    NSLog([request.URL relativePath]);
    return NO;
}
- (void)startLoading{
    
    NSURL *url=self.request.URL;
    NSString *relativePath=url.relativePath;
    NSArray *paths=[relativePath componentsSeparatedByString:@"/"];
    NSString *imgId=[paths objectAtIndex:1];
    if(imgId==nil){
        return;
    }
    
    NSData *data=[[StoryDao sharedStoryDao] image:imgId];
    
    NSURLResponse *resp=[[NSURLResponse alloc] initWithURL:url MIMEType:@"image/jpeg" expectedContentLength:data.length textEncodingName:nil];
    
    [[self client] URLProtocol:self didReceiveResponse:resp cacheStoragePolicy:NSURLCacheStorageNotAllowed];
    
    [[self client] URLProtocol:self didLoadData:data];
    
    [[self client] URLProtocolDidFinishLoading:self];
}
- (void)stopLoading{
    
}
@end
