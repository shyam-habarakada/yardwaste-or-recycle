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

    NSError* error;
    NSURL* url = [NSURL URLWithString:@"http://www.seattle.gov/UTIL/WARP/CollectionCalendar/GetCollectionDays?pAccount=2-241443-168844&pAddress=&start=1362874083"];
    NSData* data = [NSData dataWithContentsOfURL:url];
    NSArray* collectionDates = [NSJSONSerialization JSONObjectWithData:data
                          options:NSJSONReadingMutableContainers error:&error];

    return self;
}

@end
