
#import "CoordComm.h"
#import <Cordova/CDV.h>

@implementation CoordComm
@synthesize latitude,longitude;

-(void)getCoords:(CDVInvokedUrlCommand *)coordRequest
{
    self.command = coordRequest; //temporarily saves the CDV command, to send to locationManager:didUpdateLocations, since the latter method is async
    CDVPluginResult* pluginResultError = nil;
    if(coordRequest)
    {
        //Standard setup of CLLocationManager
        userLocationManager = [[CLLocationManager alloc]init];
        userLocationManager.delegate = self;
        userLocationManager.distanceFilter = kCLDistanceFilterNone;
        userLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [userLocationManager startUpdatingLocation];
        
        
    }
    else {
        
        pluginResultError = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

}




-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation* location = newLocation;
    CDVPluginResult* pluginResultSuccess = nil;
    CDVInvokedUrlCommand* newCommand = self.command; //Retrieves the previously stored CDV command
    float lat = location.coordinate.latitude; 
    float lon = location.coordinate.longitude;
    self.latitude = [NSString stringWithFormat:@"%f",lat];  //Converts the two floats into NSString objects
    self.longitude = [NSString stringWithFormat:@"%f",lon];
    coordArray = [[NSArray alloc]init];
    coordArray = [NSArray arrayWithObjects:self.latitude,self.longitude, nil]; //Populates coordArray 
    pluginResultSuccess = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:coordArray];
    [userLocationManager stopUpdatingLocation];
    [self.commandDelegate sendPluginResult:pluginResultSuccess callbackId:newCommand.callbackId]; //finally sends the array back to the related Javascript function with the original callbackId which is a property of the retrieved CDVInvokedPluginResultCommand (newCommand)
    
}



@end
