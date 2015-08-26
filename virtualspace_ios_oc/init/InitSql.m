//
//  InitSql.m
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/20.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import "InitSql.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
@implementation InitSql
+ (NSString *)storyDatabasePath{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    
    NSString *path=[paths objectAtIndex:0];
    path=[path stringByAppendingPathComponent:@"/store"];
    
    [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    
    NSString *dbPath=[path stringByAppendingPathComponent:@"agohere.db"];
    NSLog(@"dbpath----%@",dbPath);
    return dbPath;
}
+ (void)initStoryTable{
    NSString *dbPath=[InitSql storyDatabasePath];
    
    NSLog(@"dbpath----%@",dbPath);
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if (![db open]) {
        NSLog(@"FMDatabase open error!");
    }
    NSString *tableName=@"story_img_res";
    NSString *createSql=[NSString stringWithFormat:@"create table %@(hid TEXT PRIMARY KEY,content BLOB,create_time INTEGER)",tableName];
    
    if([db tableExists:tableName]){
        return;
    }
    [db beginTransaction];
    [db executeUpdate:createSql];
    [db commit];
    [db close];
    
}
@end
