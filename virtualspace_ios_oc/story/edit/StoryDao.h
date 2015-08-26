//
//  StoryDao.h
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/17.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
@interface StoryDao : NSObject
+ (StoryDao *)sharedStoryDao;
- (NSString *)saveStoryImageData :(NSData *)data;
- (NSData *)image :(NSString *)imageId;
@end
