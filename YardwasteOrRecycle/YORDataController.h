//
//  YORDataController.h
//  YardwasteOrRecycle
//
//  Created by Shyam Harabakada on 3/9/13.
//  Copyright (c) 2013 moii. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface YORDataController : NSObject {
    NSString *version;
    NSString *accountNumber;
    NSString *dataCache;
    NSString *dataCacheTimestamp;
}

@property (copy, nonatomic) NSString *version;
@property (copy, nonatomic) NSString *accountNumber;
@property (copy, nonatomic) NSString *dataCache;
@property (copy, nonatomic) NSString *dataCacheTimestamp;

@end
