if ~isempty(instrfind)     %this ensures the port for arduino is free
    fclose(instrfind);     %if any port is ongoing it closes the port
    delete(instrfind);     %and it deletes the port to make it executable for upcoming task
end
delete(instrfindall);      %Same as above
x=serial('COM14','BAUD', 9600); %ensures the baud rate and port number for arduino and defines it
fopen(x);                   %it opens the port for corresponding serial communication


count = 0;                  %count initialized with zero , it counts the number of objects detected
while(1)
    if(flag==1)
        disp('no object detected');
        pause(2.0)
    end
    configurePin(mypi,23,'DigitalInput');   %to configure the pin of irsensor 
    pinstate = readDigitalPin(mypi, 23);    %reads the status of it
    if(pinstate==0)                         
        irdetect=1;                         %if object is detected it shows one
        flag=0
    while(irdetect) 
   pause(5.0)                               %to give a gap so that it makes sures that the object stays i the position for a time
        count = count + 1
        img = snapshot(mycam);
        img = snapshot(mycam);
        img = snapshot(mycam);
        img = snapshot(mycam);%Takes a snapshot
        name = sprintf('%d.jpg',count)
        image(img);
        drawnow;
        destinationfolder = 'C:\Users\Owner\Documents\MATLAB\';
        destfile = fullfile(destinationfolder, name);
        imwrite(img,destfile)
        flag=1
        
        img1 = imread(fullfile('C:\Users\Owner\Documents\MATLAB\',sprintf('%d.jpg',count)));
        [labelIdx, scores] = predict(categoryClassifier,img1);
        categoryClassifier.Labels(labelIdx)
        a=categoryClassifier.Labels(labelIdx)
        
        
        b=strcmp(a,'eraser')
        c=strcmp(a,'sharpener')
        if b==1
            disp('Arduino will execute for eraser code')
            n=1;
            fprintf(x,n);
        else c==1
            disp('Arduino will execute for sharpener code')
            n=2;
            fprintf(x,n);
        end
        
        
            break;
    end
    else
        disp('no object detected');
    end
end

