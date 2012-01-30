/**
 * benCoding TiNetworkHelpers
 * Copyright (c) 2009-2012 by Ben Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import <Foundation/Foundation.h>

@interface BencodingNetworkHelpers : NSObject

extern NSString * const informationUnknown;
-(NSString *)nilToKnown:(NSString *)valueToCheck;
BOOL isNumeric(NSString *s);
@end
