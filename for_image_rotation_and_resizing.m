contents = dir('C:\Users\Owner\Desktop\sharp and eraser\eraser\*.jpg') % or whatever the filename extension is
 nfiles = length(contents); 
for k = 1 : nfiles
  b = imread(strcat('C:\Users\Owner\Desktop\sharp and eraser\eraser\',contents(k).name));
  n = imresize(b,[500,600]);
  name = sprintf('%d.jpg',k);
  destinationfolder = 'C:\Users\Owner\Documents\MATLAB\';
  destfile = fullfile(destinationfolder,name);
  imwrite(n,destfile)
  %imwrite (n,sprintf('%d.jpg',k));
end
