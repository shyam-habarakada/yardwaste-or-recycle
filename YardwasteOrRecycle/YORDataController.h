//
//  YORDataController.h
//  YardwasteOrRecycle
//
//  Created by Shyam Harabakada on 3/9/13.
//  Copyright (c) 2013 moii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YORDataController : NSObject

@property (copy, nonatomic) NSString *version;
@property (copy, nonatomic) NSString *accountNumber;
@property (copy, nonatomic) NSString *dataCache;
@property (copy, nonatomic) NSString *dataCacheTimestamp;

@end
