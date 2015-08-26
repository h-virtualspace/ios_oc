//
//  HRequest.h
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/12.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HRequest : NSObject
@property(strong,readwrite) NSString *namespace;
@property(strong,readwrite) NSString *method;
@property(strong,readwrite) NSString *callback;
@property(strong,readwrite) NSArray *params;
+ (HRequest *) initWithDictionary:(NSDictionary *)dictionary;
@end
