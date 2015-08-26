//
//  FMDatabase+table.m
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/18.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import "FMDatabase+table.h"
@implementation FMDatabase(table)
- (BOOL)tableExist :(NSString *)tableName {
    NSString *sql=[NSString stringWithFormat:@"select count(*) as ncount from %@",tableName];
    FMResultSet *rs=[self executeQuery:sql];
    if([rs next]){
        int count=[rs intForColumn:@"ncount"];
        if(count>0){
            return YES;
        }
    }
    [rs close];
    return NO;
}
@end
