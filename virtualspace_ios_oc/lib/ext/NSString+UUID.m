//
//  String+UUID.m
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/19.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import "NSString+UUID.h"

@implementation NSString(UUID)
+ (NSString *)UUIDString{
    CFUUIDRef ref=CFUUIDCreate(nil);
    CFStringRef stringRef=CFUUIDCreateString(nil, ref);
    
    NSString *uuidString = (__bridge_transfer NSString*)stringRef;
    return uuidString;
}
@end
