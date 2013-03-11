//
//  YORDataController.m
//  YardwasteOrRecycle
//
//  Created by Shyam Harabakada on 3/9/13.
//  Copyright (c) 2013 moii. All rights reserved.
//

//
// SAMPLE API RESPONSE DATA
//
// [
//   {
//     "id": 0,
//     "title": "<img src='/UTIL/WARP/images/FYIcon32.gif' width='30px' height='35px' />
//               <img src='/UTIL/WARP/images/GarbageIcon32.gif' width='30px' height='35px' />
//               <img src='/UTIL/WARP/images/RecycleIcon32.gif' width='30px' height='35px' />",
//     "start": "Fri, 01 Mar 2013",
//     "end": null,
//     "url": null,
//     "allDay": true,
//     "delimitedData": null,
//     "status": null
//   },
//   ...
// ]
// 


#import "YORDataController.h"

// private methods
@interface YORDataController ()
-(BOOL)isRecycleInTitle:(NSString*)title;
@end

@implementation YORDataController

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
            [self setNextCollectionIsRecycle:[self isRecycleInTitle:[object objectForKey:@"title"]]];
            break;
        }
        
    }
}

-(BOOL)isRecycleInTitle:(NSString*)title
{
    if([title rangeOfString:@"RecycleIcon32"].location == NSNotFound)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

@end
