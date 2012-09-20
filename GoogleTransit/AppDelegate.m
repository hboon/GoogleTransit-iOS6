//
//  AppDelegate.m
//  GoogleTransit
//
//  Created by Simon Maddox on 20/09/2012.
//  Copyright (c) 2012 Simon Maddox. All rights reserved.
//

#import "AppDelegate.h"
#import <MapKit/MapKit.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
	if ([MKDirectionsRequest isDirectionsRequestURL:url]){
		
		MKDirectionsRequest *directionsRequest = [[MKDirectionsRequest alloc] initWithContentsOfURL:url];
		
		NSString *directionsURLString = [NSString stringWithFormat:@"https://maps.google.com/maps?f=d&source=s_d&saddr=%f,%f&daddr=%f,%f&hl=en&vps=3&jsv=432b&vpsrc=0&gl=us&dirflg=r&ttype=now&noexp=0&noal=0&sort=def&mra=atm&ie=UTF8&ui=maps_mini",
										 directionsRequest.source.placemark.location.coordinate.latitude,
										 directionsRequest.source.placemark.location.coordinate.longitude,
										 directionsRequest.destination.placemark.location.coordinate.latitude,
										 directionsRequest.destination.placemark.location.coordinate.longitude];
		
		NSURL *directionsURL = [NSURL URLWithString:directionsURLString];
		
		[[UIApplication sharedApplication] openURL:directionsURL];
		
		return YES;
	}
	return NO;
}

@end
