//
//  HRequest.m
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/12.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import "HRequest.h"

@implementation HRequest
+ (HRequest *) initWithDictionary:(NSDictionary *)dictionary{
    HRequest *hrequest=[[HRequest alloc] init];
    NSString *name=[dictionary objectForKey:@"name"];
    NSArray *names=[name componentsSeparatedByString:@"."];
    hrequest.namespace=names[0];
    hrequest.method=names[1];
    
    hrequest.params=[dictionary objectForKey:@"params"];
    hrequest.callback=[dictionary objectForKey:@"callback"];
    return hrequest;
}
@end
