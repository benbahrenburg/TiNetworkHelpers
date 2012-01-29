//
//  Helpers.h
//  iosnetwork
//
//  Created by Ben Bahrenburg on 1/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BencodingNetworkHelpers : NSObject

extern NSString * const informationUnknown;
-(NSString *)nilToKnown:(NSString *)valueToCheck;
BOOL isNumeric(NSString *s);
@end
