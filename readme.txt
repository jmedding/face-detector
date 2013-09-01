This is a very basic Sinatra app that accepts a post request with an image file attached and returns the coordinates of any faces detected in JSON format.

The face detection uses the openCV 'Haar classifier' and is based on their example program.

The app is intended run as a web service for my photo id web-app, but it includes an upload page that can be used for manual testing.

It first saves the image file to the 'uploads' directory and then searches for a face.  If none are found, it rotates the image and tries again. If no image is found, it rotates it the other way and tries one last time.  It does not try to turn the image upside-down (most people are not going to take pictures with the camera upside done).

This face detector is optimized for locating the face and it's features in pictures used for ID photos. That means it expects the person to be looking at the camera.  Also, the detector seems to work best with pictures that have ~600px in the vertical direction.  Pictures with 300px heights are problematic. Larger images work as well,  but detection time can be quite long, so scaling the pictures before uploading is highly recommended. IT also saves bandwith :-).

The results are formatted in JSON for example:

{ 
  "status": "success","messages": "", "rotation": 1, "x": 221, "y": 221, "height": 128, "width": 128, 
  "eye_left" : { "x": 36, "y": 47, "height": 27, "width": 40}, 
  "eye_right" : { "x": 89, "y": 44, "height": 27, "width": 41}, 
  "mouth" : { "x": 65, "y": 107, "height": 27, "width": 45}
}

status:     'success' if face detected
messages:   '' (empty) if face detected
rotation:   Orientation of face (0: no rotation, 1: image rotated ccw, -1: image rotated cw)

The returned coordinates are based on the following reference frames:
  - face => image (with upper left corner at 0,0)
  - eyes, mouth => face (with upper left corner of face at 0,0)
  
This means that if the face is at (x=100, y=200) the upper left corner of the face is 100 pixels down and 200 pixels to the right of the top left corner of the image. If the mouth is at (x=40, y=60) then the top left corner of the mouth is 40 down and 60 over from the top left corner of the face.

It will probably not detect faces that are looking away or with their features covered by hair or sunglasses.

Feel free to use any parts of this program for your own purposes.

This work is licensed under the MIT License (basically it means do what ever you want with it, but don't come crying to me if it breaks).  Please note that the classifiers (in the classifier directory) are licensed seperately, although the conditions are similar.




Copyright (c) 2012 Jonathan Medding

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: 

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

