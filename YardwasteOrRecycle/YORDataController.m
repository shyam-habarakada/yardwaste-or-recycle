//
//  YORDataController.m
//  YardwasteOrRecycle
//
//  Created by Shyam Harabakada on 3/9/13.
//  Copyright (c) 2013 moii. All rights reserved.
//

#import "YORDataController.h"

@implementation YORDataController

@synthesize version = _version;
@synthesize accountNumber = _accountNumber;
@synthesize dataCache = _dataCache;
@synthesize dataCacheTimestamp = _dataCacheTimestamp;

-(id)init
{
    self = [super init];
    return self;
}

@end
