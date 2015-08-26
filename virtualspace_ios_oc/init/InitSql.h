//
//  InitSql.h
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/20.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InitSql : NSObject
+ (NSString *)storyDatabasePath;
+ (void)initStoryTable;
@end
