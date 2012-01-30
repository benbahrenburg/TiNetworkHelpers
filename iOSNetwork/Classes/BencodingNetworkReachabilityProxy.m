/**
 * benCoding TiNetworkHelpers
 * Copyright (c) 2009-2012 by Ben Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "BencodingNetworkReachabilityProxy.h"
#import "TiUtils.h"
#import "ASI/Reachability.h"
@implementation BencodingNetworkReachabilityProxy

NSString * const networkStatusNotReachable = @"NOT_REACHABLE";
NSString * const networkStatusWiFi = @"WIFI";
NSString * const networkStatusWWAN = @"WWAN";

MAKE_SYSTEM_STR(NETWORK_STATUS_NOT_REACHABLE,networkStatusNotReachable);
MAKE_SYSTEM_STR(NETWORK_STATUS_WIFI,networkStatusWiFi);
MAKE_SYSTEM_STR(NEWORK_STATUS_WWAN,networkStatusWWAN);

-(NSNumber*)reachabilityWithHostName:(id)args
{

    enum Args {
		khostName = 0,
		kArgCount
	};
    ENSURE_ARG_COUNT(args, kArgCount);
    //Uncomment to made debugging easier
    //NSLog(@"[Reachability] reachabilityWithHostName received %d arguments", kArgCount);
    
    NSString *hostName = [TiUtils stringValue:[args objectAtIndex:khostName]];
    
    BOOL isReachable = YES;
    Reachability *reachable = [Reachability reachabilityWithHostName:hostName];
    NetworkStatus internetStatus = [reachable currentReachabilityStatus];
    if(internetStatus == NotReachable) {
        isReachable= NO;
    }
    return NUMBOOL(isReachable);      
}

-(NSNumber*) reachabilityForLocalWiFi:(id)arg
{
    BOOL isReachable=NO;
    Reachability* wifiReach = [Reachability reachabilityForLocalWiFi];    
    NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
    if(netStatus==ReachableViaWiFi)
    {
        isReachable=YES; 
    }

    return NUMBOOL(isReachable);    
  
}
-(NSString*)hostNameReachableBy:(id)args
{
    enum Args {
		khostName = 0,
		kArgCount
	};
    ENSURE_ARG_COUNT(args, kArgCount);
    //Uncomment to made debugging easier
    //NSLog(@"[Reachability] reachabilityWithHostName received %d arguments", kArgCount);
    
    NSString *hostName = [TiUtils stringValue:[args objectAtIndex:khostName]];
    
    NSString * networkResults = networkStatusNotReachable;
    Reachability *reachable = [Reachability reachabilityWithHostName:hostName];
    NetworkStatus remoteHostStatus = [reachable currentReachabilityStatus];

    if (remoteHostStatus == ReachableViaWiFi)
    {
        networkResults= networkStatusWiFi;
    }
    else if (remoteHostStatus == ReachableViaWWAN)
    {
        networkResults= networkStatusWWAN;
    }
    
    return networkResults;
}

@end
