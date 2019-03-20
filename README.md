# Auto-Object-classifier
## --Project by R.Ashiwin--
#### SASTRA Deemed University
#### Feb 2019-March 2019
**Hello Readers!**

Let’s begin with the overall idea or summary of the project.
Since it is a prototype model, I didn't concentrate much on developing a perfect mechanical structure or view.
I used the technique to classify eraser and sharpener.

I collected the images of various shapes and sizes of erasers and sharpeners of about 67 images of erasers and 125 images of sharpeners at different orientation. In order to make the exact count of images of objects, I just augmented or increased the datasets of erasers with different orientations and made into the equal count of 125.

Next I gave these images to Bag of Features algorithm, which takes the features present in each image and categorize it into several bag of vectors. And the images are trained using this algorithm. When we give a test image using image classifier function, it correctly classifies the object based on the given labels. This algorithm predicted the eraser with an accuracy of 71% and sharpener with 99%. And the overall accuracy seems to be 85% Thus Machine learning algorithm is used to categorize the objects.

For a real time application, we have to use a camera to take the image and test it with the trained datasets. Thus I used Raspberry pi in this case, which is connected with a camera. The SD card is booted with the Raspbian OS which is done by using the MATLAB, Raspberry pi setup with the LAN connection. We should make sure that everything is connected within the same Local area network. The SD card is inserted into the Raspberry pi and it works with the WIFI. At the same time, an IR sensor is connected with the Raspberry pi. It’s better to use Raspberry pi 3 as it has the ability of in-built WIFI communication.

The respective object is carried on a conveyor belt, which is operated by two DC motors with some delay in clockwise direction. As soon as the object reaches the end of the conveyor, it falls into the box, which is created with some calculations in slope so as to make the object to fall into it, on the desired position.
Inside the box, an IR sensor is placed. When the object falls, it covers the IR sensor. Thus making it able to realise that the object is detected. Since the IR sensor is connected to Raspberry pi, once the object is detected it takes the snapshot of the object. It is given as a test image and it returns the corresponding label of an object, it again opens the port to arduino and sends signal to arduino to perform the corresponding actuation task. In my case, I had actually used the servo motor to make an actuation. When it detects sharpener, it pushes it to right side making a 90 degree turn-clockwise and when it detects eraser, it pushes the object to the left side making a 90 degree turn-anticlockwise. I had also made an indicator (LED’s) for both objects.

Industries are using this technique to separate the defective and non-defective parts or objects using this machine learning approach.
 The project which I had done is a prototype model! Of an object classifier

The challenges which I faced  is,
* Making it as a Real time application
* Integrating computer vision and actuation

## This video shows the [Final Robot](https://www.youtube.com/watch?v=G70JtGIui3U).
