/**
 * benCoding Network
 * Copyright (c) 2009-2012 by Ben Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "BencodingNetworkCarrierProxy.h"

@implementation BencodingNetworkCarrierProxy


-(NSDictionary*)findInfo:(id)unused
{
    NSString * informationUnknown = @"unknown";
    
#if TARGET_IPHONE_SIMULATOR
    
    NSMutableDictionary *simulatorData = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                          NUMBOOL(YES),@"isSimulator",
                                          @"simulator",@"carrierName",
                                          NUMBOOL(NO),@"allowsVOIP",
                                          informationUnknown,@"mobileCountryCode",
                                          informationUnknown,@"mobileNetworkCode",
                                          informationUnknown,@"isoCountryCode",
                                          nil];
    
    return simulatorData;
    
#else
    
    
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [networkInfo subscriberCellularProvider];
    
    NSMutableDictionary *deviceData = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       NUMBOOL(NO),@"isSimulator",
                                       (([carrier carrierName]==nil)?
                                        informationUnknown :[carrier carrierName]),@"carrierName",
                                       NUMBOOL([carrier allowsVOIP]),@"allowsVOIP",
                                       (([carrier mobileCountryCode]==nil)?
                                        informationUnknown :[carrier mobileCountryCode]),@"mobileCountryCode",
                                       (([carrier mobileNetworkCode]==nil)?
                                        informationUnknown :[carrier mobileNetworkCode]),@"mobileNetworkCode",
                                       (([carrier isoCountryCode]==nil)?
                                        informationUnknown :[carrier isoCountryCode]),@"isoCountryCode",
                                       nil];
    
    return deviceData;
#endif
    
}

@end
