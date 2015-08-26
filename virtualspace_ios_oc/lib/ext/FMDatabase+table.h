//
//  FMDatabase+table.h
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/18.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
@interface FMDatabase(table)
- (BOOL)tableExist :(NSString *)tableName;
@end
