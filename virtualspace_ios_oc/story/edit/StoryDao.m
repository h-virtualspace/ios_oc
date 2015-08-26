//
//  StoryDao.m
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/17.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import "StoryDao.h"
#import "FMDatabase.h"
#import "NSString+UUID.h"
#import "InitSql.h"
@implementation StoryDao
static FMDatabaseQueue *fmdbQueue;
+ (StoryDao *)sharedStoryDao{
    static dispatch_once_t once_t;
    static StoryDao *dao=nil;
    dispatch_once(&once_t, ^{
        dao=[[StoryDao alloc] init];
        fmdbQueue=[[FMDatabaseQueue alloc] initWithPath:[InitSql storyDatabasePath]];
    });
    return dao;
}
- (NSData *)image :(NSString *)imageId{
    NSString *sql=[NSString stringWithFormat:@"select content from story_img_res where hid='%@'",imageId];
    __block NSData *data;
    [fmdbQueue inDatabase:^(FMDatabase *db){
        FMResultSet *rs=[db executeQuery:sql];
        if(rs.next){
            data=[rs dataForColumn:@"content"];
        }
        [rs close];
    }];
    return data;
}
- (NSString *)insertImage :(NSData *)data{
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger time = [zone secondsFromGMTForDate:date];
    NSString *insertSql=@"insert into story_img_res(hid,content,create_time) values(?,?,?)";
    NSString *imageId=[NSString UUIDString];
    NSLog(@"uuid---------- is:%@",imageId);
    
    [fmdbQueue inTransaction:^(FMDatabase *db,BOOL *rollback){
        [db executeUpdate:insertSql,imageId,data,[NSNumber numberWithInteger:time]];
        
    }];
    return imageId;
}
- (NSString *)saveStoryImageData :(NSData *)data{
    return [self insertImage:data];
}
-(void)dealloc{
    [fmdbQueue close];
}
@end
