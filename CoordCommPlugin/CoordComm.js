window.getCoords = function(callback)
{
    cordova.exec(callback,function(error)   //executes the callback function that is passed in from implementation
                 {
                 alert('Error fetching location.'); //Anonymous error function callback
                 },"CoordComm","getCoords",[]); //"CoordComm" is the Objective-C class "getCoords" is the name of the Objective-C method. "[]" empty parameters
}


/*  EXAMPLE USAGE */
/*


 window.getCoords(function(coords) {
 
 console.log(coords[0]);
 console.log(coords[1]);
 
 
 });


Call window.getCoords() with your Javascript callback function. Coords will return as an array with only two elements. [0] for Latitude, and [1] for longitude. They are currently returned as string variables. 



*/