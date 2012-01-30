/**
 * benCoding TiNetworkHelpers
 * Copyright (c) 2009-2012 by Ben Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiProxy.h"

@interface BencodingNetworkCarrierInfoProxy : TiProxy {
    NSNumber *allowsVOIP;
    NSString *carrierName;
    NSString *mobileCountryCode;
    NSString *mobileNetworkCode;
    NSString *isoCountryCode;    
}

@property(readonly,nonatomic) NSNumber *allowsVOIP;
@property(readonly,nonatomic) NSString *carrierName;
@property(readonly,nonatomic) NSString *mobileCountryCode;
@property(readonly,nonatomic) NSString *mobileNetworkCode;
@property(readonly,nonatomic) NSString *isoCountryCode;

@end
