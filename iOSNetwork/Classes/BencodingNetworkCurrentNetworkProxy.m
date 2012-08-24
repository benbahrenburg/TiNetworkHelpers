/**
 * benCoding TiNetworkHelpers
 * Copyright (c) 2009-2012 by Ben Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "BencodingNetworkCurrentNetworkProxy.h"
#import "BencodingNetworkHelpers.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
@implementation BencodingNetworkCurrentNetworkProxy
@synthesize SSID, BSSID;


-(id)init
{
    if (self = [super init])
    {
        @try {
            BencodingNetworkHelpers * helpers = [[BencodingNetworkHelpers alloc] init];
            CFArrayRef interfacesAr = CNCopySupportedInterfaces();
            CFDictionaryRef captiveNtwrkDict = 
            CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(interfacesAr, 0));
            NSDictionary *dict = (__bridge NSDictionary*) captiveNtwrkDict;
            CFRelease(interfacesAr);//Use CFRelease here instead of your standard release
            //Uncomment to made debugging easier
            //NSLog(@"dict before we put into properties: %@", dict);            
            SSID = [[helpers nilToKnown:[dict objectForKey:@"SSID"]] retain];
            BSSID = [[helpers nilToKnown:[dict objectForKey:@"BSSID"]] retain];
            
            //Uncomment to made debugging easier
            //NSLog(@"SSID: %@", SSID);
            //NSLog(@"BSSID: %@", BSSID); 
            
            [dict release];            
            [helpers release];
        }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
        }                
    }
    
    return self;
}

@end
