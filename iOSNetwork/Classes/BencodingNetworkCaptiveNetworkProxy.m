/**
 * benCoding Network
 * Copyright (c) 2009-2012 by Ben Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "BencodingNetworkCaptiveNetworkProxy.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <time.h>
#include <dlfcn.h>
#import "TiUtils.h"

@implementation BencodingNetworkCaptiveNetworkProxy

-(NSDictionary*)findInfo:(id)unused
{
    if([UIImage instancesRespondToSelector:@selector(flipsForRightToLeftLayoutDirection)]){        
        NSLog(@"[ERROR] Apple has removed the CaptiveNetwork in iOS9. There is not work around provided in this module. You will need to create a module using NEHotspotHelper and request a custom entitlement from Apple.")
        
        return;
    }
    
    NSString * informationUnknown = @"unknown";
    @try {
        
#if TARGET_IPHONE_SIMULATOR
        
        NSMutableDictionary *simulatorData = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                              NUMBOOL(YES),@"isSimulator",
                                              @"simulator",@"SSID",
                                              @"AA:BB:CC:DD:EE:FF",@"BSSID",
                                              nil];
        
        return simulatorData;
        
#else
        
        CFArrayRef interfaces = CNCopySupportedInterfaces();
        CFIndex count = CFArrayGetCount(interfaces);
        CFDictionaryRef captiveNtwrkDict =
        CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(interfaces, 0));
        NSDictionary *dict = ( __bridge NSDictionary*) captiveNtwrkDict;
        CFRelease(interfaces);//Use CFRelease here instead of your standard release
        
        NSMutableDictionary *networkData = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                            NUMBOOL(NO),@"isSimulator",
                                            (([dict objectForKey:@"SSID"]==nil)?
                                             informationUnknown :[dict objectForKey:@"SSID"]),@"SSID",
                                            (([dict objectForKey:@"BSSID"]==nil)?
                                             informationUnknown :[dict objectForKey:@"BSSID"]),@"BSSID",
                                            nil];
        
        return networkData;
#endif        
    }

    
    @catch (NSException * e) {
        NSLog(@"Init Exception: %@", e);
        return nil;
    }
}

@end
