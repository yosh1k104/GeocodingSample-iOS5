//
//  ViewController.m
//  GeocodingSample-iOS5
//
//  Created by Katsuya Kato on 12/03/23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
- (void)geocorde:(NSString *)place;
- (void)reverseGeocordeWithLatitude:(double)latitude longitude:(double)longitude;
@end

@implementation ViewController
@synthesize textFieldAddressString;
@synthesize textFieldLatitude;
@synthesize textFieldLongitude;

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)viewDidUnload
{
  [self setTextFieldLatitude:nil];
  [self setTextFieldLongitude:nil];
  [self setTextFieldAddressString:nil];
  [super viewDidUnload];
  // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
  [textFieldLatitude release];
  [textFieldLongitude release];
  [textFieldAddressString release];
  [super dealloc];
}
- (IBAction)handleReverseGeocode:(id)sender {
  [self.view endEditing:NO]; 
  [self reverseGeocordeWithLatitude:[textFieldLatitude.text doubleValue]
                          longitude:[textFieldLongitude.text doubleValue]];
}

- (IBAction)handleGeocode:(id)sender {
  [self.view endEditing:NO]; 
  [self geocorde:textFieldAddressString.text];
}

- (void)geocorde:(NSString *)addressString {
  CLGeocoder *geocoder = [[[CLGeocoder alloc] init] autorelease];
  [geocoder geocodeAddressString:addressString
               completionHandler:^(NSArray* placemarks, NSError* error) {
                 // 住所からジオコーディングを行った結果（場所）の数
                 NSLog(@"found : %d", [placemarks count]);
                 for (CLPlacemark* placemark in placemarks) {
                   // それぞれの結果（場所）の情報
                   NSLog(@"latitude : %f", placemark.location.coordinate.latitude);
                   NSLog(@"longitude : %f", placemark.location.coordinate.longitude);
                 }
               }];
}

- (void)reverseGeocordeWithLatitude:(double)latitude longitude:(double)longitude {
  
  CLGeocoder *geocoder = [[[CLGeocoder alloc] init] autorelease];
  CLLocation *location = [[[CLLocation alloc] initWithLatitude:latitude
                                                     longitude:longitude] autorelease];
  
  [geocoder reverseGeocodeLocation:location
                 completionHandler:^(NSArray* placemarks, NSError* error) {
                   // 経度、緯度から逆ジオコーディングを行った結果（場所）の数
                   NSLog(@"found : %d", [placemarks count]);
                   
                   for (CLPlacemark *placemark in placemarks) {
                     // それぞれの結果（場所）の情報
                     NSLog(@"addressDictionary : %@", [placemark.addressDictionary description]);
                     
                     NSLog(@"name : %@", placemark.name);
                     NSLog(@"thoroughfare : %@", placemark.thoroughfare);
                     NSLog(@"subThoroughfare : %@", placemark.subThoroughfare);
                     NSLog(@"locality : %@", placemark.locality);
                     NSLog(@"subLocality : %@", placemark.subLocality);
                     NSLog(@"administrativeArea : %@", placemark.administrativeArea);
                     NSLog(@"subAdministrativeArea : %@", placemark.subAdministrativeArea);
                     NSLog(@"postalCode : %@", placemark.postalCode);
                     NSLog(@"ISOcountryCode : %@", placemark.ISOcountryCode);
                     NSLog(@"country : %@", placemark.country);
                     NSLog(@"inlandWater : %@", placemark.inlandWater);
                     NSLog(@"ocean : %@", placemark.ocean);
                     NSLog(@"areasOfInterest : %@", placemark.areasOfInterest);
                   }
                 }];
}

@end
