//
//  HResponse.h
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/15.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HResponse : NSObject
@property(strong,readwrite) NSString *data;
@property(strong,readwrite) NSString *error;
@end
