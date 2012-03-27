//
//  ViewController.h
//  GeocodingSample-iOS5
//
//  Created by Katsuya Kato on 12/03/23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *textFieldLatitude;
@property (retain, nonatomic) IBOutlet UITextField *textFieldLongitude;
@property (retain, nonatomic) IBOutlet UITextField *textFieldAddressString;
- (IBAction)handleReverseGeocode:(id)sender;
- (IBAction)handleGeocode:(id)sender;
@end
