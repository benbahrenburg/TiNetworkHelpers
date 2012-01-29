//
//  Helpers.m
//  iosnetwork
//
//  Created by Ben Bahrenburg on 1/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

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
