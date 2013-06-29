##CoordComm##

This is a repository for the CoordComm Cordova plugin. 
It utilizes a Javascript interface to handle a return from a Cordova execution. The Cordova execution runs a method inside the Objective-C class that finds the user's location in latitude and longitude. 
This return is in the form of an array. The latitude and longitude can be accessed by getting the `[0]` and `[1]` elements respectively.
Note that this has nothing to do with HTML5 Geolocation, rather it handles all the location data in Objective-C. 

#Installation#

To install the plugin, you must first have a Cordova project set up. 
Download [Cordova](http://cordova.apache.org/) and follow the [Getting Started Guide](http://cordova.apache.org/docs/en/2.6.0/guide_getting-started_ios_index.md.html#Getting%20Started%20with%20iOS).

* Navigate to the folder that has been created with your new Cordova project.
* Delete all the HelloWorld sample project files, or modify them if you wish.
* In Finder, navigate to the /www/js directory of the Cordova project, and drop in the CoordComm.js file.
    + NOTE: The /www is readonly once opened in Xcode. Any file changes must be made in Finder!
* Drag and drop the CoordComm.h and CoordComm.m class files inside the Plugins folder of your Cordova project.
    + NOTE: This can be done inside Xcode if you wish.

Add the following lines in your config.xml file:

    <plugins>
    <plugin name="CoordComm" value="CoordComm" />
    </plugins>
 

#Usage#
Make sure you run the project once before making any changes, to see if Xcode throws out any errors. There will be a couple deprecation warnings regarding the Cordova framework, but they can be ignored until Cordova is updated.

* Now that you have all the files set up, you can begin implementing them. First, import CoordComm.js into wherever you are using geolocation in your app
  `<script type="text/javascript" src="js/CoordComm.js"></script>`
* Next, call `window.getCoords()` function with your own callback. 

#Example Implementation#
       
       <script type="text/javascript" src="js/CoordComm.js"></script>
       <script>
       window.getCoords(function(coords)
       {
       var latitude = coords[0]; //First element is always latitude
       var longitude = coords[1]; //Second element is always longitude
       });
       </script>

#Notes/Warnings#
* iOS Simulator is a SIMULATOR and cannot interpret your actual location. The result of your run in the simulator will be a dummy latitude and longitude.
* This readme will be updated once a new version of Cordova comes out and when there are changes, such as the <feature> tag. 
* Cordova warnings do not have to do with the CoordComm class, but with compatibility issues between the Xcode 4.6.x,iOS6.x+,and the current versions of Cordova.





