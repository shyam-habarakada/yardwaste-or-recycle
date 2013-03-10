//
//  YORDataController.m
//  YardwasteOrRecycle
//
//  Created by Shyam Harabakada on 3/9/13.
//  Copyright (c) 2013 moii. All rights reserved.
//

#import "YORDataController.h"

// private methods
@interface YORDataController ()
-(BOOL)isRecycleInTitle:(NSString*)title;
@end

@implementation YORDataController

@synthesize version = _version;
@synthesize accountNumber = _accountNumber;
@synthesize nextCollectionDate = _nextCollectionDate;
@synthesize nextCollectionIsYardwaste = _nextCollectionIsYardwaste;
@synthesize dataCache = _dataCache;
@synthesize dataCacheTimestamp = _dataCacheTimestamp;

-(void)fetchData
{
    NSError* error;
    NSDate* today = [NSDate date];
    NSString* url = [NSString stringWithFormat:@"http://www.seattle.gov/UTIL/WARP/CollectionCalendar/GetCollectionDays?pAccount=%@&pAddress=&start=%d",
                     @"2-241443-168844", // replace with users's account number
                     (int)[today timeIntervalSince1970]];
    DLog(@"url: %@", url);
    
    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSArray* collectionDates = [NSJSONSerialization JSONObjectWithData:data
                                options:NSJSONReadingMutableContainers error:&error];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, dd MMM yyyy"];
     
    NSEnumerator* e = [collectionDates objectEnumerator];
    NSDate* date;
    NSTimeInterval daysFromToday;
    
    id object;
    while (object = [e nextObject])
    {
        date = [dateFormatter dateFromString:[object objectForKey:@"start"]];
        daysFromToday = [date timeIntervalSinceNow] / 86400;
        
        // if we found an entry for the current week
        if(daysFromToday > 0.0 && daysFromToday < 7.0)
        {
            DLog(@"date: %@, daysFromToday %g", date, daysFromToday);
            [self setNextCollectionDate:date];
            [self setNextCollectionIsYardwaste:[self isRecycleInTitle:[object objectForKey:@"title"]]];
            break;
        }
        
    }
}

-(BOOL)isRecycleInTitle:(NSString*)title
{
    return YES; // tbd implementation
}

@end
