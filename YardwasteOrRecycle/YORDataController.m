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
    NSString* url = [NSString stringWithFormat:@"http://www.seattle.gov/UTIL/WARP/CollectionCalendar/GetCollectionDays?pAccount=%@&pAddress=&start=%@",
                     @"2-241443-168844", // replace with users's account number
                     @"1362874083"]; // replace with today's date value
                     
    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSArray* collectionDates = [NSJSONSerialization JSONObjectWithData:data
                          options:NSJSONReadingMutableContainers error:&error];

    return self;
}

@end
