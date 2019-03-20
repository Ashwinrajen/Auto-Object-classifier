rootFolder = fullfile('C:\Users\Owner\Documents\MATLAB\perfect_combined\', 'sharp and eraser');
categories = {'eraser', 'sharpener'};
imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
tbl = countEachLabel(imds)

minSetCount = min(tbl{:,2}); % determine the smallest amount of images in a category
% Use splitEachLabel method to trim the set.

imds = splitEachLabel(imds, minSetCount, 'randomize');

% Notice that each set now has exactly the same number of images.
countEachLabel(imds)
[trainingSet, validationSet] = splitEachLabel(imds, 0.4, 'randomize');

% Find the first instance of an image for each category
eraser = find(trainingSet.Labels == 'eraser', 1);
sharpener = find(trainingSet.Labels == 'sharpener', 1);

% figure
%subplot(1,3,1);
%imshow(readimage(trainingSet,airplanes))
%subplot(1,3,2);
%imshow(readimage(trainingSet,ferry))

bag = bagOfFeatures(trainingSet);
sampleimg = readimage(imds, 1);
featureVector = encode(bag, sampleimg);

% Plot the histogram of visual word occurrences
figure
bar(featureVector)
title('Visual word occurrences')
xlabel('Visual word index')
ylabel('Frequency of occurrence')
categoryClassifier = trainImageCategoryClassifier(trainingSet, bag);
confMatrix = evaluate(categoryClassifier, trainingSet);
confMatrix = evaluate(categoryClassifier, validationSet);

% Compute average accuracy
mean(diag(confMatrix));




