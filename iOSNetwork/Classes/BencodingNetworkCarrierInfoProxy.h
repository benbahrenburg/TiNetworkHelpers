/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2012 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiProxy.h"

@interface BencodingNetworkCarrierInfoProxy : TiProxy {
    NSString *simCarrierName;
    NSString *simCarrierCountryCode;
    NSString *simCarrierNetworkCode;
}

@property(readonly,nonatomic) NSString *simCarrierName;
@property(readonly,nonatomic) NSString *simCarrierCountryCode;
@property(readonly,nonatomic) NSString *simCarrierNetworkCode;

@end
