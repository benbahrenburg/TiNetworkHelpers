/**
 * benCoding TiNetworkHelpers
 * Copyright (c) 2009-2012 by Ben Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "BencodingNetworkCarrierInfoProxy.h"
#import "BencodingNetworkHelpers.h"
#import "TiUtils.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
@implementation BencodingNetworkCarrierInfoProxy

@synthesize allowsVOIP, carrierName, mobileCountryCode,mobileNetworkCode,isoCountryCode;


-(id)init
{
	// This is the designated initializer method and will always be called
	// when the proxy is created.
    
#if TARGET_IPHONE_SIMULATOR
    carrierName = [@"simulator" retain];
    allowsVOIP =[NUMBOOL(NO) retain];
    mobileCountryCode = [informationUnknown retain];
    mobileNetworkCode = [informationUnknown retain];
    isoCountryCode = [informationUnknown retain];
#else
    CTTelephonyNetworkInfo *networkInfo = [[[CTTelephonyNetworkInfo alloc] init] autorelease];
    CTCarrier *carrier = [networkInfo subscriberCellularProvider];
    BencodingNetworkHelpers * helpers = [[BencodingNetworkHelpers alloc] init];
    //The name of the user’s home cellular service provider. 
    //If we can't find one then we use unknown
    //Usually unknown seems to always appear in the simulator
    carrierName = [[helpers nilToKnown:[carrier carrierName]] retain];
    
    //The mobile country code (MCC) for the user’s cellular service provider.
    //Usually unknown seems to always appear in the simulator
    mobileCountryCode = [[helpers nilToKnown:[carrier mobileCountryCode]] retain];
    
    //The mobile network code (MNC) for the user’s cellular service provider
    //Usually unknown seems to always appear in the simulator
    mobileNetworkCode =[[helpers nilToKnown:[carrier mobileNetworkCode]] retain];

    //Populate the property with if the carrier supports VOIP
    allowsVOIP=[NUMBOOL([carrier allowsVOIP]) retain];
    
    //The ISO country code for the user’s cellular service provider.
    isoCountryCode = [[helpers nilToKnown:[carrier isoCountryCode]] retain];
    
    [helpers release];
#endif
    
    //Uncomment to made debugging easier
    //NSLog(@"Carrier: %@", carrierName);
    //NSLog(@"allowsVOIP: %@", allowsVOIP);
    //NSLog(@"Mobile Country Code (MCC): %@", mobileCountryCode);
    //NSLog(@"Mobile Network Code (MNC): %@", mobileNetworkCode);    
    //NSLog(@"Carrier ISO Code (ISO): %@", isoCountryCode);
    
	return [super init];
}

-(void)_destroy
{
	// This method is called from the dealloc method and is good place to
	// release any objects and memory that have been allocated for the proxy.
    RELEASE_TO_NIL(allowsVOIP); 
    RELEASE_TO_NIL(carrierName);
	RELEASE_TO_NIL(mobileCountryCode);
    RELEASE_TO_NIL(mobileNetworkCode);    
    RELEASE_TO_NIL(isoCountryCode);   
	[super _destroy];
}

-(void)dealloc
{
	// This method is called when the proxy is being deallocated. The superclass
	// method calls the _destroy method.
    
	[super dealloc];
}

-(id)_initWithPageContext:(id<TiEvaluator>)context
{
	// This method is one of the initializers for the proxy class. If the
	// proxy is created without arguments then this initializer will be called.
	// This method is also called from the other _initWithPageContext method.
	// The superclass method calls the init and _configure methods.
    
	//NSLog(@"[PROXY LIFECYCLE EVENT] _initWithPageContext (no arguments)");
    
	return [super _initWithPageContext:context];
}

-(id)_initWithPageContext:(id<TiEvaluator>)context_ args:(NSArray*)args
{
	// This method is one of the initializers for the proxy class. If the
	// proxy is created with arguments then this initializer will be called.
	// The superclass method calls the _initWithPageContext method without
	// arguments.
    
	//NSLog(@"[PROXY LIFECYCLE EVENT] _initWithPageContext %@", args);
    
	return [super _initWithPageContext:context_ args:args];
}

-(void)_configure
{
	// This method is called from _initWithPageContext to allow for
	// custom configuration of the module before startup. The superclass
	// method calls the startup method.
    
	//NSLog(@"[PROXY LIFECYCLE EVENT] _configure");
    
	[super _configure];
}

-(void)_initWithProperties:(NSDictionary *)properties
{
	// This method is called from _initWithPageContext if arguments have been
	// used to create the proxy. It is called after the initializers have completed
	// and is a good point to process arguments that have been passed to the
	// proxy create method since most of the initialization has been completed
	// at this point.
    
	//NSLog(@"[PROXY LIFECYCLE EVENT] _initWithProperties %@", properties);
    
	[super _initWithProperties:properties];
}

-(void)close:(id)args
{
    // Provide for API parity with Android 
}

@end
