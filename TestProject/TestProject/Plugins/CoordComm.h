
/*
CoordComm.h
Written by Ajay Ramesh in 6/13
In order to use this plugin, you must include the companion CoordComm.js file in your /www directory.
Next, go to your config.xml folder and add the following:
 <plugins>
 <plugin name="CoordComm" value="CoordComm" />
 </plugins>
NOTICE: <plugin></plugin> will be deprecated in future releases of Cordova, so you will need to write this instead:
 <feature name="CoordComm">
 <param name="ios-package" value="CoordComm">
 </feature>
NOTICE:
Xcode will throw deprecation warnings for the rest of Cordova's libs, however this code is compliant with the latest release of iOS6 and Xcode 4.6.
*/

#import <Cordova/CDV.h>
#import <CoreLocation/CoreLocation.h>

@interface CoordComm : CDVPlugin <CLLocationManagerDelegate>
{
    
    CLLocationManager* userLocationManager; //Apple's location manager.
    NSArray* coordArray; //Non-mutable array that will only have two elements (latitude and longitude)
}


-(void)getCoords:(CDVInvokedUrlCommand*)coordRequest;

@property (strong,nonatomic) NSString* latitude;
@property (strong,nonatomic) NSString* longitude;
@property (strong,nonatomic) CDVInvokedUrlCommand* command; 
@end
