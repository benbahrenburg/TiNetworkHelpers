/**
 * benCoding TiNetworkHelpers
 * Copyright (c) 2009-2012 by Ben Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiProxy.h"

@interface BencodingNetworkCurrentNetworkProxy : TiProxy {
    NSString *SSID;
    NSString *BSSID;
}
@property(readonly,nonatomic) NSString *SSID;
@property(readonly,nonatomic) NSString *BSSID;

@end
