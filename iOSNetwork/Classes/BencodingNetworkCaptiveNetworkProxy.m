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
@implementation BencodingNetworkCaptiveNetworkProxy

-(NSDictionary*)findInfo:(id)unused
{
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
        NSDictionary *dict = ( NSDictionary*) captiveNtwrkDict;
        CFRelease(interfaces);//Use CFRelease here instead of your standard release
        
        NSMutableDictionary *networkData = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                            NUMBOOL(NO),@"isSimulator",
                                            (([dict objectForKey:@"SSID"]==nil)?
                                             informationUnknown :[dict objectForKey:@"SSID"]),@"SSID",
                                            (([dict objectForKey:@"BSSID"]==nil)?
                                             informationUnknown :[dict objectForKey:@"BSSID"]),@"BSSID",
                                            nil];
        
        [dict release];
        
        return networkData;
#endif        
    }

    
    @catch (NSException * e) {
        NSLog(@"Init Exception: %@", e);
        return nil;
    }
}

//@try {
//
//    NSLog(@"Step 1");
//    CFArrayRef interfaces = CNCopySupportedInterfaces();
//    NSLog(@"Step 2");
//    CFIndex count = CFArrayGetCount(interfaces);
//    NSLog(@"Step 3");
//    for (int i = 0; i < count; i++) {
//        CFStringRef interface = CFArrayGetValueAtIndex(interfaces, i);
//        CFDictionaryRef netinfo = CNCopyCurrentNetworkInfo(interface);
//        if (netinfo && CFDictionaryContainsKey(netinfo, kCNNetworkInfoKeySSID)) {
//            NSString *ssid = ( NSString *)CFDictionaryGetValue(netinfo, kCNNetworkInfoKeySSID);
//            // Compare with your needed ssid here
//            NSLog(@"ssid: %@", ssid);
//        }
//
//        if (netinfo)
//            CFRelease(netinfo);
//    }
//    CFRelease(interfaces);
//    return nil;
//
//}
//@catch (NSException * e) {
//    NSLog(@"Init Exception: %@", e);
//    return nil;
//}
@end
