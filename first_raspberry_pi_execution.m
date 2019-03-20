mypi=raspi
mycam = cameraboard(mypi,'Resolution','1280x720')
%img = snapshot(mycam);     to check whether raspberry pi camera sends
%signal or not.If the error comes like error receiving signal, try to
%restart the pi , disconnect and connect pi camera,and execute the
%commented line to make sure it works.