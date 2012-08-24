/**
 * benCoding TiNetworkHelpers
 * Copyright (c) 2009-2012 by Ben Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "BencodingNetworkHelpers.h"

@implementation BencodingNetworkHelpers

BOOL isNumeric(NSString *s)
{
    NSUInteger len = [s length];
    NSUInteger i;
    BOOL status = NO;
    
    for(i=0; i < len; i++)
    {
        unichar singlechar = [s characterAtIndex: i];
        if ( (singlechar == ' ') && (!status) )
        {
            continue;
        }
        if ( ( singlechar == '+' ||
              singlechar == '-' ) && (!status) ) { status=YES; continue; }
        if ( ( singlechar >= '0' ) &&
            ( singlechar <= '9' ) )
        {
            status = YES;
        } else {
            return NO;
        }
    }
    return (i == len) && status;
}

NSString * const informationUnknown = @"unknown";
-(NSString *)nilToKnown:(NSString *)valueToCheck
{
    if(valueToCheck==nil)
    {
        return informationUnknown;
    }
    else
    {
        return valueToCheck;
    }
    
}

@end
